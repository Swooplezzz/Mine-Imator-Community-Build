/// tab_frame_editor_copy_pos()

function tab_frame_editor_copy_pos()
{
	tab_control_switch()
	draw_button_collapse("copypos", collapse_map[?"copypos"], null, true, "frameeditorcopypos", "frameeditorcopypostip")
	tab_next()
	
	var taby = dy
	if (collapse_map[?"copypos"])
	{
		tab_collapse_start()

		// Target object
		var text;
		if (tl_edit.value[e_value.POS_TARGET] != null)
			text = tl_edit.value[e_value.POS_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcopypostarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.POS_TARGET], text, action_tl_frame_copy_pos_target)
		tab_next()
		
		axis_edit = X
		togglebutton_add("frameeditorcopyposx", null, !tl_edit.value[e_value.COPY_POS_X], tl_edit.value[e_value.COPY_POS_X], action_tl_frame_copy_pos, axis_edit)
		
		axis_edit = (setting_z_is_up ? Y : Z)
		togglebutton_add("frameeditorcopyposy", null, !tl_edit.value[e_value.COPY_POS_X + axis_edit], tl_edit.value[e_value.COPY_POS_X + axis_edit], action_tl_frame_copy_pos, axis_edit)
		
		axis_edit = (setting_z_is_up ? Z : Y)
		togglebutton_add("frameeditorcopyposz", null, !tl_edit.value[e_value.COPY_POS_X + axis_edit], tl_edit.value[e_value.COPY_POS_X + axis_edit], action_tl_frame_copy_pos, axis_edit)
		
		tab_control_togglebutton()
		draw_togglebutton("frameeditorcopyposcopyaxis", dx, dy)
		tab_next()
		
		tab_control_checkbox()
		draw_checkbox("frameeditorcopyposchild", dx, dy, tl_edit.value[e_value.COPY_POS_CHILD], action_tl_frame_copy_pos_child)
		draw_checkbox("frameeditorcopyposbend", dx + dw/2, dy, tl_edit.value[e_value.COPY_POS_BEND], action_tl_frame_copy_pos_bend)
		tab_next()
		
		microani_set("tabcopyposition", null, false, false, false)
		context_menu_group_temp = e_context_group.COPYPOS
		
		tab_frame_editor_buttons()
		draw_label(text_get("frameeditorcopyposoffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy += 26
		
		var mul, def, snapval;
		mul = max(1, point3D_distance(tl_edit.world_pos, cam_from)) / 100
		def = point3D(0, 0, 0)
		snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		axis_edit = X
		textfield_group_add("frameeditorcopyposxoffset", tl_edit.value[e_value.COPY_POS_OFFSET_X], def[X], action_tl_frame_copy_pos_offset, axis_edit, tab.constraints.tbx_copy_pos_offset_x, null, mul)
		
		axis_edit = (setting_z_is_up ? Y : Z)
		textfield_group_add("frameeditorcopyposyoffset", tl_edit.value[e_value.COPY_POS_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_copy_pos_offset, axis_edit, tab.constraints.tbx_copy_pos_offset_y, null, mul)
		
		axis_edit = (setting_z_is_up ? Z : Y)
		textfield_group_add("frameeditorcopyposzoffset", tl_edit.value[e_value.COPY_POS_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_copy_pos_offset, axis_edit, tab.constraints.tbx_copy_pos_offset_z, null, mul)
		
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorcopyposoffset", dx, dy, dw, null, -no_limit, no_limit, snapval, false, true, 1) 
		tab_next()
		
		// Blend
		tab_control_meter()
		draw_meter("frameeditorcopyposblend", dx, dy, dw, round(tl_edit.value[e_value.COPY_POS_BLEND] * 100), 0, 100, 100, 1, tab.constraints.tbx_copy_pos_blend, action_tl_frame_copy_pos_blend)
		tab_next()
		
		microani_set("tabcopyposition", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
		
		tab_collapse_end()
	}
}