local hostname = hl.dsp.exec_cmd("hostname")
if hostname ~= "WpcDesktop" then
	hl.config({
		general = {
			allow_tearing = false,
		},
		decoration = {
			blur = {
				enabled = false,
			},
			shadow = {
				enabled = false,
			},
			glow = {
				enabled = false,
			},
		},
		misc = {
			vrr = 1,
		},
		animations = {
			enabled = false,
		},
		render = {
			direct_scanout = 0,
		},
	})

	hl.monitor({
		output = "eDP-1",
		mode = "preferred",
		position = "auto",
		scale = 1.33
	})
else
	hl.window_rule({
		name = "allow_tearing",
		match = {
			class = "^(gamescope|steam_app_.*|cs2|.*osu.*)$",
		},
		immediate = true,
	})
	require("autostart")
end
