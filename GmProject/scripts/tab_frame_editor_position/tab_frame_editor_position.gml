/// tab_frame_editor_position()

function tab_frame_editor_position()
{
	if (!tl_edit.value_type[e_value_type.TRANSFORM_POS])
		return 0
	
	context_menu_group_temp = e_context_group.POSITION
	tab_frame_editor_buttons()
	draw_label(text_get("frameeditorposition"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	dy += 26
	
	var mul, def, snapval;
	mul = max(1, point3D_distance(tl_edit.world_pos, cam_from)) / 100
	
	// Parts default to their spawn position, other objects to (0, 0, 0)
	if (tl_edit.part_of = null || tl_edit.type = e_tl_type.CAMERA)
		def = point3D(0, 0, 0)
	else
		def = point3D(tl_edit.value_default[e_value.POS_X], tl_edit.value_default[e_value.POS_Y], tl_edit.value_default[e_value.POS_Z])
	
	snapval = (dragger_snap ? setting_snap_size_position : snap_min)
	
	// Ignore default values for camera
	axis_edit = X
	textfield_group_add("frameeditorpositionx", tl_edit.value[e_value.POS_X], def[X], action_tl_frame_pos, axis_edit, tab.transform.tbx_pos_x, null, mul / tl_edit.value_inherit[e_value.SCA_X])
	
	axis_edit = (setting_z_is_up ? Y : Z)
	textfield_group_add("frameeditorpositiony", tl_edit.value[e_value.POS_X + axis_edit], def[X + axis_edit], action_tl_frame_pos, axis_edit, tab.transform.tbx_pos_y, null, mul / tl_edit.value_inherit[e_value.SCA_X + axis_edit])
	
	axis_edit = (setting_z_is_up ? Z : Y)
	textfield_group_add("frameeditorpositionz", tl_edit.value[e_value.POS_X + axis_edit], def[X + axis_edit], action_tl_frame_pos, axis_edit, tab.transform.tbx_pos_z, null, mul / tl_edit.value_inherit[e_value.SCA_X + axis_edit])
	
	tab_control_textfield_group(false)
	draw_textfield_group("frameeditorposition", dx, dy, dw, null, -no_limit, no_limit, snapval, false, true, 1)
	tab_next()
	
	context_menu_group_temp = null
}
