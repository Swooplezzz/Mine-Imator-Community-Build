/// action_tl_keyframes_paste(position)
/// @arg position

function action_tl_keyframes_paste(position)
{
	if (history_undo)
	{
		with (history_data)
		{
			tl_keyframes_remove()
			history_restore_tl_select()
		}
	}
	else
	{
		var pos;
		if (history_redo)
		{
			pos = history_data.paste_pos
			copy_kf_amount = history_data.copy_kf_amount
			copy_kf_tl_save_id = array_copy_1d(history_data.copy_kf_tl_save_id)
			copy_kf_pos = array_copy_1d(history_data.copy_kf_pos)
			copy_kf_value = array_copy_2d(history_data.copy_kf_value)
			copy_kf_tl_part_of_save_id = array_copy_1d(history_data.copy_kf_tl_part_of_save_id)
			copy_kf_tl_model_part_name = array_copy_1d(history_data.copy_kf_tl_model_part_name)
		}
		else
		{
			pos = position
			with (history_set(action_tl_keyframes_paste))
			{
				paste_pos = pos
				copy_kf_amount = app.copy_kf_amount
				copy_kf_tl_save_id = array_copy_1d(app.copy_kf_tl_save_id)
				copy_kf_pos = array_copy_1d(app.copy_kf_pos)
				copy_kf_value = array_copy_2d(app.copy_kf_value)
				copy_kf_tl_part_of_save_id = array_copy_1d(app.copy_kf_tl_part_of_save_id)
				copy_kf_tl_model_part_name = array_copy_1d(app.copy_kf_tl_model_part_name)
				history_save_tl_select()
			}
		}
		
		tl_keyframes_paste(pos)
	}
	
	with (obj_timeline)
		tl_update_values()
	
	tl_update_matrix()
	tl_update_length()
	
	app_update_tl_edit()
}
