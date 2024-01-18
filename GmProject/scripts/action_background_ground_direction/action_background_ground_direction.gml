/// action_background_ground_direction(value, add)
/// @arg value
/// @arg add

function action_background_ground_direction(val, add)
{
	if (!history_undo && !history_redo)
	{
		if (action_tl_select_single(null, e_tl_type.BACKGROUND))
		{
			tl_value_set_start(action_background_ground_direction, true)
			tl_value_set(e_value.BG_GROUND_DIRECTION, val, add)
			tl_value_set_done()
			return 0
		}
		
		history_set_var(action_background_ground_direction, background_ground_direction, background_ground_direction * add + val, true)
	}
	
	background_ground_direction = background_ground_direction * add + val
}
