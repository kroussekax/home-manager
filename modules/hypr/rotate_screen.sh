#!/bin/sh
hyprctl eval 'local transform_value = hl.get_monitor("eDP-1").transform
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
	})'
