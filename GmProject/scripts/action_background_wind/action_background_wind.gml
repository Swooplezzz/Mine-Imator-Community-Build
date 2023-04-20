/// action_background_wind(wind)
/// @arg wind

function action_background_wind(wind)
{
	if (!history_undo && !history_redo)
	{
		if (action_tl_select_single(null, e_tl_type.BACKGROUND))
		{
			tl_value_set_start(action_background_wind, true)
			tl_value_set(e_value.BG_WIND, wind, false)
			tl_value_set_done()
			return 0
		}
		
		history_set_var(action_background_wind, background_wind, wind, false)
	}
	
	background_wind = wind
}
