//tab_frame_editor_copy_rot()

function tab_frame_editor_copy_rot()
{
	if (tl_edit.type = e_tl_type.PATH_POINT)
		return 0
	
	tab_control_switch()
	draw_button_collapse("copyrot", collapse_map[?"copyrot"], null, true, "frameeditorcopyrot", "frameeditorcopyrottip")
	tab_next()
	
	var taby = dy
	if (collapse_map[?"copyrot"])
	{
		tab_collapse_start()
		
		// Target object
		var text;
		if (tl_edit.value[e_value.ROT_TARGET] != null)
			text = tl_edit.value[e_value.ROT_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcopyrottarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.ROT_TARGET], text, action_tl_frame_copy_rot_target)
		tab_next()
		
		dy += 12
		togglebutton_add("frameeditorcopyrotx", null, !tl_edit.value[e_value.COPY_ROT_X], tl_edit.value[e_value.COPY_ROT_X], action_tl_frame_copy_rot_x)
		togglebutton_add("frameeditorcopyroty", null, !(setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_Y] : tl_edit.value[e_value.COPY_ROT_Z]), (setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_Y] : tl_edit.value[e_value.COPY_ROT_Z]), (setting_z_is_up ? action_tl_frame_copy_rot_y : action_tl_frame_copy_rot_z))
		togglebutton_add("frameeditorcopyrotz", null, !(setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_Z] : tl_edit.value[e_value.COPY_ROT_Y]), (setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_Z] : tl_edit.value[e_value.COPY_ROT_Y]), (setting_z_is_up ? action_tl_frame_copy_rot_z : action_tl_frame_copy_rot_y))
		
		tab_control_togglebutton()
		draw_togglebutton("frameeditorcopyrotcopyaxis", dx, dy)
		tab_next()
		
		tab_control_checkbox()
		draw_checkbox("frameeditorcopyrotbend", dx, dy, tl_edit.value[e_value.COPY_ROT_BEND], action_tl_frame_copy_pos_bend)
		tab_next()
		
		microani_set("tabcopyrotation", null, false, false, false)
		context_menu_group_temp = e_context_group.COPYROT
		
		tab_frame_editor_buttons()
		draw_label(text_get("frameeditorcopyrotoffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy += 26
		
		var snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		axis_edit = X
		textfield_group_add("frameeditorcopyrotxoffset", tl_edit.value[e_value.COPY_ROT_OFFSET_X], 0, action_tl_frame_copy_rot_offset_x, axis_edit, tab.constraints.tbx_copy_rot_offset_x, null, 0.1, -no_limit, no_limit)
		axis_edit = (setting_z_is_up ? Y : Z)
		textfield_group_add("frameeditorcopyrotyoffset", (setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_OFFSET_Y] : tl_edit.value[e_value.COPY_ROT_OFFSET_Z]), 0, (setting_z_is_up ? action_tl_frame_copy_rot_offset_y : action_tl_frame_copy_rot_offset_z), axis_edit, tab.constraints.tbx_copy_rot_offset_y, null, 0.1, -no_limit, no_limit)
		axis_edit = (setting_z_is_up ? Z : Y)
		textfield_group_add("frameeditorcopyrotzoffset", (setting_z_is_up ? tl_edit.value[e_value.COPY_ROT_OFFSET_Z] : tl_edit.value[e_value.COPY_ROT_OFFSET_Y]), 0, (setting_z_is_up ? action_tl_frame_copy_rot_offset_z : action_tl_frame_copy_rot_offset_y), axis_edit, tab.constraints.tbx_copy_rot_offset_z, null, 0.1, -no_limit, no_limit)
		
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorcopyrotoffset", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, false, 1)
		tab_next()
		
		microani_set("tabcopyrotation", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
		
		tab_collapse_end()
	}
}