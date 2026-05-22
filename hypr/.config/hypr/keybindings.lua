local WM = "Window Management"
local D = "[" .. WM .. "] "

hl.bind(MainMod .. " + Return", hl.dsp.exec_cmd(Terminal))
hl.bind(MainMod .. " + Q", hl.dsp.window.close())
hl.bind(MainMod .. " + M",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(MainMod .. " + F", hl.dsp.exec_cmd(FileManager))
hl.bind(MainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(MainMod .. " + D", hl.dsp.exec_cmd(Menu))
hl.bind(MainMod .. " + SHIFT + J", hl.dsp.layout("togglesplit"))
hl.bind(MainMod .. " + CONTROL + F", function()
    hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
end)
hl.bind("SHIFT + F11", hl.dsp.window.fullscreen(), { description = D .. "toggle fullscreen" })

-- caelestia keybind
hl.bind(MainMod .. " + D", hl.dsp.exec_cmd("caelestia shell drawers toggle launcher"))
hl.bind(MainMod .. " + N", hl.dsp.exec_cmd("caelestia shell drawers toggle sidebar"))

-- Hyprshot Screenshot
-- Color picker (Hex) >> clipboard
hl.bind(MainMod .. "+ SHIFT + P", hl.dsp.exec_cmd("hyprpicker -an"))
-- Screenshot a window
hl.bind(MainMod .. "+ PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- Screenshot a monitor
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a region
hl.bind(MainMod .. " + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))

-- Open apps
hl.bind(MainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"), {
    description = "Launch Google Chrome"
})

-- Move focus
hl.bind(MainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(MainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(MainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(MainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(MainMod .. " + CONTROL + h", hl.dsp.window.move({ direction = "left" }), {
    locked = true,
    repeating = true,
    description = D .. "Move active window to the left"
})

hl.bind(MainMod .. " + CONTROL + l", hl.dsp.window.move({ direction = "right" }), {
    locked = true,
    repeating = true,
    description = D .. "Move active window to the right"
})

hl.bind(MainMod .. " + CONTROL + k", hl.dsp.window.move({ direction = "up" }), {
    locked = true,
    repeating = true,
    description = D .. "Move active window up"
})

hl.bind(MainMod .. " + CONTROL + j", hl.dsp.window.move({ direction = "down" }), {
    locked = true,
    repeating = true,
    description = D .. "Move active window down"
})

-- Workspaces loop
for i = 1, 10 do
  local key = i % 10
  hl.bind(MainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(MainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace
hl.bind(MainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(MainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Mouse actions
hl.bind(MainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(MainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(MainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(MainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
  { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"),
  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
