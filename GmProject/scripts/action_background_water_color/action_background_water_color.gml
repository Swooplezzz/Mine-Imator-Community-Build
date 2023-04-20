/// action_background_water_color(color)
/// @arg color

function action_background_water_color(color)
{
	if (!history_undo && !history_redo)
	{
		if (action_tl_select_single(null, e_tl_type.BACKGROUND))
		{
			tl_value_set_start(action_background_water_color, true)
			tl_value_set(e_value.BG_WATER_COLOR, color, false)
			tl_value_set_done()
			return 0
		}
		
		history_set_var(action_background_water_color, background_water_color, color, true)
	}
	
	background_water_color = color
	
	with (obj_resource)
		res_update_colors()
	
	properties.library.preview.update = true
}
