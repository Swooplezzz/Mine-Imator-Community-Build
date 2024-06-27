/// action_tl_frame_light_spot_gobo_repeat_x(val, add)
/// @arg value
/// @arg add

function action_tl_frame_light_spot_gobo_repeat_x(val, add)
{
	tl_value_set_start(action_tl_frame_light_spot_gobo_repeat_x, true)
	tl_value_set(e_value.LIGHT_SPOT_GOBO_REPEAT_X, val, add)
	tl_value_set_done()
}


