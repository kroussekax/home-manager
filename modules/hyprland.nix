{ config, ... }:
let

# Colors
	primary = "c2c1ff";
	outline = "918f9a";
	secondary = "c6c4e0";
	onPrimary = "2a2a60";
	onSurface = "e5e1e7";
	surface = "131317";

# Apps
	terminal = "kitty";
	browser = "zen-browser";
	fileExplorer = "thunar";

# Touchpad
	touchpadDisableTyping = "false";
	touchpadScrollFactor = "0.3";
	workspaceSwipeFingers = "4";
	gestureFingers = "3";
	gestureFingersMore = "4";

# Blur
	blurEnabled = "true";
	blurSpecialWs = "false";
	blurPopups = "true";
	blurInputMethods = "true";
	blurSize = "4";
	blurPasses = "2";
	blurXray = "true";

# Shadow
	shadowEnabled = "true";
	shadowRange = "20";
	shadowRenderPower = "3";
	shadowColour = "rgba(1313174)";

# Gaps
	workspaceGaps = "20";
	windowGapsIn = "10";
	windowGapsOut = "20";
	singleWindowGapsOut = "20";

# Window styling
	windowOpacity = "0.95";
	windowRounding = "10";

	windowBorderSize = "3";
	activeWindowBorderColour = "rgba(c2c1ffe6)";
	inactiveWindowBorderColour = "rgba(e5e1e711)";

# Misc
	volumeStep = "10  # In percent";
	cursorTheme = "Bibata-Modern-Ice";
	cursorSize = "20";

# ### Keybinds ###
# Workspaces
	kbMoveWinToWs = "Super+Shift";
	kbMoveWinToWsGroup = "Ctrl+Super+Alt";
	kbGoToWs = "Super";
	kbGoToWsGroup = "Ctrl+Super";

	kbNextWs = "Ctrl+Super, right";
	kbPrevWs = "Ctrl+Super, left";

	kbToggleSpecialWs = "Super, E";

# Window groups
	kbWindowGroupCycleNext = "Alt, Tab";
	kbWindowGroupCyclePrev = "Shift+Alt, Tab";
	kbUngroup = "Super, U";
	kbToggleGroup = "Super, G";

# Window actions
	kbResizeWindow = "Super, X";
	kbWindowFullscreen = "Super, F";
	kbToggleWindowFloating = "Super+shift, F";
	kbCloseWindow = "Super, Q";

# Special workspace toggles
	kbSystemMonitor = "Ctrl+Shift, Escape";

# Apps
	kbTerminal = "Super, Return";
	kbFileExplorer = "Super, N";

# Misc
	kbSession = "Super, M";
	kbClearNotifs = "Ctrl+Alt, C";
	kbShowPanels = "Super, BracketRight";
	kbLock = "Super, Slash";

in
{
	wayland.windowManager.hyprland = {
		enable = true;

		extraConfig = ''
			general {
				layout = dwindle

				allow_tearing = false  # Allows `immediate` window rule to work

				gaps_workspaces = ${workspaceGaps}
				gaps_in = ${windowGapsIn}
				gaps_out = ${windowGapsOut}
				border_size = ${windowBorderSize}

				col.active_border = rgba(131317FF)
				col.inactive_border = ${inactiveWindowBorderColour}
			}

			dwindle {
				preserve_split = true
				smart_split = false
				smart_resizing = true
			}
		'';

		settings = {
			windowrule = [
				"match:class zen-beta, workspace 1, opacity 1.0"
				"match:class com.obsproject.Studio, workspace 3, float true, size 1834 1028, move 80 46"
				"match:class vesktop, workspace 3, float true, size 91 1028, move 6 46"
				"match:class Spotify, workspace 4"

				"match:title Youtube, workspace 1, opacity 1.0"
			];

			workspace = [
				"1, monitor:HDMI-A-1"
				"2, monitor:HDMI-A-1"
				"3, monitor:HDMI-A-1"
				"5, monitor:HDMI-A-1"
				"6, monitor:HDMI-A-1"

				"4, monitor:eDP-1"
			];

			bind = [
				"Super, F, fullscreen, 0"

				"Super, Return, exec, ${terminal}"

				"Super, h, movefocus, l"
				"Super, j, movefocus, d"
				"Super, k, movefocus, u"
				"Super, l, movefocus, r"

				"Super+Ctrl, h, movewindoworgroup, l"
				"Super+Ctrl, j, movewindoworgroup, d"
				"Super+Ctrl, k, movewindoworgroup, u"
				"Super+Ctrl, l, movewindoworgroup, r"

				"Super, 1, workspace, 1"
				"Super, 2, workspace, 2"
				"Super, 3, workspace, 3"
				"Super, 4, workspace, 4"
				"Super, 5, workspace, 5"
				"Super, 6, workspace, 6"
				"Super, 7, workspace, 7"
				"Super, 8, workspace, 8"
				"Super, 9, workspace, 9"
				"Super, 0, workspace, 10"

				"Super, mouse_down, workspace, -1"
				"Super, mouse_up, workspace, +1"
				"Super, Page_Up, workspace, -1"
				"Super, Page_Down, workspace, +1"

				"Ctrl+Super, mouse_down, workspace, -10"
				"Ctrl+Super, mouse_up, workspace, +10"

				"Super+Shift, 1, movetoworkspace, 1"
				"Super+Shift, 2, movetoworkspace, 2"
				"Super+Shift, 3, movetoworkspace, 3"
				"Super+Shift, 4, movetoworkspace, 4"
				"Super+Shift, 5, movetoworkspace, 5"
				"Super+Shift, 6, movetoworkspace, 6"
				"Super+Shift, 7, movetoworkspace, 7"
				"Super+Shift, 8, movetoworkspace, 8"
				"Super+Shift, 9, movetoworkspace, 9"
				"Super+Shift, 0, movetoworkspace, 10"

				"Super+Alt, mouse_down, movetoworkspace, -1"
				"Super+Alt, mouse_up, movetoworkspace, +1"

				"Ctrl+Super+Shift, k, movetoworkspace, special:special"
				"Ctrl+Super+Shift, j, movetoworkspace, e+0"

				"Super+shift, F, togglefloating"
				"Super, Q, killactive"

				"Super, G, togglegroup"
				"Super+Alt, G, lockactivegroup, toggle"

				"Super, R, exec, hyprctl keyword monitor eDP-1,transform,3"

				"Super+Shift, Slash, exec, systemctl suspend-then-hibernate"
				"Super, P, pseudo"

			];

			binde = [
				"${kbPrevWs}, workspace, -1"
				"${kbNextWs}, workspace, +1"

				"Ctrl+Super+Shift, right, movetoworkspace, +1"
				"Ctrl+Super+Shift, left, movetoworkspace, -1"

				"${kbWindowGroupCycleNext}, cyclenext"
				"${kbWindowGroupCyclePrev}, cyclenext, prev"

				"Super+SHIFT, l, resizeactive, 10 0"
				"Super+SHIFT, h, resizeactive, -10 0"
				"Super+SHIFT, k, resizeactive, 0 -10"
				"Super+SHIFT, j, resizeactive, 0 10"

				" , XF86AudioRaiseVolume, exec, volumectl -u up"
				" , XF86AudioLowerVolume, exec, volumectl -u down"

				", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
				", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
				", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

				", XF86AudioForward, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor * 2.0}')\""
				", XF86AudioRewind, exec, hyprctl keyword cursor:zoom_factor \"$(hyprctl getoption cursor:zoom_factor | awk 'NR==1 {factor = $2; if (factor < 1) {factor = 1}; print factor / 2.0}')\""


			];

			bindm = [
				"Super, mouse:272, movewindow"
				"Super, mouse:273, resizewindow"
				"${kbResizeWindow}, resizewindow"
			];

			bindl = [
				", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
				", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
				"Super+Shift, M, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

				", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ $volumeStep%+"
				", XF86AudioLowerVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ $volumeStep%-"

				", XF86AudioPlay, exec, playerctl play-pause"
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPrev, exec, playerctl previous"

				"Super, C, sendshortcut, , C, class:^(com\\.obsproject\\.Studio)$"
				"Super, V, sendshortcut, , V, class:^(com\\.obsproject\\.Studio)$"
				"Super, B, sendshortcut, , B, class:^(com\\.obsproject\\.Studio)$"

				"CTRL SHIFT, M, pass, class:^(vesktop)$"
			];

			animations  = {
				enabled = true;

				bezier = [
					"wind, 0.05, 0.9, 0.1, 1.05"
					"winIn, 0.1, 1.1, 0.1, 1.1"
					"winOut, 0.3, -0.3, 0, 1"
					"liner, 1, 1, 1, 1"
					"md3_standard, 0.2, 0, 0, 1"
					"md3_decel, 0.05, 0.7, 0.1, 1"
					"md3_accel, 0.3, 0, 0.8, 0.15"
					"overshot, 0.05, 0.9, 0.1, 1.1"
					"crazyshot, 0.1, 1.5, 0.76, 0.92"
					"hyprnostretch, 0.05, 0.9, 0.1, 1.0"
					"menu_decel, 0.1, 1, 0, 1"
					"menu_accel, 0.38, 0.04, 1, 0.07"
					"easeInOutCirc, 0.85, 0, 0.15, 1"
					"easeOutCirc, 0, 0.55, 0.45, 1"
					"easeOutExpo, 0.16, 1, 0.3, 1"
					"softAcDecel, 0.26, 0.26, 0.15, 1"
					"md2, 0.4, 0, 0.2, 1 # use with .2s duration"
				];

				animation = [
					"border, 1, 1, liner"
					"borderangle, 1, 30, liner, once"
					"windows, 1, 6, wind, slide"
					"windowsIn, 1, 6, winIn, slide"
					"windowsOut, 1, 5, winOut, slide"
					"windowsMove, 1, 5, wind, slide"

					"fade, 1, 3, md3_decel"
					"layersIn, 1, 3, menu_decel, slide"
					"layersOut, 1, 1.6, menu_accel, slide"
					"fadeLayersIn, 1, 2, menu_decel"
					"fadeLayersOut, 1, 4.5, menu_accel"
					"workspaces, 1, 7, menu_decel, slide"
					"workspaces, 1, 5, wind"
					"specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
					"specialWorkspace, 1, 3, md3_decel, slidevert"
				];
			};

			monitor = [
				"HDMI-A-1, 1920x1080@160, 0x0, 1"
				"eDP-1, 1920x1200@60, 1920x0, 1.2"
			];

			misc = {
				disable_hyprland_logo = true;
				disable_splash_rendering = true;
			};

			debug = {
				suppress_errors = false;
			};

			env = [
				"QT_QPA_PLATFORMTHEME, qt6ct"
				"QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
				"QT_AUTO_SCREEN_SCALE_FACTOR, 1"
				"XCURSOR_THEME, ${cursorTheme}"
				"XCURSOR_SIZE, ${cursorSize}"

				"GDK_BACKEND, wayland,x11"
				"QT_QPA_PLATFORM, wayland;xcb"
				"SDL_VIDEODRIVER, wayland,x11,windows"
				"CLUTTER_BACKEND, wayland"
				"ELECTRON_OZONE_PLATFORM_HINT, auto"

				"XDG_CURRENT_DESKTOP, Hyprland"
				"XDG_SESSION_TYPE, wayland"
				"XDG_SESSION_DESKTOP, Hyprland"

				"_JAVA_AWT_WM_NONREPARENTING, 1"

				"SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/keyring/ssh"
			];

			decoration = {
				rounding = "${windowRounding}";

				blur = {
					enabled = "${blurEnabled}";
					xray = "${blurXray}";
					special = "${blurSpecialWs}";
					ignore_opacity = true;
					new_optimizations = true;
					popups = "${blurPopups}";
					input_methods = "${blurInputMethods}";
					size = "${blurSize}";
					passes = "${blurPasses}";
				};

				shadow = {
					enabled = "${shadowEnabled}";
					range = "${shadowRange}";
					render_power = "${shadowRenderPower}";
				};
			};

			gestures = {
				workspace_swipe_distance = 700;
				workspace_swipe_cancel_ratio = 0.15;
				workspace_swipe_min_speed_to_force = 5;
				workspace_swipe_direction_lock = true;
				workspace_swipe_direction_lock_threshold = 10;
				workspace_swipe_create_new = true;
			};

			gesture = [
				"${workspaceSwipeFingers}, horizontal, workspace"
				"${gestureFingers}, up, special, special"
				"${gestureFingers}, down, dispatcher, exec, caelestia toggle specialws"
				"${gestureFingersMore}, down, dispatcher, exec, systemctl suspend-then-hibernate"
			];

			layerrule = [
				"blur on, match:namespace ambxst"
				"ignore_alpha 0.3, match:namespace ambxst"
				"blur_popups on, match:namespace ambxst"
			];

			group = {
				groupbar = {
					font_family = "JetBrains Mono NF";
					font_size = 15;
					gradients = true;
					gradient_round_only_edges = false;
					gradient_rounding = 5;
					height = 25;
					indicator_height = 0;
					gaps_in = 3;
					gaps_out = 3;
				};
			};

			input = {
				kb_layout = "us";
				numlock_by_default = false;
				repeat_delay = 250;
				repeat_rate = 35;
				#kb_options = "caps:swapescape";


				focus_on_close = 1;

				touchpad = {
					natural_scroll = true;
					disable_while_typing = "${touchpadDisableTyping}";
					scroll_factor = "${touchpadScrollFactor}";
				};
			};

			binds = {
				scroll_event_delay = 0;
			};

			cursor = {
				hotspot_padding = 1;
			};

			device = [
				{
					name = "wacom-hid-52ef-finger";
					output = "eDP-1";
				}
			];

			#exec-once = config.programs.ax-shell.hyprlandExecOnce ++ [
			exec-once = [
				"gnome-keyring-daemon --start --components=secrets"
				"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"

				"wl-paste --type text --watch cliphist store"
				"wl-paste --type image --watch cliphist store"

				"trash-empty 30"

				"hyprctl setcursor ${cursorTheme} ${cursorSize}"
				"gsettings set org.gnome.desktop.interface cursor-theme '${cursorTheme}'"
				"gsettings set org.gnome.desktop.interface cursor-size ${cursorSize}"

				"/usr/lib/geoclue-2.0/demos/agent"
				"sleep 1 && gammastep"

				"iio-hyprland"

				"mpris-proxy"

				"awww-daemon"
				"waybar -c /home/kax/dotfiles/modules/waybar/config.jsonc -s /home/kax/dotfiles/modules/waybar/style.css"

				"[workspace 1; pseudo] zen-beta"
				"[workspace 2 ] kitty"
				"[workspace 3 ] vesktop"
				"[workspace 4 ] spotify"
				];
		};
	};
}
