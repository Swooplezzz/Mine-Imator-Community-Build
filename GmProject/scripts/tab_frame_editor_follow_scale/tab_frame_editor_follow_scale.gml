//tab_frame_editor_follow_scale()

function tab_frame_editor_follow_scale(){
	
	tab_control_switch()
	draw_button_collapse("followscale", collapse_map[?"followscale"], null, true, "frameeditorfollowscale", "frameeditorfollowscale")
	tab_next()
	
	if (collapse_map[?"followscale"])
	{
		tab_collapse_start()
		var text;
			// Target object
		if (tl_edit.value[e_value.SCALE_TARGET] != null)
			text = tl_edit.value[e_value.SCALE_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorfollowscaletarget",e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.SCALE_TARGET], text, action_tl_frame_follow_scale_target)
		dy+= 32;
		
	draw_label(text_get("frameeditorfollowscalefollowaxis"), dx, dy + 22, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
				dy+= 32;


		tab_control_switch()
		draw_switch("frameeditorfollowscalex",  dx + 12, dy,  tl_edit.value[e_value.FLW_SCALE_X], action_tl_frame_follow_scale_x)
		dy+= 24;
		tab_control_switch()
		draw_switch("frameeditorfollowscaley",  dx + 12, dy, tl_edit.value[e_value.FLW_SCALE_Y], action_tl_frame_follow_scale_y)
						dy+= 24;

		tab_control_switch()
		draw_switch("frameeditorfollowscalez", dx + 12, dy, tl_edit.value[e_value.FLW_SCALE_Z], action_tl_frame_follow_scale_z)
				tab_next()
				
					// Strength
	

		tab_collapse_end()
		
	}
		
}