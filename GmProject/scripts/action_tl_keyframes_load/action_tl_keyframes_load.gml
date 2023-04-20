/// action_tl_keyframes_load(filename)
/// @arg filename

function action_tl_keyframes_load(fn)
{
	if (history_undo)
	{
		tl_keyframes_remove()
		with (history_data)
		{
			history_destroy_loaded()
			history_restore_tl_select()
		}
		
		tl_update_list()
		with (obj_timeline)
			tl_update_values()
		tl_update_matrix()
	}
	else
	{
		var insertpos, hobj, tladd;
		hobj = null
		
		if (history_redo)
		{
			fn = history_data.filename
			insertpos = history_data.insert_pos
			
			if (!file_exists_lib(fn))
				return 0
		}
		else
		{
			if (!file_exists_lib(fn))
				return 0
			
			if (!tl_edit)
			{
				error("erroropenkeyframes")
				return 0
			}
			
			insertpos = timeline_insert_pos
			hobj = history_set(action_tl_keyframes_load)
			with (hobj)
			{
				filename = fn
				id.insert_pos = insertpos
				history_save_tl_select()
			}
		}
		
		tladd = tl_edit
		tl_deselect_all()
		
		// Read file
		action_tl_keyframes_load_file(fn, tladd, insertpos, null)
		project_load_update()
		
		with (hobj)
			history_save_loaded()
		
		project_reset_loaded()
	}
	
	app_update_tl_edit()
}
