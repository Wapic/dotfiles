local mainMod = "SUPER"

local terminal = "foot"
local terminal_floating = "foot -a \"term_floating\""
local clipboard = "foot -a clipboard_manager sh -c clipse"
local menu = "rofi -show drun -run-command \"uwsm app -- {cmd}\""
local fileManager = "nautilus"

-- Base --
hl.bind(mainMod .. "+SHIFT+RETURN", hl.dsp.exec_cmd(terminal_floating))
hl.bind(mainMod .. "+RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. "+D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(clipboard))

hl.bind(mainMod .. "+SHIFT+Q", hl.dsp.window.close())
hl.bind(mainMod .. "+SHIFT+F10", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind(mainMod .. "+SHIFT+SPACE", hl.dsp.window.float({ action = toggle }))
hl.bind(mainMod .. "+G", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen({ action = toggle }))
hl.bind(mainMod .. "+SHIFT+L", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("ALT+TAB", hl.dsp.window.cycle_next())

-- Screenshots --
hl.bind("Print", hl.dsp.exec_cmd("grim $(xdg-user-dir PICTURES)/Screenshots/$(date +'%s_grim.png')"))
hl.bind("CTRL+Print", hl.dsp.exec_cmd("grim -g \"$(slurp -o)\" $(xdg-user-dir PICTURES)/Screenshots/$(date +'%s_grim.png') | wl-copy"))
hl.bind(mainMod .. "+SHIFT+S", hl.dsp.exec_cmd("grim -g \"$(slurp -w 0)\" - | wl-copy"))
hl.bind(mainMod .. "+CTRL+SHIFT+S", hl.dsp.exec_cmd("grim -g \"$(slurp -w 0 -o)\" $(xdg-user-dir PICTURES)/Screenshots/$(date +'%s_grim_region.png') | wl-copy"))

-- Media keys --
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl --ignore-player=firefox previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl --ignore-player=firefox play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl --ignore-player=firefox next"))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 -10%"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl -- set-sink-volume 0 +10%"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl -- set-sink-mute 0 toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pactl -- set-source-mute 0 toggle"))

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -n2 s 10%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -n2 s 10%+"), { repeating = true })

-- Move focus with mainMod + arrow keys --
hl.bind(mainMod .. "+left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. "+right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. "+up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. "+down", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9] --
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. "+" .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. "+SHIFT+" .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Move workspace to next monitor --
hl.bind(mainMod .. "+A", hl.dsp.workspace.move({ monitor = "+1"}))
hl.bind(mainMod .. "+SHIFT+A", hl.dsp.workspace.move({ monitor = "-1"}))

-- Move/resize windows with mainMod + LMB/RMB and dragging --
hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag(), { mouse = true})
hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize(), { mouse = true})
