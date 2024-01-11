/// tab_frame_editor_bend_ik()

function tab_frame_editor_bend_ik()
{
	tab_control_switch()
	draw_button_collapse("bendik", collapse_map[?"bendik"], null, true, "frameeditorbendik", "frameeditorbendiktip")
	tab_next()
	
	if (collapse_map[?"bendik"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.BEND_IK_TARGET] != null)
			text = tl_edit.value[e_value.BEND_IK_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorbendiktarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.BEND_IK_TARGET], text, action_tl_frame_bend_ik_target)
		tab_next()
		
		tab_collapse_end()
	}
}