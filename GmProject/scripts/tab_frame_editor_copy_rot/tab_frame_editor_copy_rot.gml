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
		
		axis_edit = X
		togglebutton_add("frameeditorcopyrotx", null, !tl_edit.value[e_value.COPY_ROT_X], tl_edit.value[e_value.COPY_ROT_X], action_tl_frame_copy_rot, axis_edit)
		
		axis_edit = (setting_z_is_up ? Y : Z)
		togglebutton_add("frameeditorcopyroty", null, !tl_edit.value[e_value.COPY_ROT_X + axis_edit], tl_edit.value[e_value.COPY_ROT_X + axis_edit], action_tl_frame_copy_rot, axis_edit)
		
		axis_edit = (setting_z_is_up ? Z : Y)
		togglebutton_add("frameeditorcopyrotz", null, !tl_edit.value[e_value.COPY_ROT_X + axis_edit], tl_edit.value[e_value.COPY_ROT_X + axis_edit], action_tl_frame_copy_rot, axis_edit)
		
		tab_control_togglebutton()
		draw_togglebutton("frameeditorcopyrotcopyaxis", dx, dy)
		tab_next()
		
		tab_control_checkbox()
		draw_checkbox("frameeditorcopyrotbend", dx, dy, tl_edit.value[e_value.COPY_ROT_BEND], action_tl_frame_copy_rot_bend)
		tab_next()
		
		microani_set("tabcopyrotation", null, false, false, false)
		context_menu_group_temp = e_context_group.COPYROT
		
		tab_frame_editor_buttons()
		draw_label(text_get("frameeditorcopyrotoffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy += 26
		
		var snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		var def = point3D(0, 0, 0)
		
		// Wheels
		if (!app.panel_compact)
		{
			tab_control_wheel()
			axis_edit = X
			draw_wheel("frameeditorcopyrotxoffsetwheel", floor(dx + dw/6), dy + 24, c_axisred, tl_edit.value[e_value.COPY_ROT_OFFSET_X], -no_limit, no_limit, def[X], snapval, tab.constraints.tbx_copy_rot_offset_x, action_tl_frame_copy_rot_offset)
	
			axis_edit = (setting_z_is_up ? Y : Z)
			draw_wheel("frameeditorcopyrotyoffsetwheel", floor(dx + dw/2), dy + 24, c_axisgreen, tl_edit.value[e_value.COPY_ROT_OFFSET_X + axis_edit], -no_limit, no_limit, def[X + axis_edit], snapval, tab.constraints.tbx_copy_rot_offset_y, action_tl_frame_copy_rot_offset)
	
			axis_edit = (setting_z_is_up ? Z : Y)
			draw_wheel("frameeditorcopyrotzoffsetwheel", floor(dx + dw - dw/6), dy + 24, c_axisblue, tl_edit.value[e_value.COPY_ROT_OFFSET_X + axis_edit], -no_limit, no_limit, def[X + axis_edit], snapval, tab.constraints.tbx_copy_rot_offset_z, action_tl_frame_copy_rot_offset)
			tab_next()
		}
		
		// Textboxes
		axis_edit = X
		textfield_group_add("frameeditorcopyrotxoffset", tl_edit.value[e_value.COPY_ROT_OFFSET_X], def[X], action_tl_frame_copy_rot_offset, axis_edit, tab.constraints.tbx_copy_rot_offset_x)
	
		axis_edit = (setting_z_is_up ? Y : Z)
		textfield_group_add("frameeditorcopyrotyoffset", tl_edit.value[e_value.COPY_ROT_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_copy_rot_offset, axis_edit, tab.constraints.tbx_copy_rot_offset_y)
	
		axis_edit = (setting_z_is_up ? Z : Y)
		textfield_group_add("frameeditorcopyrotzoffset", tl_edit.value[e_value.COPY_ROT_OFFSET_X + axis_edit], def[X + axis_edit], action_tl_frame_copy_rot_offset, axis_edit, tab.constraints.tbx_copy_rot_offset_z)
	
		tab_control_textfield_group(false)
		draw_textfield_group("frameeditorcopyrotoffset", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, true, 1)
		tab_next()
		
		// Blend
		tab_control_meter()
		draw_meter("frameeditorcopyrotblend", dx, dy, dw, round(tl_edit.value[e_value.COPY_ROT_BLEND] * 100), 0, 100, 100, 1, tab.constraints.tbx_copy_rot_blend, action_tl_frame_copy_rot_blend)
		tab_next()
		
		microani_set("tabcopyrotation", null, false, false, false)
		microani_update(app_mouse_box(dx, taby, dw, dy - taby) && content_mouseon, false, false)
		
		tab_collapse_end()
	}
}