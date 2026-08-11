hl.window_rule({
	name = "clipboard",
	match = { 
		class = "^(clipboard_manager)$"
	},
	float = true,
	size = {622, 652},
	stay_focused = true,
})

hl.window_rule({
	name = "always_floating",
	float = true,
	match = { 
		class = "^(term_floating|org.(twosheds.iwgtk|gnome.(Nautilus|seahorse.Application)|pulseaudio.pavucontrol|prismlauncher.PrismLauncher))$"
	},
	size = {"(monitor_w/2)", "(monitor_h/2)"},
})

hl.window_rule({
    name = "suppress-maximize-events",
    match = {
		class = ".*"
	},
    suppress_event = "maximize",
})

hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
    no_focus = true,
})

hl.window_rule({
    name = "move-hyprland-run",

    match = {
		class = "hyprland-run",
	},

    move = { 20, "(monitor_h-120)" },
    float = yes,
})
