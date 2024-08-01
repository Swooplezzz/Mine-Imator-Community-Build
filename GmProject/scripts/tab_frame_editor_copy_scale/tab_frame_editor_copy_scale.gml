//tab_frame_editor_copy_scale()

function tab_frame_editor_copy_scale()
{
	if (tl_edit.type = e_tl_type.PATH_POINT)
		return 0
	
	tab_control_switch()
	draw_button_collapse("copyscale", collapse_map[?"copyscale"], null, true, "frameeditorcopyscale", "frameeditorcopyscaletip")
	tab_next()
	
	if (collapse_map[?"copyscale"])
	{
		tab_collapse_start()
		var text;
		
		// Target object
		if (tl_edit.value[e_value.SCALE_TARGET] != null)
			text = tl_edit.value[e_value.SCALE_TARGET].display_name
		else
			text = text_get("listnone")
		
		tab_control_menu()
		draw_button_menu("frameeditorcopyscaletarget", e_menu.TIMELINE, dx, dy, dw, 24, tl_edit.value[e_value.SCALE_TARGET], text, action_tl_frame_copy_scale_target)
		tab_next()
		
		axis_edit = X
		togglebutton_add("frameeditorcopyscalex", null, !tl_edit.value[e_value.COPY_SCALE_X], tl_edit.value[e_value.COPY_SCALE_X], action_tl_frame_copy_scale, axis_edit)
		
		axis_edit = (setting_z_is_up ? Y : Z)
		togglebutton_add("frameeditorcopyscaley", null, !tl_edit.value[e_value.COPY_SCALE_X + axis_edit], tl_edit.value[e_value.COPY_SCALE_X + axis_edit], action_tl_frame_copy_scale, axis_edit)
		
		axis_edit = (setting_z_is_up ? Z : Y)
		togglebutton_add("frameeditorcopyscalez", null, !tl_edit.value[e_value.COPY_SCALE_X + axis_edit], tl_edit.value[e_value.COPY_SCALE_X + axis_edit], action_tl_frame_copy_scale, axis_edit)
		
		tab_control_togglebutton()
		draw_togglebutton("frameeditorcopyrotcopyaxis", dx, dy)
		tab_next()
		
		// Blend
		tab_control_meter()
		draw_meter("frameeditorcopyscaleblend", dx, dy, dw, round(tl_edit.value[e_value.COPY_SCALE_BLEND] * 100), 0, 100, 100, 1, tab.constraints.tbx_copy_scale_blend, action_tl_frame_copy_scale_blend)
		tab_next()
		
		tab_collapse_end()
	}
}