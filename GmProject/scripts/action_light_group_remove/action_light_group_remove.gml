/// action_light_group_remove()

function action_light_group_remove()
{
	if (history_undo)
	{
		with (history_data)
		{
			light_group_edit = history_restore_lightgroup(temp_save_obj)
			ds_list_add(app.light_groups, light_group_edit)
			sortlist_add(app.tab.lightgroups.list, light_group_edit)
		}
	}
	else
	{
		var hobj = null;
		
		if (!history_redo)
			hobj = history_set(action_light_group_remove)
		
		if (!history_redo) // Backup template and selection
			with (hobj)
				temp_save_obj = history_save_lightgroup(light_group_edit)
		
		with (obj_timeline)
			if (light_group = light_group_edit)
				light_group = null

		ds_list_delete_value(light_groups, light_group_edit)
		sortlist_remove(tab.lightgroups.list, light_group_edit)
		
		with (light_group_edit)
			instance_destroy()
			
		light_group_edit = null
	}
}