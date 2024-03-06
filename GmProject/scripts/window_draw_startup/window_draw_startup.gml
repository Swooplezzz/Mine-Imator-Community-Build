/// window_draw_startup()

function window_draw_startup()
{
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon
	
	// Draw background
	var headersize = 144;
	draw_clear_alpha(c_level_middle, 1)
	draw_pattern(0, headersize, window_width, window_height - headersize)
	
	// Header
	draw_box(0, 0, window_width, headersize, false, c_level_top, 1)
	draw_divide(0, headersize, window_width)
	
	// Logo
	draw_sprite(spr_logo, 0, window_width / 2, headersize/2)
	
	// Version
	var trial = (trial_version ? " " + text_get("startuptrial") : "");
	draw_button_text(text_get("startupversion", mineimator_version_full + trial), (window_width / 2) + 259, floor((headersize/2) + (sprite_get_height(spr_logo)/2)) + 3, popup_switch, popup_about)
	
	dy = headersize + 48
	dw = min(window_width - 48, 1008)
	
	// No recent projects text
	if (ds_list_size(recent_list) = 0)
	{
		draw_label(text_get("recentnone"), window_width / 2, dy, fa_center, fa_middle, c_accent, 1, font_heading_big)
		dy += 48
	}
	
	// Draw buttons
	draw_set_font(font_button)
	
	var newprojectwidth, browsewidth, centerx;
	newprojectwidth = string_width(text_get("startupnewproject")) + button_icon_padding
	browsewidth = string_width(text_get("startupbrowse")) + button_icon_padding
	centerx = round((window_width / 2) - ((browsewidth + newprojectwidth) / 2))
	
	if (ds_list_size(recent_list) > 0)
		dx = (window_width / 2) + (dw / 2)
	else
		dx = centerx + (browsewidth + 24 + newprojectwidth)
	
	// New project
	dx -= newprojectwidth
	if (draw_button_label("startupnewproject", dx, dy, null, icons.FILE))
	{
		popup_newproject_clear()
		popup_switch(popup_newproject)
	}
	
	if (recent_list_amount > 0)
		dx -= 12 + browsewidth
	else
		dx = centerx
	
	// Browse
	if (draw_button_label("startupbrowse", dx, dy, null, icons.FOLDER, e_button.SECONDARY))
	{
		if (project_load())
			window_state = ""
	}
	
	// List style
	if (recent_list_amount > 0)
	{
		if (draw_button_icon("startuprecentdisplay", dx - 24 - 8, dy + 4, 24, 24, false, recent_display_mode = "grid" ? icons.VIEW_LIST : icons.VIEW_GRID, null, false, recent_display_mode = "grid" ? "tooltipviewlist" : "tooltipviewgrid"))
		{
			if (recent_display_mode = "list")
				recent_display_mode = "grid"
			else
				recent_display_mode = "list"
		}
	}
	
	// Show recent models
	if (recent_list_amount > 0)
	{
		// Recent model grid/list button
		dx -= (12 + 28)
		
		dx = (window_width / 2) - (dw / 2)
		
		draw_set_font(font_heading)
		
		// Recent models label
		draw_label(text_get("startuprecentprojects"), dx, dy + 16, fa_left, fa_middle, c_accent, 1)
		
		var labelwid = string_width(text_get("startuprecentprojects"));
		
		if (draw_button_label("startupsortby", dx + labelwid + 16, dy, null, icons.SORT_DOWN, e_button.TERTIARY))
			menu_settings_set(dx + labelwid + 16, dy, "startupsortby", 32)
		
		if (settings_menu_name = "startupsortby" && settings_menu_ani_type != "hide")
			current_microani.active.value = true
		
		dy += 72
		
		var listheight;
		
		if (recent_display_mode = "list")
			listheight = 28 + min(window_height - dy, (min(ds_list_size(recent_list), 8) * 44))
		else
			listheight = min(window_height - dy, ceil(recent_list_amount / 4) * 256)
		
		tab_control(listheight)
		draw_recent(dx, dy, dw, listheight)
		tab_next()
	}
	else
	{
		// Not Jonathan splash
		var midx, midy;
		midx = snap(window_width / 2, 2)
		midy = snap(headersize + ((window_height - headersize) / 1.75), 2)
		
		// Only draw splash if it fits well on screen
		if ((midy + (sprite_get_height(spr_jonathan_splash) / 2)) <= (window_height - (headersize / 2)))
		{
			/*
			var accent = 0;
			if (setting_accent = 9)
				accent = setting_accent_custom
			else
				accent = setting_theme.accent_list[setting_accent]
			
            // radians: pi - half a hue circle, 2 * pi - full circle
			if (accent != c_white || accent != c_black)
				pos = 2 * pi - degtorad(color_to_hue(accent))
			
			pos_s = (1 - color_get_sat(accent))
			
			if (accent == c_black || accent == c_white)
			{
				pos = 0;
				pos_s = 0;
			}
			
			u_position = shader_get_uniform(shader_hue, "u_Position"); // control shader
			u_position_s = shader_get_uniform(shader_hue, "u_Position_s"); // control shade
			
			shader_set(shader_hue);
            shader_set_uniform_f(u_position, pos);
            shader_set_uniform_f(u_position_s, pos_s +.2);
			*/
			draw_image(spr_jonathan_splash, 1, midx, midy, 1, 1, c_white, 255, 0)
			//shader_reset();
			//shader_clear();
			draw_image(spr_jonathan_splash, 0, midx, midy, 1, 1, c_white, 255, 0)	
		}
	}
	draw_gradient(0, headersize, window_width, window_height - headersize, c_accent, 0, 0, 0.1, 0.1)
}
