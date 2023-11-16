/// action_res_remove()

function action_res_remove()
{
	var hobj = null;
	
	if (history_undo)
	{
		with (history_data)
			res_edit = history_restore_res(save_res)
	}
	else if (!history_redo)
	{
		hobj = history_set(action_res_remove)
		with (hobj)
		{
			save_res = history_save_res(res_edit)
			part_amount = 0
			part_child_amount = 0
			history_save_tl_select()
		}
		
		tl_deselect_all()
	}
	
	// Update affected templates
	with (obj_template)
	{
		if (scenery = res_edit)
		{
			if (!app.history_undo)
				scenery = null
			temp_set_scenery(scenery, !app.history_undo, hobj)
		}
		else if (model = res_edit)
		{
			if (!app.history_undo)
				model = null
			temp_update_model()
			temp_update_model_timeline_tree(hobj)
			temp_update_model_shape()
			temp_update_display_name()
		}
		else
			temp_update()
		
		// Update pattern
		if (type = e_temp_type.SPECIAL_BLOCK && pattern_type != "")
			array_add(pattern_update, id)
		
		temp_update_armor(id)
	}
	
	// Restore old timelines
	if (history_undo)
	{
		with (history_data)
			history_restore_parts()
	}
	else
		with (res_edit)
			instance_destroy()
	
	project_ik_part_array = null
	
	tl_update_length()
	tl_update_list()
	tl_update_matrix()
	
	app_update_tl_edit()
	
	bench_settings.preview.update = true
	lib_preview.update = true
	res_preview.update = true
	res_preview.reset_view = true
}
