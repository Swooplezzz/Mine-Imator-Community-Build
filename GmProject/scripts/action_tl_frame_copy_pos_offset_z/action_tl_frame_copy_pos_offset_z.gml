/// action_tl_frame_copy_pos_offset_z(value, add)
/// @arg value
/// @arg add

function action_tl_frame_copy_pos_offset_z(value, add)
{
	tl_value_set_start(action_tl_frame_copy_pos_offset_z, true)
	tl_value_set(e_value.COPY_POS_OFFSET_Z, value, add)
	tl_value_set_done()
}