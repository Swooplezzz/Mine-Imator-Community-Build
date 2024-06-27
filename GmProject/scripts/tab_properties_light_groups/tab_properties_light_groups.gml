/// tab_properties_light_groups()

function tab_properties_light_groups()
{
	tab_control_sortlist(6)
	sortlist_draw(tab.lightgroups.list, dx, dy, dw, tab_control_h, light_group_edit, false)
	tab_next()
	
	// Tools
	tab_control(24)
	
	if (draw_button_icon("lightgroupnew", dx, dy, 24, 24, false, icons.ASSET_ADD, null, false, "tooltiplightgroupnew"))
		action_light_group_add()
	
	if (draw_button_icon("lightgroupremove", dx + (28), dy, 24, 24, false, icons.DELETE, null, light_group_edit = null, "tooltiplightgroupremove"))
		action_light_group_remove()
	
	tab_next()
	
	if (light_group_edit = null)
		return 0
		
	// Name
	tab_control_textfield(false)
	tab.lightgroups.tbx_name.text = light_group_edit.name
	draw_textfield("lightgroupname", dx, dy, dw, 24, tab.lightgroups.tbx_name, action_light_group_name, light_group_edit.name, "left")
	tab_next()
}
