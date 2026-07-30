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
end
