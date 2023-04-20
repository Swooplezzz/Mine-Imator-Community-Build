/// action_res_reload()

function action_res_reload()
{
	var hobj = null;
	
	if (!history_undo && !history_redo)
	{
		load_folder = project_folder
		save_folder = project_folder
		
		with (res_edit)
			res_load(true)
		
		hobj = history_set(action_res_reload)
		with (hobj)
		{
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
			temp_set_scenery(scenery, !app.history_undo, hobj)
		else if (item_tex = res_edit)
			render_generate_item()
		else if (model = res_edit)
		{
			temp_update_model()
			temp_update_model_timeline_tree(hobj)
			temp_update_model_shape()
			temp_update_display_name()
		}
		else if (model_tex = res_edit)
			temp_update_model_shape()
	}
	
	// Restore old timelines
	if (history_undo)
		with (history_data)
			history_restore_parts()
	
	tl_update_length()
	tl_update_list()
	tl_update_matrix()
	
	app_update_tl_edit()
	
	lib_preview.update = true
	res_preview.update = true
	res_preview.reset_view = true
}
