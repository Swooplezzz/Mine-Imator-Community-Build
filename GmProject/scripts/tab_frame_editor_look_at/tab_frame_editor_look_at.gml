/// tab_frame_editor_look_at()

function tab_frame_editor_look_at()
{
	if (tl_edit.type = e_tl_type.PATH_POINT)
		return 0
	
	tab_control_switch()
	draw_button_collapse("lookat", collapse_map[?"lookat"], null, true, "frameeditorlookat")
	tab_next()
	
	var taby = dy
	if (collapse_map[?"lookat"])
	{
		tab_collapse_start()
		
		// Target object
		var text;
		if (tl_edit.value[e_value.LOOK_AT_TARGET] != null)
			text = tl_edit.value[e_value.LOOK_AT_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorlookattarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.LOOK_AT_TARGET], text, action_tl_frame_look_at_target)
		tab_next()
		
		microani_set("tablookat", null, false, false, false)
		
		context_menu_group_temp = e_context_group.LOOKAT
		
		tab_frame_editor_buttons()
		draw_label(text_get("frameeditorlookatoffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy += 26
		
		var snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		var def = point3D(0, 0, 0)
		
		// Wheels
		if (!app.panel_compact)
		{
			tab_control_wheel()
			axis_edit = X
			draw_wheel("frameeditorlookatxoffsetwheel", floor(dx + dw/6), dy + 24, c_axisred, tl_edit.value[e_value.LOOK_AT_OFFSET_X], -no_limit, no_limit, def[X], snapval, tab.constraints.tbx_look_at_offset_x, action_tl_frame_look_at_offset)
	
			axis_edit = (setting_z_is_up ? Y : Z)
			draw_wheel("frameeditorlookatyoffsetwheel", floor(dx + dw/2), dy + 24, c_axisgreen, tl_edit.value[e_value.LOOK_AT_OFFSET_X + axis_edit], -no_limit, no_limit, def[X + axis_edit], snapval, tab.constraints.tbx_look_at_offset_y, action_tl_frame_look_at_offset)
	
			axis_edit = (setting_z_is_up ? Z : Y)
			draw_wheel("frameeditorlookatzoffsetwheel", floor(dx + dw - dw/6), dy + 24, c_axisblue, tl_edit.value[e_value.LOOK_AT_OFFSET_X + axis_edit], -no_limit, no_limit, def[X + axis_edit], snapval, tab.constraints.tbx_look_at_offset_z, action_tl_frame_look_at_offset)
			tab_next()
		}
		
		// Textboxes
		axis_edit = X
		textfield_group_add("frameeditorlookatxoffset", tl_edit.value[e_value.LOOK_AT_OFFSET_X], def[X], action_tl_frame_look_at_offset, axis_edit, tab.constraints.tbx_look_at_offset_x)
	
		axis_edit = (setting_z_is_up ? Y : Z)
		textfield_group_add("frameeditorlookatyoffset", tl_edit.value[e_value.LOOK_AT_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_look_at_offset, axis_edit, tab.constraints.tbx_look_at_offset_y)
	
		axis_edit = (setting_z_is_up ? Z : Y)
		textfield_group_add("frameeditorlookatzoffset", tl_edit.value[e_value.LOOK_AT_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_look_at_offset, axis_edit, tab.constraints.tbx_look_at_offset_z)
	
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorlookatoffset", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, true, 1)
		tab_next()
		
		// Blend
		tab_control_meter()
		draw_meter("frameeditorlookatblend", dx, dy, dw, round(tl_edit.value[e_value.LOOK_AT_BLEND] * 100), 0, 100, 100, 1, tab.constraints.tbx_look_at_blend, action_tl_frame_look_at_blend)
		tab_next()
		
		microani_set("tablookat", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
		
		tab_collapse_end()
	}
}