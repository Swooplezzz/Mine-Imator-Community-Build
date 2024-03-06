/// draw_recent(x, y, width, height, [mode])
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg [mode]

function draw_recent()
{
	var xx, yy, wid, hei, mode, recenty;
	var mouseon;
	xx = argument[0]
	yy = argument[1]
	wid = argument[2]
	hei = argument[3]
	mode = recent_display_mode
	
	if (argument_count > 4)
		mode = argument[4]
	
	recenty = yy
	
	if (mode = "simple")
	{
		draw_set_font(font_value)
		
		for (var i = 0; i < recent_list_amount; i++)
		{
			var hover = app_mouse_box(xx, recenty, wid, 44) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon;
			var mouseon = hover;
			var item = recent_list[|i];
			
			// Icons
			var iconx = xx + wid - 8;
			iconx -= 24
			
			// Remove
			if (hover)
			{
				if (draw_button_icon("recentdelete" + string(item), iconx, recenty + 8, 24, 24, false, icons.DELETE, null, false, "tooltipremove"))
					action_recent_remove(item)
				mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 24, 24)
			}
			iconx -= 24
			
			// Name
			draw_label(string_limit(filename_name(item.name), (iconx - xx) - 12), xx + 12, recenty + 22, fa_left, fa_middle, c_text_main, a_text_main)
			
			// Separator
			draw_box(xx + 4, recenty + 43, wid - 8, 1, false, c_overlay, a_overlay)
			
			// Animation
			microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
			
			draw_box(xx, recenty, wid, 44, false, c_overlay, a_overlay * microani_arr[e_microani.HOVER])
			draw_box_hover(xx, recenty, wid, 44, microani_arr[e_microani.HOVER])
			
			draw_box(xx, recenty, wid, 44, false, c_accent_overlay, a_accent_overlay * microani_arr[e_microani.PRESS])
			
			microani_update(mouseon, mouseon && mouse_left, false)
			
			// Load project
			if (mouseon)
			{
				mouse_cursor = cr_handpoint
				
				if (mouse_left_released)
				{
					if (file_exists_lib(item.filename))
					{
						project_load(item.filename)
						window_state = ""
					
						return 0
					}
					else
						error("erroropenprojectexists")
				}
			}
			
			recenty += 44
			
			if (recenty + 44 > yy + hei)
				break
		}
	}
	
	if (mode = "list")
	{
		draw_set_font(font_label)
		
		// Set scrollbar
		var liststart = 0;
		
		if ((recent_list_amount * 44) > hei - 28)
		{
			window_scroll_focus = string(recent_scrollbar)
			
			scrollbar_draw(recent_scrollbar, e_scroll.VERTICAL, xx + wid - 12, yy + 28, hei - 28, recent_list_amount * 44)
			liststart = snap(recent_scrollbar.value / 44, 1)
			wid -= 12
		}
		
		if (hei < 28)
			return 0
		
		var namewidth, timewidth, namex, timex;
		namewidth = (wid - (12 * 3)) / 2
		timewidth = (wid - (12 * 3)) / 2
		namex = xx + 12
		timex = xx + 12 + namewidth + 12
		
		// File name
		draw_label(text_get("recentfilename"), namex, recenty + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary)
		
		// Last opened
		draw_label(text_get("recentlastopened"), timex, recenty + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary)
		
		recenty += 28
		
		// Draw list
		draw_set_font(font_value)
		for (var i = liststart; i < recent_list_amount; i++)
		{
			var hover = app_mouse_box(xx, recenty, wid, 44) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon;
			mouseon = hover
			
			var item = recent_list_display[|i];
			
			// Name
			draw_label(string_limit(filename_name(item.name), namewidth), xx + 12, recenty + 22, fa_left, fa_middle, c_text_main, a_text_main)
			
			// Last opened
			draw_label(string_limit(recent_time_string(item.last_opened), timewidth), timex, recenty + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary)
			
			// Icons
			var iconx = xx + wid - 8;
			iconx -= 24
			
			// Remove
			if (hover)
			{
				if (draw_button_icon("recentdelete" + string(item), iconx, recenty + 8, 24, 24, false, icons.DELETE, null, false, "tooltipremove"))
					action_recent_remove(item)
				mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 24, 24)
			}
			iconx -= 24
			
			// Oh yeah. Pin it
			if (hover || item.pinned)
			{
				if (draw_button_icon("recentpin" + string(item), iconx, recenty + 8, 24, 24, item.pinned, icons.PIN, null, false, "tooltippin"))
					action_recent_pin(item)
				mouseon = mouseon && !app_mouse_box(iconx, recenty + 8, 24, 24)
			}
			
			// Separator
			draw_box(xx + 4, recenty + 43, wid - 8, 1, false, c_overlay, a_overlay)
			
			// Animation
			microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
			
			draw_box(xx, recenty, wid, 44, false, c_overlay, a_overlay * microani_arr[e_microani.HOVER])
			draw_box_hover(xx, recenty, wid, 44, microani_arr[e_microani.HOVER])
			
			draw_box(xx, recenty, wid, 44, false, c_accent_overlay, a_accent_overlay * microani_arr[e_microani.PRESS])
			
			microani_update(mouseon, mouseon && mouse_left, false)
			
			// Load project
			if (mouseon)
			{
				mouse_cursor = cr_handpoint
				
				if (mouse_left_released)
				{
					if (file_exists_lib(item.filename))
					{
						project_load(item.filename)
						window_state = ""
					
						return 0
					}
					else
						error("erroropenprojectexists")
				}
			}
			
			recenty += 44
			
			if (recenty + 44 > yy + hei)
				break
		}
	}
	
	if (mode = "grid")
	{
		// Set scrollbar
		var liststart = 0;
		
		if ((recent_list_amount * 256) > hei)
		{
			window_scroll_focus = string(recent_scrollbar)
			
			scrollbar_draw(recent_scrollbar, e_scroll.VERTICAL, xx + wid + 12, yy, hei, ceil(recent_list_amount/4) * 256)
			liststart = recent_scrollbar.value
		}
	
		// Draw grid cards
		var cardx, cardy, item, areamouseon, hover, mouseon;
		cardx = dx
		cardy = dy - liststart
		areamouseon = app_mouse_box(xx, yy, wid, hei)
		
		clip_begin(xx - 2, yy - 1, wid + 4, hei + 2)
		
		for (var i = 0; i < recent_list_amount; i++)
		{
			// Only draw card if visible
			if (cardy < yy + hei || cardy + 240 + 16 > yy)
			{
				item = recent_list_display[|i];
				hover = areamouseon && app_mouse_box(cardx, cardy, 240, 240) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon;
				mouseon = hover
				
				// Animation
				microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
				
				// Card hover
				draw_box(cardx, cardy, 240, 240, false, c_overlay, a_overlay * microani_arr[e_microani.HOVER])
				draw_box_hover(cardx, cardy, 240, 240, microani_arr[e_microani.HOVER])
				draw_box(cardx, cardy, 240, 240, false, c_accent_overlay, a_accent_overlay * microani_arr[e_microani.PRESS])
				
				// Card outline
				draw_outline(cardx, cardy, 240, 240, 1, item.pinned ? c_accent : c_border, item.pinned ? 1 : a_border)
				
				if (item.thumbnail != null)
					draw_sprite(item.thumbnail, 0, cardx, cardy)
				else
					draw_sprite(spr_missing_thumbnail, 0, cardx, cardy)
				
				// Icons
				var iconwid, iconx;
				iconwid = 4 + ((hover || item.pinned) * 28) + (hover * 28)
				iconx = cardx + 240 - 12 - 24
				mouseon = mouseon && !app_mouse_box(cardx + 240 - iconwid - 8, cardy + 8, iconwid, 32)
				
				if (hover || item.pinned)
				{
					draw_box(cardx + 240 - iconwid - 8, cardy + 8, iconwid, 32, false, c_level_middle, 1)
					draw_outline(cardx + 240 - iconwid - 8, cardy + 8, iconwid, 32, 1, c_border, a_border, true)
				}
				
				// Oh yeah. Pin it
				if (hover || item.pinned)
				{
					if (draw_button_icon("recentpin" + string(item), iconx, cardy + 12, 24, 24, item.pinned, icons.PIN, null, false, "tooltippin", null))
						action_recent_pin(item)
				}
				iconx -= 28
				
				// Remove
				if (hover)
				{
					if (draw_button_icon("recentdelete", iconx, cardy + 12, 24, 24, false, icons.DELETE, null, false, "tooltipremove", null))
						action_recent_remove(item)
				}
				
				microani_set("recent" + string(item), null, mouseon, mouseon && mouse_left, false)
				microani_update(hover, hover && mouse_left, false)
				
				draw_set_font(font_value)
				
				draw_label(string_limit(item.name, 210), cardx + 15, cardy + 209, fa_left, fa_bottom, c_text_main, a_text_main)
				
				draw_label(recent_time_string(item.last_opened), cardx + 15, cardy + 228, fa_left, fa_bottom, c_text_secondary, a_text_secondary)
				
				// Load project
				if (mouseon)
				{
					mouse_cursor = cr_handpoint
				
					if (mouse_left_released)
					{
						if (file_exists_lib(item.filename))
						{
							project_load(item.filename)
							window_state = ""
					
							return 0
						}
						else
							error("erroropenprojectexists")
					}
				}
			}
			
			cardx += 240 + 16
			
			if (cardx > (xx + wid))
			{
				cardx = dx
				cardy += 240 + 16
			}
		}
		
		clip_end()
		
		var gradalpha = .25 * percent(liststart, 0, 25);
		draw_gradient(xx, yy - 1, wid, 16, c_black, gradalpha, gradalpha, 0, 0)
	}
	
	// Update list if anything has changed
	if (recent_list_update)
	{
		recent_update()
		recent_list_update = false
	}
}
