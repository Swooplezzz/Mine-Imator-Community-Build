/// action_tl_frame_light_spot_gobo_offset_x(value, add)
/// @arg value
/// @arg add

function action_tl_frame_light_spot_gobo_offset_x(val, add)
{
	tl_value_set_start(action_tl_frame_light_spot_gobo_offset_x, true)
	tl_value_set(e_value.LIGHT_SPOT_GOBO_OFFSET_X, val, add)
	tl_value_set_done()
}
