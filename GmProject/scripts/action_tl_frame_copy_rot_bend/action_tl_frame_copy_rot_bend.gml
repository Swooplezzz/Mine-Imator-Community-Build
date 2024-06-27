/// action_tl_frame_copy_rot_bend(enable)
/// @arg enable

function action_tl_frame_copy_rot_bend(enable)
{
	tl_value_set_start(action_tl_frame_copy_rot_bend, false)
	tl_value_set(e_value.COPY_ROT_BEND, enable, false)
	tl_value_set_done()
}