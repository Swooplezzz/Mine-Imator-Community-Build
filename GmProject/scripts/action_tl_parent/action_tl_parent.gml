/// action_tl_parent(parent, index)
/// @arg parent
/// @arg index

function action_tl_parent(par, index)
{
	if (history_undo)
	{
		with (history_data)
		{
			for (var t = 0; t < tl_amount; t++)
			{
				with (save_id_find(tl_save_id[t]))
				{
					tl_set_parent(save_id_find(other.tl_old_parent_save_id[t]), other.tl_old_parent_tree_index[t])
					value[e_value.POS_X] = other.tl_old_x[t]
					value[e_value.POS_Y] = other.tl_old_y[t]
					value[e_value.POS_Z] = other.tl_old_z[t]
				}
			}
		}
	}
	else
	{
		var hobj;
		hobj = null
		
		if (history_redo)
		{
			par = save_id_find(history_data.new_parent)
			index = history_data.new_index
		}
		else
		{
			if (par = null)
				par = app
			
			hobj = history_set(action_tl_parent)
			with (hobj)
			{
				new_parent = save_id_get(par)
				new_index = index
				tl_amount = 0
			}
		}
		
		with (obj_timeline)
			moved = false
		
		action_tl_parent_tree(hobj, par, index)
		with (timeline_move_obj)
			action_tl_parent_tree(hobj, par, index)
	}
	
	tl_update_list()
	tl_update_matrix()
}
