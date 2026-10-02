-- suppress maximize everywhere
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})
-- Define workspace rules to remove gaps for workspaces with one tiled or floating window
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

-- nofocus dummy XWayland windows
hl.window_rule({
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

-- workspace gaps (unchanged – not window rules)
-- workspace = w[tv1], gapsout:0, gapsin:0
-- workspace = f[1], gapsout:0, gapsin:0
-- These remain in the main config as workspace definitions

-- no borders / rounding on specific workspaces (tiled only)
hl.window_rule({
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
})
hl.window_rule({
	match = { float = false, workspace = "w[tv1]" },
	rounding = 0,
})

hl.window_rule({
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
})
hl.window_rule({
	match = { float = false, workspace = "f[1]" },
	rounding = 0,
})

-- -----------------
-- OPACITY RULES
-- -----------------

hl.window_rule({
	match = { class = "^(Brave-browser)$" },
	opacity = "0.9 0.9",
})
hl.window_rule({
	match = { class = "^(code-oss)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^([Cc]ode)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(code-url-handler)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(code-insiders-url-handler)$" },
	opacity = "0.8 0.8",
})

hl.window_rule({
	match = { class = "^(kitty)$" },
	tile = true,
})

hl.window_rule({
	match = { title = "^(Tridactyl)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Tridactyl)$" },
	center = true,
})
hl.window_rule({
	match = { title = "^(Tridactyl)$" },
	size = { 900, 900 },
})

hl.window_rule({
	match = { class = "^(Godot)$" },
	tile = true,
})
hl.window_rule({
	match = { class = "^(ZapZap)$" },
	no_screen_share = true,
})
hl.window_rule({
	match = { class = "^(shooterspool online.exe)$" },
	fullscreen = true,
})

hl.window_rule({
	match = { class = "^(org.kde.dolphin)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(org.kde.dolphin)$" },
	no_screen_share = true,
})
hl.window_rule({
	match = { class = "^(org.kde.ark)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(nwg-look)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(qt5ct)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(qt6ct)$" },
	opacity = "0.8 0.8",
})

hl.window_rule({
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(blueberry.py)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(nm-applet)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(nm-connection-editor)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(polkit-gnome-authentication-agent-1)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" },
	opacity = "0.8 0.7",
})
hl.window_rule({
	match = { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" },
	opacity = "0.8 0.7",
})

hl.window_rule({
	match = { class = "^([Ss]team)$" },
	opacity = "0.7 0.7",
})
hl.window_rule({
	match = { class = "^(steamwebhelper)$" },
	opacity = "0.7 0.7",
})
hl.window_rule({
	match = { class = "^([Ss]potify)$" },
	opacity = "0.7 0.7",
})
hl.window_rule({
	match = { initial_title = "^(Spotify Free)$" },
	opacity = "0.7 0.7",
})
hl.window_rule({
	match = { initial_title = "^(Spotify Premium)$" },
	opacity = "0.7 0.7",
})

hl.window_rule({
	match = { class = "^(discord)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(WebCord)$" },
	opacity = "0.8 0.8",
})
hl.window_rule({
	match = { class = "^(ArmCord)$" },
	opacity = "0.8 0.8",
})

-- -----------------
-- POMODORO
-- -----------------

hl.window_rule({
	match = { title = "^(Pomodoro Timer)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Pomodoro Timer)$" },
	pin = true,
})
hl.window_rule({
	match = { title = "^(Pomodoro Timer)$" },
	opacity = "0.7 0.7",
})

-- -----------------
-- FLOATING / MODALS
-- -----------------

hl.window_rule({
	match = { class = "^(org.kde.dolphin)$", title = "^(Progress Dialog — Dolphin)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(org.kde.dolphin)$", title = "^(Copying — Dolphin)$" },
	float = true,
})

hl.window_rule({
	match = { title = "^(About Mozilla Firefox)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(Emulator)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Emulator)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Emulator)$" },
	size = { 61, 512 },
})

hl.window_rule({
	match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(firefox)$", title = "^(Picture-in-Picture)$" },
	pin = true,
})
hl.window_rule({
	match = { class = "^(firefox)$", title = "^(Library)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(Motrix)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(Motrix)$" },
	center = true,
})
hl.window_rule({
	match = { class = "^(Motrix)$" },
	size = { 800, 750 },
})

hl.window_rule({
	match = { class = "^(kvantummanager)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(qt5ct)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(qt6ct)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(nwg-look)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(org.kde.ark)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(org.kde.ark)$" },
	size = { 833, 546 },
})

hl.window_rule({
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(blueberry.py)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(nm-applet)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(nm-connection-editor)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(org.kde.gwenview)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(org.kde.gwenview)$" },
	size = { 800, 600 },
})

-- Show Me The Key
hl.window_rule({
	match = { title = "^(Floating Window - Show Me The Key)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Floating Window - Show Me The Key)$" },
	pin = true,
})
hl.window_rule({
	match = { title = "^(Floating Window - Show Me The Key)$" },
	no_focus = true,
})
hl.window_rule({
	match = { title = "^(Floating Window - Show Me The Key)$" },
	size = { 1400, 100 },
})
hl.window_rule({
	match = { title = "^(Floating Window - Show Me The Key)$" },
	move = { "(monitor_w*0.15)", "monitor_h" },
})

-- -----------------
-- COMMON MODALS
-- -----------------

hl.window_rule({
	match = { title = "^(Open Images — Krita)$" },
	size = { 800, 1200 },
})
hl.window_rule({
	match = { title = "^(Open Images — Krita)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Open Images — Krita)$" },
	center = true,
})

hl.window_rule({
	match = { title = "^(Open)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Choose Files)$" },
	float = true,
})

hl.window_rule({
	match = { title = "^(Save As)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(Save As)$" },
	size = { 600, 400 },
})

hl.window_rule({
	match = { title = "^(Open Image)$" },
	size = { 800, 1200 },
})
hl.window_rule({
	match = { title = "^(Export Image)$" },
	size = { 800, 600 },
})
hl.window_rule({
	match = { title = "^(Open Image)$" },
	center = true,
})
hl.window_rule({
	match = { title = "^(Export Image)$" },
	center = true,
})

hl.window_rule({
	match = { title = "^(Confirm to replace files)$" },
	float = true,
})
hl.window_rule({
	match = { title = "^(File Operation Progress)$" },
	float = true,
})
hl.window_rule({
	match = { class = "^(xdg-desktop-portal-gtk)$" },
	float = true,
})
