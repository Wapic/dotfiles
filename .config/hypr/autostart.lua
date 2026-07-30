hl.on("hyprland.start", function ()
	hl.exec_cmd("clipse -listen")
	hl.exec_cmd("spotify --enable-features=UseOzonePlatform --ozone-platform=wayland")
	hl.exec_cmd("thunderbird")
	hl.exec_cmd("discord")
end)

hl.window_rule({
	name = "move-to-ws1",
	match = {
		initial_class = "discord"
	},
	workspace = "1 silent"
})

hl.window_rule({
	name = "move-to-ws5",
	match = {
		initial_class = "spotify"
	},
	workspace = "5 silent"
})

hl.window_rule({
	name = "move-to-ws9",
	match = {
		initial_class = "org.mozilla.Thunderbird"
	},
	workspace = "9 silent"
})
