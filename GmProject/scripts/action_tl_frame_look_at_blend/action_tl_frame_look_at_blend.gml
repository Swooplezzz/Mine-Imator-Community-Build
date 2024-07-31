/// action_tl_frame_look_at_blend(value, add)
/// @arg value
/// @arg add

function action_tl_frame_look_at_blend(val, add)
{
	tl_value_set_start(action_tl_frame_look_at_blend, true)
	tl_value_set(e_value.LOOK_AT_BLEND, val / 100, add)
	tl_value_set_done()
}
