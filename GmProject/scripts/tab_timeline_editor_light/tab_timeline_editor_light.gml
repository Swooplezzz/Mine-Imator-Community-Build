/// tab_timeline_editor_light()

function tab_timeline_editor_light()
{
	if (tl_edit.type = e_tl_type.POINT_LIGHT || tl_edit.type = e_tl_type.SPOT_LIGHT)
	{
		tab_control_togglebutton()

		togglebutton_add("timelineeditorlightpoint", null, e_tl_type.POINT_LIGHT, tl_edit.type = e_tl_type.POINT_LIGHT, action_tl_frame_light_type)
		togglebutton_add("timelineeditorlightspot", null, e_tl_type.SPOT_LIGHT, tl_edit.type = e_tl_type.SPOT_LIGHT, action_tl_frame_light_type)
		draw_togglebutton("timelineeditorlightlighttype", dx, dy)

		tab_next()
	}
	
	var group, text;
	group = tl_edit.light_group
	
	if (group != null)
		text = group.name
	else
		text = text_get("listnone")
			
	if (group = null)
		text = text_get("listdefault", text)
	
	if (setting_advanced_mode)
	{
		tab_control_menu(ui_large_height)
		draw_button_menu("timelineeditorlightgroup", e_menu.LIST, dx, dy, dw, ui_large_height, tl_edit.light_group, text, action_tl_light_group, false)
		tab_next()
	}
}