//tab_frame_editor_look_at()

function tab_frame_editor_look_at()
{
	if (tl_edit.type = e_tl_type.PATH_POINT)
		return 0
	
	tab_control_switch()
	draw_button_collapse("lookat", collapse_map[?"lookat"], null, true, "frameeditorlookat", "frameeditorlookattip")
	tab_next()
	var taby = dy
	if (collapse_map[?"lookat"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.LOOK_AT_TARGET] != null)
			text = tl_edit.value[e_value.LOOK_AT_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorlookattarget",e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.LOOK_AT_TARGET], text, action_tl_frame_look_at_target)
		tab_next()
		
		microani_set("tablookat", null, false, false, false)
		textfield_group_add("frameeditorlookatxoffset", tl_edit.value[e_value.LOOK_AT_OFFSET_X], 0, action_tl_frame_look_at_offset_x, X, tab.constraints.tbx_look_at_offset_x, null, 0.1, -no_limit, no_limit)
	    textfield_group_add("frameeditorlookatyoffset", (setting_z_is_up ? tl_edit.value[e_value.LOOK_AT_OFFSET_Y] : tl_edit.value[e_value.LOOK_AT_OFFSET_Z]), 0, (setting_z_is_up ? action_tl_frame_look_at_offset_y : action_tl_frame_look_at_offset_z), Y,tab.constraints.tbx_look_at_offset_y, null, 0.1, -no_limit, no_limit)
		textfield_group_add("frameeditorlookatzoffset",  (setting_z_is_up ? tl_edit.value[e_value.LOOK_AT_OFFSET_Z] :tl_edit.value[e_value.LOOK_AT_OFFSET_Y]), 0, (setting_z_is_up ? action_tl_frame_look_at_offset_z : action_tl_frame_look_at_offset_y), Z,tab.constraints.tbx_look_at_offset_z, null, 0.1, -no_limit, no_limit)

		var snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		context_menu_group_temp = e_context_group.COPYROT
		tab_frame_editor_buttons()
		
		draw_label(text_get("frameeditorlookatoffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	    dy += 26
		
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorlookatoffset", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, false, 1)
		tab_next()
		
		microani_set("tablookat", null, false, false, false)
	    microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
		
		tab_collapse_end()
	}
}