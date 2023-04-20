/// action_tl_select_keyframes_first()

function action_tl_select_keyframes_first()
{
	if (history_undo)
	{
		with (history_data)
			history_restore_tl_select()
	}
	else if (history_redo)
	{
		with (history_data)
			history_restore_tl_select_new()
	}
	else
	{
		var shift = keyboard_check(vk_shift);
		
		var hobj;
		hobj = history_set(action_tl_select_keyframes_first)
		
		with (hobj)
			history_save_tl_select()
		
		if (!shift)
			tl_deselect_all()
		
		with (obj_timeline)
		{
			if (lock || ds_list_size(keyframe_list) = 0)
				continue
			
			tl_keyframe_select(keyframe_list[|0])
		}
		
		with (hobj)
			history_save_tl_select_new()
	}
	
	app_update_tl_edit()
}
