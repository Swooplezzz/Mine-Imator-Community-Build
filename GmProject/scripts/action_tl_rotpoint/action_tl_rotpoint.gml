/// action_tl_rotpoint(value, add)
/// @arg value
/// @arg add

function action_tl_rotpoint(val, add)
{
	if (history_undo)
	{
		with (history_data)
		{
			for (var t = 0; t < save_var_amount; t++)
			{
				with (save_id_find(save_var_save_id[t]))
				{
					rot_point[axis_edit] = other.save_var_old_value[t]
					tl_update_rot_point()
				}
			}
		}
	}
	else if (history_redo)
	{
		with (history_data)
		{
			for (var t = 0; t < save_var_amount; t++)
			{
				with (save_id_find(save_var_save_id[t]))
				{
					rot_point[axis_edit] = other.save_var_new_value[t]
					tl_update_rot_point()
				}
			}
		}
	}
	else
	{
		var hobj = history_save_var_start(action_tl_rotpoint, true);
	
		with (obj_timeline)
		{
			if (!selected)
				continue
			
			with (hobj)
				history_save_var(other.id, other.rot_point[axis_edit], other.rot_point[axis_edit] * add + val)
			
			rot_point[axis_edit] = rot_point[axis_edit] * add + val
			tl_update_rot_point()
		}
	}
	
	tl_update_matrix()
}
