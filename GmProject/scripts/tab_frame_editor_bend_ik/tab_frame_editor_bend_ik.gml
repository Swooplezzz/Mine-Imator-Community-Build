/// tab_frame_editor_bend_ik()

function tab_frame_editor_bend_ik()
{
	if (tl_edit.type != e_tl_type.BODYPART || !tl_edit.value_type[e_value_type.TRANSFORM_BEND] || tl_edit.model_part = null)
		return 0
	
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
			// Influence
		tab_control_dragger()
		draw_dragger("frameeditorbendikinfluence", dx, dy, dragger_width, tl_edit.value[e_value.BEND_IK_INFLUENCE], 0.1, -no_limit, no_limit, 0, snap_min, tab.constraints.tbx_bend_ik_influence, action_tl_frame_bend_ik_influence, null, true, tl_edit.value[e_value.BEND_IK_TARGET] = null)
		tab_next()
		
		tab_collapse_end()
	}
}