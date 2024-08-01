/// action_tl_frame_look_at_offset(value, add)
/// @arg value
/// @arg add

function action_tl_frame_look_at_offset(val, add)
{
	tl_value_set_start(action_tl_frame_look_at_offset, true)
	tl_value_set(e_value.LOOK_AT_OFFSET_X + axis_edit, val, add)
	tl_value_set_done()
}
