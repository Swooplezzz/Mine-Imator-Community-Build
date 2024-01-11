//tab_frame_editor_copy_rot()

function tab_frame_editor_copy_rot()
{
	tab_control_switch()
	draw_button_collapse("copyrot", collapse_map[?"copyrot"], null, true, "frameeditorcopyrot", "frameeditorcopyrottip")
	tab_next()
	
	if (collapse_map[?"copyrot"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.ROT_TARGET] != null)
			text = tl_edit.value[e_value.ROT_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcopyrottarget",e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.ROT_TARGET], text, action_tl_frame_copy_rot_target)
		dy+= 32;
		
		draw_label(text_get("frameeditorcopyrotcopyaxis"), dx, dy + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy+= 32;
		
		tab_control_switch()
		draw_switch("frameeditorcopyrotx", dx + 12, dy, tl_edit.value[e_value.COPY_ROT_X], action_tl_frame_copy_rot_x)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorcopyroty", dx + 12, dy, tl_edit.value[e_value.COPY_ROT_Y], action_tl_frame_copy_rot_y)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorcopyrotz", dx + 12, dy, tl_edit.value[e_value.COPY_ROT_Z], action_tl_frame_copy_rot_z)
		tab_next()
		
		tab_collapse_end()
	}
	
}