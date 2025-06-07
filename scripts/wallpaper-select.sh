#!/usr/bin/env bash

# Config
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
THUMBNAIL_DIR="$HOME/.cache/wallpaper-thumbs"
THUMBNAIL_EXT="png"
THUMBNAIL_SIZE="300x168"  # thumbnail resolution (adjust as you like)
TERMINAL="ghostty"

mkdir -p "$THUMBNAIL_DIR"

# Hash function for thumbnail names
hash_filepath() {
    echo -n "$1" | md5sum | cut -d' ' -f1
}

# Get focused monitor from hyprctl
FOCUSED_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

if [[ -z "$FOCUSED_MONITOR" ]]; then
    notify-send -i dialog-error "Wallpaper Picker" "Could not detect focused monitor"
    exit 1
fi

# Find image wallpapers only (no video)
mapfile -d '' wallpaper_list < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.bmp' -o -iname '*.webp' \) -print0)

if [[ ${#wallpaper_list[@]} -eq 0 ]]; then
    notify-send -i dialog-error "Wallpaper Picker" "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

declare -a wallpaper_names
declare -a wallpaper_paths

# Populate wallpaper name and paths arrays
for wp in "${wallpaper_list[@]}"; do
    wallpaper_names+=( "$(basename "$wp")" )
    wallpaper_paths+=( "$wp" )
done

# Generate thumbnails if missing
for wp in "${wallpaper_paths[@]}"; do
    hash=$(hash_filepath "$wp")
    thumb="$THUMBNAIL_DIR/$hash.$THUMBNAIL_EXT"

    if [[ ! -f "$thumb" ]]; then
        convert "$wp" -resize "$THUMBNAIL_SIZE^" -gravity center -extent "$THUMBNAIL_SIZE" "$thumb"
    fi
done

# Build rofi input lines (with icon)
rofi_input=""
for i in "${!wallpaper_names[@]}"; do
    hash=$(hash_filepath "${wallpaper_paths[i]}")
    thumb="$THUMBNAIL_DIR/$hash.$THUMBNAIL_EXT"
    rofi_input+="${wallpaper_names[i]}\x00icon\x1f${thumb}\n"
done

# Show rofi menu with icons
SELECTED=$(echo -en "$rofi_input" | rofi -monitor -1 -dmenu -i -p "Pick wallpaper" -show-icons -theme ~/.config/rofi/wallpaper-picker.rasi -name "WallpaperPicker")

# Exit if no selection
[[ -z "$SELECTED" ]] && exit 0

# Find selected wallpaper index
index=-1
for i in "${!wallpaper_names[@]}"; do
    if [[ "${wallpaper_names[i]}" == "$SELECTED" ]]; then
        index=$i
        break
    fi
done

if (( index == -1 )); then
    notify-send -i dialog-error "Wallpaper Picker" "Selection not found"
    exit 1
fi

SELECTED_PATH="${wallpaper_paths[index]}"

# Apply wallpaper using hyprpaper on focused monitor
hyprctl hyprpaper preload "$SELECTED_PATH"
hyprctl hyprpaper wallpaper "$FOCUSED_MONITOR,$SELECTED_PATH"
hyprctl hyprpaper reload

notify-send -i "$SELECTED_PATH" "Wallpaper Picker" "Wallpaper set on $FOCUSED_MONITOR"
