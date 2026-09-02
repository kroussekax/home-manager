hl.config({
	binds = {
		scroll_event_delay = 0
	},

	cursor = {
		hotspot_padding=1
	},

	decoration = {
		blur = {
			enabled = true,
			ignore_opacity = true,
			input_methods = true,
			new_optimizations = true,
			passes = 2,
			popups = true,
			size = 4,
			special = false,
			xray = false,
		},

		shadow = {
			enabled = true,
			color = "#282828B3",
			range = 20,
			render_power = 3,
		},

		rounding = 10,
		fullscreen_opacity = 1.0
	},

	general = {
		layout = "dwindle",

		allow_tearing = false,

		gaps_workspaces = 20,
		gaps_in = 10,
		gaps_out = 10,
		border_size = 3,

		col = {
			active_border = "rgba(e5e1e711)",
			inactive_border = "rgba(131317FF)",

		}
	},

	dwindle = {
		preserve_split = true,
		smart_split = false,
		smart_resizing = true
	},

	gestures = {
		workspace_swipe_cancel_ratio = 0.150000,
		workspace_swipe_create_new = true,
		workspace_swipe_direction_lock = true,
		workspace_swipe_direction_lock_threshold = 10,
		workspace_swipe_distance = 700,
		workspace_swipe_min_speed_to_force = 5,
	},

	group = {
		groupbar = {
			font_family = "JetBrains Mono NF",
			font_size = 15,
			gaps_in = 3,
			gaps_out = 3,
			gradient_round_only_edges = false,
			gradient_rounding = 5,
			gradients = true,
			height = 25,
			indicator_height = 0,

			col = {
				active = "rgba(131317FF)",
				inactive = "rgba(e5e1e711)",

				locked_active = "rgba(131317FF)",
				locked_inactive = "rgba(e5e1e711)"
			}
		},

		col = {
			border_active = "rgba(131317FF)",
			border_inactive =  "rgba(131317FF)",

			border_locked_active = "rgba(e5e1e711)",
			border_locked_inactive = "rgba(131317FF)",
		}
	},

	input = {
		touchpad = {
			disable_while_typing = false,
			natural_scroll = true,
			scroll_factor = 0.3,
		},
		focus_on_close = 1,
		kb_layout = "us",
		numlock_by_default = false,
		repeat_delay = 250,
		repeat_rate = 35,
	},

	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	}
})

hl.device({
	name = "wacom-hid-52ef-finger",
	output = "eDP-1"
})

hl.on("hyprland.start", function ()
	hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
	hl.exec_cmd("/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("trash-empty 30")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	hl.exec_cmd("/usr/lib/geoclue-2.0/demos/agent")
	hl.exec_cmd("mpris-proxy")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("waybar -c ~/dotfiles/modules/waybar/config.jsonc -s ~/dotfiles/modules/waybar/style.css")
	hl.exec_cmd("wvkbd-mobintl --hidden -H 400 -L 400 &")

	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'")
	hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 20")

	hl.exec_cmd("hypr/auto_rotate.sh")

	hl.exec_cmd("zen-beta", {workspace = 1})
	hl.exec_cmd("kitty", {workspace = 2})
	hl.exec_cmd("vesktop &", {workspace = 4})
	hl.exec_cmd("spotify", {workspace = 4})
	hl.exec_cmd("Telegram", {workspace = 4})
end)

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@179",
	position = "0x0",
	scale = 1
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "1920x0",
	scale = 1.2,
	transform = 0
})

hl.window_rule({ match = {modal = true}, float = true})

hl.window_rule({ match = {class = "thunar"}, opacity = 0.9})
hl.window_rule({ match = {class = "zen-beta"}, opacity = 0.9})
hl.window_rule({ match = {title = "(?i).*youtube.*"}, opacity = 1})
hl.window_rule({ match = {title = "Zen Browser"}, opacity = 1})
hl.window_rule({ match = {class = "kitty"}, opacity = 1})
hl.window_rule({ match = {class = "gimp"}, opacity = 1})

hl.window_rule({ match = {class = "vesktop"}, workspace = 4})
hl.window_rule({ match = {class = "Spotify"}, workspace = 4,})
hl.window_rule({ match = {class = "steam"}, workspace = 3,})

hl.workspace_rule( {workspace = "1", monitor = "HDMI-A-1", persistent = true})
hl.workspace_rule( {workspace = "2", monitor = "HDMI-A-1", persistent = true} )
hl.workspace_rule( {workspace = "3", monitor = "HDMI-A-1", persistent = true} )
hl.workspace_rule( {workspace = "6", monitor = "HDMI-A-1"} )
hl.workspace_rule( {workspace = "7", monitor = "HDMI-A-1"} )
hl.workspace_rule( {workspace = "8", monitor = "HDMI-A-1"} )
hl.workspace_rule( {workspace = "9", monitor = "HDMI-A-1"} )
hl.workspace_rule( {workspace = "10", monitor = "HDMI-A-1"} )

hl.workspace_rule( {workspace = "4", monitor = "eDP-1", persistent = true} )
hl.workspace_rule( {workspace = "5", monitor = "eDP-1", persistent = true} )

-- Layer Rules
hl.layer_rule({ match = { namespace = "waybar" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true, ignore_alpha = 0.6 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true, ignore_alpha = 0.6})
hl.layer_rule({ match = { namespace = "rofi" }, blur = true })

hl.window_rule({ match = {fullscreen = true}, opacity = 1})

-- Env Values
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")

hl.env("QT_QPA_PLATFORM", "wayland;xcb")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

hl.env("SDL_VIDEODRIVER", "wayland,x11")
hl.env("CLUTTER_BACKEND", "wayland")

hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

hl.env("_JAVA_AWT_WM_NONREPARENTING", "1")

hl.env("SSH_AUTH_SOCK", "$XDG_RUNTIME_DIR/keyring/ssh")

-- Curves (beziers)
hl.curve("wind",            { type = "bezier", points = { {0.05, 0.9},  {0.1,  1.05} } })
hl.curve("winIn",           { type = "bezier", points = { {0.1,  1.1},  {0.1,  1.1}  } })
hl.curve("winOut",          { type = "bezier", points = { {0.3,  -0.3}, {0,    1}    } })
hl.curve("liner",           { type = "bezier", points = { {1,    1},    {1,    1}    } })
hl.curve("md3_standard",    { type = "bezier", points = { {0.2,  0},    {0,    1}    } })
hl.curve("md3_decel",       { type = "bezier", points = { {0.05, 0.7},  {0.1,  1}    } })
hl.curve("md3_accel",       { type = "bezier", points = { {0.3,  0},    {0.8,  0.15} } })
hl.curve("overshot",        { type = "bezier", points = { {0.05, 0.9},  {0.1,  1.1}  } })
hl.curve("crazyshot",       { type = "bezier", points = { {0.1,  1.5},  {0.76, 0.92} } })
hl.curve("hyprnostretch",   { type = "bezier", points = { {0.05, 0.9},  {0.1,  1.0}  } })
hl.curve("menu_decel",      { type = "bezier", points = { {0.1,  1},    {0,    1}    } })
hl.curve("menu_accel",      { type = "bezier", points = { {0.38, 0.04}, {1,    0.07} } })
hl.curve("easeInOutCirc",   { type = "bezier", points = { {0.85, 0},    {0.15, 1}    } })
hl.curve("easeOutCirc",     { type = "bezier", points = { {0,    0.55}, {0.45, 1}    } })
hl.curve("easeOutExpo",     { type = "bezier", points = { {0.16, 1},    {0.3,  1}    } })
hl.curve("softAcDecel",     { type = "bezier", points = { {0.26, 0.26}, {0.15, 1}    } })
hl.curve("md2",             { type = "bezier", points = { {0.4,  0},    {0.2,  1}    } }) -- use with .2s duration

-- Animations
hl.animation({ leaf = "border",           enabled = true, speed = 1,   bezier = "liner"      })
hl.animation({ leaf = "borderangle",      enabled = true, speed = 30,  bezier = "liner",      style = "once"           })
hl.animation({ leaf = "windows",          enabled = true, speed = 6,   bezier = "wind",       style = "slide"          })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 6,   bezier = "winIn",      style = "slide"          })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 5,   bezier = "winOut",     style = "slide"          })
hl.animation({ leaf = "windowsMove",      enabled = true, speed = 5,   bezier = "wind",       style = "slide"          })
hl.animation({ leaf = "fade",             enabled = true, speed = 3,   bezier = "md3_decel"  })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3,   bezier = "menu_decel", style = "slide"          })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.6, bezier = "menu_accel", style = "slide"          })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2,   bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 4.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5,   bezier = "wind"       })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3,   bezier = "md3_decel",  style = "slidevert"      })

-- Window management
hl.bind("SUPER + F",            hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + Return",       hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + Q",            hl.dsp.window.close())
hl.bind("SUPER + SHIFT + F",    hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + P",            hl.dsp.window.pseudo())
hl.bind("SUPER + G",            hl.dsp.group.toggle())
hl.bind("SUPER + ALT + G",      hl.dsp.group.lock())
hl.bind("SUPER + CTRL + TAB",   hl.dsp.group.next())

-- Focus movement
hl.bind("SUPER + h",            hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + j",            hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + k",            hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + l",            hl.dsp.focus({ direction = "r" }))

-- Move window or group
hl.bind("SUPER + CTRL + h",     hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + CTRL + j",     hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + CTRL + k",     hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + CTRL + l",     hl.dsp.window.move({ direction = "r" }))

-- Cycle windows
hl.bind("ALT + Tab",            hl.dsp.window.cycle_next(),         { repeating = true })
hl.bind("SHIFT + ALT + Tab",    hl.dsp.window.cycle_next({ prev = true }), { repeating = true })

-- Resize active window
hl.bind("SUPER + SHIFT + l",    hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + h",    hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + k",    hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + j",    hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true })

-- Mouse window management
hl.bind("SUPER + mouse:272",    hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273",    hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + X",            hl.dsp.window.resize(), { mouse = true })

-- Workspace switching
hl.bind("SUPER + 1",            hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2",            hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3",            hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4",            hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5",            hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6",            hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7",            hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8",            hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9",            hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0",            hl.dsp.focus({ workspace = 10 }))
hl.bind("SUPER + mouse_down",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + Page_Up",      hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + Page_Down",    hl.dsp.focus({ workspace = "e+1" }))
hl.bind("CTRL + SUPER + left",  hl.dsp.focus({ workspace = "e-1" }), { repeating = true })
hl.bind("CTRL + SUPER + right", hl.dsp.focus({ workspace = "e+1" }), { repeating = true })
hl.bind("CTRL + SUPER + mouse_down", hl.dsp.focus({ workspace = "e-10" }))
hl.bind("CTRL + SUPER + mouse_up",   hl.dsp.focus({ workspace = "e+10" }))

-- Move window to workspace
hl.bind("SUPER + SHIFT + 1",   hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2",   hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3",   hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4",   hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5",   hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6",   hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7",   hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8",   hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9",   hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0",   hl.dsp.window.move({ workspace = 10 }))
hl.bind("SUPER + ALT + mouse_down",  hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + ALT + mouse_up",    hl.dsp.window.move({ workspace = "e+1" }))
hl.bind("CTRL + SUPER + SHIFT + right", hl.dsp.window.move({ workspace = "e+1" }), { repeating = true })
hl.bind("CTRL + SUPER + SHIFT + left",  hl.dsp.window.move({ workspace = "e-1" }), { repeating = true })
hl.bind("CTRL + SUPER + SHIFT + k", hl.dsp.window.move({ workspace = "special:special" }))
hl.bind("CTRL + SUPER + SHIFT + j", hl.dsp.window.move({ workspace = "e+0" }))

-- Misc
local transform_value = 0
hl.bind("SUPER + R", function()
	if transform_value == 0 then transform_value = 3
	elseif transform_value == 3 then transform_value = 2
	elseif transform_value == 2 then transform_value = 1
	elseif transform_value == 1 then transform_value = 0 end

	hl.config({
		input = {
			touchdevice = {
				transform = transform_value
			}
		}
	})
	hl.monitor({
		output = "eDP-1",
		mode = "1920x1200@60",
		position = "1920x0",
		scale = 1.2,
		transform = transform_value
	})
end)

-- Audio (repeating)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volumectl -u up"),                              { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volumectl -u down"),                            { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),    { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),    { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { repeating = true })

-- Brightness (repeating)
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 10%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"), { repeating = true })

-- Zoom (repeating)
hl.bind("XF86AudioForward", hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')"]]), { repeating = true })
hl.bind("XF86AudioRewind",  hl.dsp.exec_cmd([[hyprctl keyword cursor:zoom_factor "$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')"]]), { repeating = true })

-- Audio (locked - works on lockscreen)
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { locked = true })
hl.bind("SUPER + SHIFT + M",    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),   { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $volumeStep%+"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ $volumeStep%-"),      { locked = true })
hl.bind("XF86AudioPlay",        hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioNext",        hl.dsp.exec_cmd("playerctl next"),         { locked = true })
hl.bind("XF86AudioPrev",        hl.dsp.exec_cmd("playerctl previous"),     { locked = true })

-- OBS shortcuts (send_shortcut)
hl.bind("SUPER + C", hl.dsp.send_shortcut({ mods = "", key = "C", window = "class:^(com\\.obsproject\\.Studio)$" }), { locked = true })
hl.bind("SUPER + V", hl.dsp.send_shortcut({ mods = "", key = "V", window = "class:^(com\\.obsproject\\.Studio)$" }), { locked = true })
hl.bind("SUPER + B", hl.dsp.send_shortcut({ mods = "", key = "B", window = "class:^(com\\.obsproject\\.Studio)$" }), { locked = true })

-- Pass to app
hl.bind("CTRL + SHIFT + M",     hl.dsp.pass({ window = "class:^(vesktop)$" }), { locked = true })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + X",         hl.dsp.window.resize(), { mouse = true })

-- Screenshot
hl.bind("SUPER + S", hl.dsp.exec_cmd("grimblast save active - | swappy -f -"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("grimblast save area - | swappy -f -"))

-- Notifications
hl.bind("SUPER + Y", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind("SUPER + SHIFT + Y", hl.dsp.exec_cmd("swaync-client -C"))

-- Rofi
hl.bind("SUPER + D", hl.dsp.exec_cmd([[bash -c 'pgrep -x rofi >/dev/null && pkill -x rofi || rofi -show drun -show-icons']]))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd([[bash -c 'pgrep -x rofi >/dev/null && pkill -x rofi || cliphist list | rofi -dmenu | cliphist decode | wl-copy']]))
hl.gesture({
	fingers = 3,
	direction = "down",
	action = function ()
		hl.dsp.exec_cmd([[bash -c 'pgrep -x rofi >/dev/null && pkill -x rofi || rofi -show drun -show-icons']])
	end
})

hl.bind("SUPER + U", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + U", hl.dsp.layout("togglesplit"))

hl.bind("SUPER + W", hl.dsp.exec_cmd("hypr/switch_waybar.sh"))

local gamemode = false

local function set_gamemode(enabled)
    gamemode = enabled

	hl.config({
		animations = {
			enabled = not enabled
		},
        decoration = {
            blur = {
                enabled = not enabled,
            },

            shadow = {
                enabled = not enabled,
            }
		}
	})
end

hl.bind("SUPER + Semicolon", function()
    set_gamemode(not gamemode)
end)
