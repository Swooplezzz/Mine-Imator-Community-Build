/// tab_properties_info()

function tab_timeline_editor_info()
{
	// Name
	tab_control_textfield()
	tab.info.tbx_name.text = tl_edit.name
	draw_textfield("timelineeditorname", dx, dy, dw, 24, tab.info.tbx_name, action_tl_name, string_remove_newline(tl_edit.display_name), "top")
	tab_next()
	
	if (tl_edit.type = e_temp_type.TEXT)
	{
		// Text
		tab_control_textfield(true, 76)
		tab.info.tbx_text.text = tl_edit.text
		draw_textfield("timelineeditortext", dx, dy, dw, 76, tab.info.tbx_text, action_tl_text, "", "top")
		tab_next()
	}
	
	// Type
	tab_control(ui_small_height)
	draw_label_value(dx, dy, dw, ui_small_height, text_get("timelineeditortype"), string_remove_newline(tl_edit.type_name))
	tab_next()
	
	// Rotation point (Advanced mode only)
	if (tl_edit.value_type[e_value_type.ROT_POINT] && setting_advanced_mode)
	{
		tab_control_switch()
		draw_switch("timelineeditorrotpointcustom", dx, dy, tl_edit.rot_point_custom, action_tl_rotpoint_custom)
		tab_next()
		
		if (tl_edit.rot_point_custom)
		{
			var snapval, mul, def;
			snapval = (dragger_snap ? setting_snap_size_position : snap_min)
			mul = max(1, point3D_distance(tl_edit.world_pos, cam_from)) / 500
			if (tl_edit.part_of = null && tl_edit.temp != null)
				def = tl_edit.temp.rot_point
			else
				def = point3D(0, 0, 0)
			
			axis_edit = X
			textfield_group_add("timelineeditorrotpointx", tl_edit.rot_point[axis_edit], def[axis_edit], action_tl_rotpoint, axis_edit, tab.info.tbx_rot_point_x)
			
			axis_edit = (setting_z_is_up ? Y : Z)
			textfield_group_add("timelineeditorrotpointy", tl_edit.rot_point[axis_edit], def[axis_edit], action_tl_rotpoint, axis_edit, tab.info.tbx_rot_point_y)
			
			axis_edit = (setting_z_is_up ? Z : Y)
			textfield_group_add("timelineeditorrotpointz", tl_edit.rot_point[axis_edit], def[axis_edit], action_tl_rotpoint, axis_edit, tab.info.tbx_rot_point_z)
			
			context_menu_group_temp = e_context_group.ROT_POINT
			
			tab_control_textfield_group(false)
			draw_textfield_group("timelineeditorrotpoint", dx, dy, dw, mul, -no_limit, no_limit, snapval, false, true, 1)
			tab_next()
			
			context_menu_group_temp = null
		}
	}
}
