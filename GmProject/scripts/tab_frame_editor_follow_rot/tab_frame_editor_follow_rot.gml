//tab_frame_editor_follow_rot()

function tab_frame_editor_follow_rot()
{
	tab_control_switch()
	draw_button_collapse("followrot", collapse_map[?"followrot"], null, true, "frameeditorfollowrot", "frameeditorfollowrottip")
	tab_next()
	
	if (collapse_map[?"followrot"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.ROT_TARGET] != null)
			text = tl_edit.value[e_value.ROT_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorfollowrottarget",e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.ROT_TARGET], text, action_tl_frame_follow_rot_target)
		dy+= 32;
		
		draw_label(text_get("frameeditorfollowrotfollowaxis"), dx, dy + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy+= 32;
		
		tab_control_switch()
		draw_switch("frameeditorfollowrotx", dx + 12, dy, tl_edit.value[e_value.FLW_ROT_X], action_tl_frame_follow_rot_x)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorfollowroty", dx + 12, dy, tl_edit.value[e_value.FLW_ROT_Y], action_tl_frame_follow_rot_y)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorfollowrotz", dx + 12, dy, tl_edit.value[e_value.FLW_ROT_Z], action_tl_frame_follow_rot_z)
		tab_next()
		
		tab_collapse_end()
	}
	
}