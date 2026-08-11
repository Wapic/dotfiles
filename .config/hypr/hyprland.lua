hl.config({
	general = {
		border_size = 1,

		gaps_in = 0,
		gaps_out = 0,

		col = {
			active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
			inactive_border = { colors = {"rgba(33ccff6e)", "rgba(00ff996e)"}, angle = 45 },
		},

		resize_on_border = false,
		allow_tearing = true,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		blur = {
			enabled = true,
			size = 8,
			passes = 1,
			vibrancy = 0.1696,
		},

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0x1a1a1aee,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	misc = {
		disable_splash_rendering = true,
		disable_hyprland_logo = true,
		force_default_wallpaper = -1,

		vrr = 0,
	},

	cursor = {
		no_hardware_cursors = 2,
	},

	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},

	input = {
		kb_layout = "se",
		kb_variant = "",
		kb_model = "pc105",
		kb_options = "caps:escape_shifted_capslock",
		kb_rules = "",

		follow_mouse = 2,
		force_no_accel = true,
		sensitivity = 0.0,

		touchpad = {
			natural_scroll = true,
		},
	},

	xwayland = {
		force_zero_scaling = true,
	},

	render = {
		direct_scanout = 1,
	},
})

hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} }})
hl.animation({ leaf = "global", enabled = true, speed = 0.65, bezier = "linear"})

hl.device({
	name = "pixa3854:00-093a:0274-touchpad",
	sensitivity = 1.0,
})

hl.device({
	name = "opentabletdriver-virtual-artist-tablet",
	output = "DP-1"
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

require("binds")
require("monitors")
require("windowrules")
require("workspacerules")
require("device-specific") -- will override certain stuff so make sure it loads last
