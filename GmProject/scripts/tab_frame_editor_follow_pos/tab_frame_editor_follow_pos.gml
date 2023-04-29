//tab_frame_editor_follow_rot()

function tab_frame_editor_follow_pos()
{
	tab_control_switch()
	draw_button_collapse("followpos", collapse_map[?"followpos"], null, true, "frameeditorfollowpos", "frameeditorfollowpostip")
	tab_next()
	
	if (collapse_map[?"followpos"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.POS_TARGET] != null)
			text = tl_edit.value[e_value.POS_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorfollowpostarget",e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.POS_TARGET], text, action_tl_frame_follow_pos_target)
		dy+= 32;
		
		draw_label(text_get("frameeditorfollowposfollowaxis"), dx, dy + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
		dy+= 32;
		
		tab_control_switch()
		draw_switch("frameeditorfollowposx",  dx + 12, dy,  tl_edit.value[e_value.FLW_POS_X], action_tl_frame_follow_pos_x)
		dy+= 24;
		
		tab_control_switch()
		draw_switch("frameeditorfollowposy",  dx + 12, dy, tl_edit.value[e_value.FLW_POS_Y], action_tl_frame_follow_pos_y)
		dy+= 24;

		tab_control_switch()
		draw_switch("frameeditorfollowposz", dx + 12, dy, tl_edit.value[e_value.FLW_POS_Z], action_tl_frame_follow_pos_z)
		tab_next()
		
		//textfield_group_add("frameeditorfollowposxoffset", tl_edit.value[e_value.FLW_POS_OFFSET_X], 0, action_tl_frame_follow_pos_offset_x, X, tab.constraints.tbx_follow_pos_offset_x, null, 1, 0, no_limit)

	    //textfield_group_add("frameeditorfollowposyoffset", tl_edit.value[e_value.FLW_POS_OFFSET_Y], 0, action_tl_frame_follow_pos_offset_y, Y, tab.constraints.tbx_follow_pos_offset_y, null, 1, 0, no_limit)

		//textfield_group_add("frameeditorfollowposzoffset", tl_edit.value[e_value.FLW_POS_OFFSET_Z], 0, action_tl_frame_follow_pos_offset_z, Z, tab.constraints.tbx_follow_pos_offset_z, null, 1, 0, no_limit)
			
		//tab_control_textfield_group()
		//draw_textfield_group("frameeditorfollowposoffset", dx, dy, dw, null, null, null, .01, true, false, 1)
		//tab_next()

		tab_collapse_end()
	}
	
}