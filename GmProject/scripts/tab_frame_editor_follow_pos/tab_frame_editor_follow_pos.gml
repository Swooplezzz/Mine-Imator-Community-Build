//tab_frame_editor_copy_pos()

function tab_frame_editor_copy_pos()
{
	tab_control_switch()
	draw_button_collapse("copypos", collapse_map[?"copypos"], null, true, "frameeditorcopypos", "frameeditorcopypostip")
	tab_next()
	
	if (collapse_map[?"copypos"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.POS_TARGET] != null)
			text = tl_edit.value[e_value.POS_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcopypostarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.POS_TARGET], text, action_tl_frame_copy_pos_target)
		dy+= 32;
		
		draw_label(text_get("frameeditorcopyposcopyaxis"), dx, dy + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy+= 32;
		
		tab_control_switch()
		draw_switch("frameeditorcopyposx", dx + 12, dy, tl_edit.value[e_value.COPY_POS_X], action_tl_frame_copy_pos_x)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorcopyposy", dx + 12, dy, tl_edit.value[e_value.COPY_POS_Y], action_tl_frame_copy_pos_y)
		dy+= 24;

		tab_control_switch()
		draw_switch("frameeditorcopyposz", dx + 12, dy, tl_edit.value[e_value.COPY_POS_Z], action_tl_frame_copy_pos_z)
		tab_next()
		
		/*
		textfield_group_add("frameeditorcopyposxoffset", tl_edit.value[e_value.COPY_POS_OFFSET_X], 0, action_tl_frame_copy_pos_offset_x, X, tab.constraints.tbx_copy_pos_offset_x, null, 1, 0, no_limit)
	    textfield_group_add("frameeditorcopyposyoffset", tl_edit.value[e_value.COPY_POS_OFFSET_Y], 0, action_tl_frame_copy_pos_offset_y, Y, tab.constraints.tbx_copy_pos_offset_y, null, 1, 0, no_limit)
		textfield_group_add("frameeditorcopyposzoffset", tl_edit.value[e_value.COPY_POS_OFFSET_Z], 0, action_tl_frame_copy_pos_offset_z, Z, tab.constraints.tbx_copy_pos_offset_z, null, 1, 0, no_limit)
			
		tab_control_textfield_group()
		draw_textfield_group("frameeditorcopyposoffset", dx, dy, dw, null, null, null, .01, true, false, 1)
		tab_next()
		*/

		tab_collapse_end()
	}
	
}