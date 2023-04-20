/// panel_area_draw()

function panel_area_draw()
{
	// Calculate area
	panel_area_x = 0
	panel_area_y = toolbar_size
	panel_area_width = window_width
	panel_area_height = window_height - toolbar_size
	
	tab_move_mouseon_panel = null
	tab_move_mouseon_position = 0
	
	// Shortcut bar
	panel_area_height -= (28 * setting_show_shortcuts_bar)
	
	// Set size
	with (obj_panel)
	{
		size_ani += test_reduced_motion(1, 0.035 * delta)
		size_ani = clamp(size_ani, 0, 1)
		size_real_ani = ceil((size_real - 16) + (16 * ease("easeoutcirc", size_ani)))
		
		glow_ani += test_reduced_motion(1, 0.035 * delta)
		glow_ani = clamp(glow_ani, 0, 1)
		size_glow = (size - 16) + (16 * ease("easeoutcirc", glow_ani))
		
		size_real = size * (tab_list_amount > 0)
	}
	
	// Stop panels overlapping
	panel_map[?"left_secondary"].size_real -= max(0, panel_map[?"left"].size_real + panel_map[?"left_secondary"].size_real + panel_map[?"right_secondary"].size_real + panel_map[?"right"].size_real - panel_area_width)
	panel_map[?"left"].size_real -= max(0, panel_map[?"left"].size_real + panel_map[?"right"].size_real + panel_map[?"right_secondary"].size_real - panel_area_width)
	panel_map[?"bottom"].size_real -= max(0, panel_map[?"top"].size_real + panel_map[?"bottom"].size_real - panel_area_height)
	
	// Set max size
	panel_map[?"left"].size_real = min(panel_map[?"left"].size_real, panel_area_width)
	panel_map[?"right"].size_real = min(panel_map[?"right"].size_real, panel_area_width)
	panel_map[?"top"].size_real = min(panel_map[?"top"].size_real, panel_area_height)
	panel_map[?"bottom"].size_real = min(panel_map[?"bottom"].size_real, panel_area_height)
	
	// Draw views
	view_area_draw()
	
	// Draw panels
	panel_draw(panel_map[?"left_secondary"])
	panel_draw(panel_map[?"right_secondary"])
	panel_draw(panel_map[?"bottom"])
	panel_draw(panel_map[?"top"])
	panel_draw(panel_map[?"left"])
	panel_draw(panel_map[?"right"])
	
	// Resizing
	if (window_busy = "panelresize")
	{
		if (panel_resize = panel_map[?"left"] || panel_resize = panel_map[?"left_secondary"])
		{
			mouse_cursor = cr_size_we
			panel_resize.size = max(200, panel_resize_size + (mouse_x - mouse_click_x))
		}
		else if (panel_resize = panel_map[?"right"] || panel_resize = panel_map[?"right_secondary"])
		{
			mouse_cursor = cr_size_we
			panel_resize.size = max(200, panel_resize_size - (mouse_x - mouse_click_x))
		}
		else if (panel_resize = panel_map[?"bottom"])
		{
			mouse_cursor = cr_size_ns
			panel_resize.size = max(32, panel_resize_size - (mouse_y - mouse_click_y))
		}
		else if (panel_resize = panel_map[?"top"])
		{
			mouse_cursor = cr_size_ns
			panel_resize.size = max(50, panel_resize_size + (mouse_y - mouse_click_y))
		}
		
		if (!mouse_left)
		{
			panel_resize = null
			window_busy = ""
		}
	}
	
	// Moving
	if (window_busy = "tabmove")
	{
		panel_move_draw()
		
		// Find panel
		if (tab_move_mouseon_panel = null)
		{
			// Calculate sizes of the boxes to check
			var toph, bottomh, lefttopw, leftbottomw, righttopw
			toph = view_area_height
			bottomh = view_area_height
			lefttopw = view_area_width
			leftbottomw = view_area_width
			righttopw = view_area_width
			
			// Top panel
			if (!panel_map[?"left"].size_real || !panel_map[?"left_secondary"].size_real || !panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
				toph *= 0.33
			else if (!panel_map[?"bottom"].size_real)
				toph *= 0.5
				
			// Bottom panel
			if (!panel_map[?"left"].size_real || !panel_map[?"left_secondary"].size_real || !panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
				bottomh *= 0.33
			else if (!panel_map[?"top"].size_real)
				bottomh *= 0.5
				
			// Left top
			if (!panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
				lefttopw *= 0.5
			if (!panel_map[?"left_secondary"].size_real)
				lefttopw *= 0.5
				
			// Left bottom
			if (!panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
				leftbottomw *= 0.5
				
			// Right top
			if (!panel_map[?"left"].size_real || !panel_map[?"left_secondary"].size_real)
				righttopw *= 0.5
			if (!panel_map[?"right_secondary"].size_real)
				righttopw *= 0.5
			
			/*
			if (mouse_y <= view_area_y + toph && !panel_map[?"top"].size_real)
				tab_move_mouseon_panel = panel_map[?"top"]
			else
			*/
			
			if (mouse_y >= view_area_y + view_area_height - bottomh && !panel_map[?"bottom"].size_real)
				tab_move_mouseon_panel = panel_map[?"bottom"]
			else if (mouse_x <= view_area_x + lefttopw && !panel_map[?"left"].size_real)
				tab_move_mouseon_panel = panel_map[?"left"]
			else if (mouse_x <= view_area_x + leftbottomw && !panel_map[?"left_secondary"].size_real)
				tab_move_mouseon_panel = panel_map[?"left_secondary"]
			else if (mouse_x >= view_area_x + view_area_width - righttopw && !panel_map[?"right"].size_real)
				tab_move_mouseon_panel = panel_map[?"right"]
			else
				tab_move_mouseon_panel = panel_map[?"right_secondary"]
			
			if (tab_move_mouseon_panel_prev != tab_move_mouseon_panel)
			{
				if (tab_move_mouseon_panel_prev != null)
				{
					tab_move_mouseon_panel_prev.glow = false
					tab_move_mouseon_panel_prev.glow_ani = 0	
				}
				
				if (tab_move_mouseon_panel != null)
				{
					tab_move_mouseon_panel.glow_ani = 0
					tab_move_mouseon_panel.glow = true
				}
			}
			
			tab_move_mouseon_panel_prev = tab_move_mouseon_panel
		}
		
		// Let it go
		if (!mouse_left)
		{
			// Create new window or reset to last panel
			if (tab_move_mouseon_panel = null)
			{
				if (tab_move.window != e_window.MAIN)
					window_create(tab_move.window, mouse_x + tab_move_box_x, mouse_y + tab_move_box_y, tab_move_box_width, tab_move_box_height)
				else
					tab_move_mouseon_panel = tab_move.panel_last
			}
			
			panel_tab_list_add(tab_move_mouseon_panel, tab_move_mouseon_position, tab_move)
			window_busy = ""
			tab_move_mouseon_panel_prev = null
			
			// Play 'open' animation
			if (tab_move_mouseon_panel.tab_list_amount = 1)
				tab_move_mouseon_panel.size_ani = 0
			
			with (obj_tab)
				glow = 0
				
			with (obj_panel)
			{
				list_glow = 0
				glow = false
			}
		}
	}
	
	panel_compact = false
}
