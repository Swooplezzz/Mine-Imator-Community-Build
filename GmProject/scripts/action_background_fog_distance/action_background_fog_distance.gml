/// action_background_fog_distance(value, add)
/// @arg value
/// @arg add

function action_background_fog_distance(val, add)
{
	if (!history_undo && !history_redo)
	{
		if (action_tl_select_single(null, e_tl_type.BACKGROUND))
		{
			tl_value_set_start(action_background_fog_distance, true)
			tl_value_set(e_value.BG_FOG_DISTANCE, val, add)
			tl_value_set_done()
			return 0
		}
		
		history_set_var(action_background_fog_distance, background_fog_distance, background_fog_distance * add + val, true)
	}
	
	background_fog_distance = background_fog_distance * add + val
}
