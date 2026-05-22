hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Video & Browser Inhibit
hl.window_rule({
    name = "idle-inhibit-media",
    match = { class = "^(.*celluloid.*|mpv|vlc|LibreWolf|floorp|brave-browser|firefox|chromium|zen|vivaldi|[Ss]potify)$" },
    idle_inhibit = "fullscreen"
})

-- Picture-in-Picture logic
hl.window_rule({
    name = "pip-behavior",
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    tag = "+pip",
    float = true,
    keep_aspect_ratio = true,
    pin = true,
    move = "(monitor_w*0.72) (monitor_h*0.72)",
    size = "(monitor_w*0.25) (monitor_h*0.25)"
})

-- High Opacity Browsers
hl.window_rule({
    name = "browser-opacity",
    match = { class = "^(firefox|brave-browser)$" },
    opacity = "0.90 0.90 1.0"
})

-- Standard Dev & Terminal Opacity (Ghostty added here for you!)
hl.window_rule({
    name = "dev-tools-opacity",
    match = { class = "^(code-oss|[Cc]ode|code-url-handler|code-insiders-url-handler|kitty|com.mitchellh.ghostty)$" },
    opacity = "0.95 0.95 1.0"
})

-- System & File Managers
hl.window_rule({
    name = "system-tools-opacity",
    match = { class = "^(org.kde.dolphin|org.kde.ark|nwg-look|qt5ct|qt6ct|kvantummanager)$" },
    opacity = "0.80 0.80 1.0"
})

-- Networking & Audio
hl.window_rule({
    name = "network-audio-opacity",
    match = { class = "^(org.pulseaudio.pavucontrol|blueman-manager|nm-applet|nm-connection-editor)$" },
    opacity = "0.80 0.70 1.0"
})

-- Polkit & Portals
hl.window_rule({
    name = "portal-opacity",
    match = { class = "^(org.kde.polkit-.*|polkit-gnome-.*|org.freedesktop.impl.portal.*)$" },
    opacity = "0.80 0.70 1.0"
})

-- Game Launchers & Music
hl.window_rule({
    name = "social-media-opacity",
    match = {
        class = "^([Ss]team|steamwebhelper|[Ss]potify)$",
        initial_title = "^(Spotify.*)$"
    },
    opacity = "0.70 0.70 1.0"
})

-- Floating Apps & Misc Opacity
hl.window_rule({
    name = "floating-apps",
    match = { class = "^(Signal|com.github.rafostar.Clapper|app.drey.Warp|net.davidotek.pupgui2|yad|eog|io.github.alainm23.planify|io.gitlab.theevilskeleton.Upscaler|com.github.unrud.VideoDownloader|io.gitlab.adhami3310.Impression|io.missioncenter.MissionCenter|io.github.flattool.Warehouse|com.github.tchx84.Flatseal|hu.kramo.Cartridges|com.obsproject.Studio|gnome-boxes|vesktop|discord|WebCord|ArmCord)$" },
    float = true,
    opacity = "0.80 0.80 1.0"
})

-- Jetbrains Fix
hl.window_rule({
    name = "jetbrains-focus-fix",
    match = {
        class = "^(.*jetbrains.*)$",
        title = "^(win[0-9]+)$"
    },
    no_initial_focus = true
})

hl.layer_rule({
    name = "panel-blur",
    match = { namespace = "^(wofi|notifications|swaync-notification-window|swaync-control-center|logout_dialog)$" },
    blur = true,
    ignore_alpha = 0.5
})
