/// action_tl_frame_copy_rot_x(enable)
/// @arg enable

function action_tl_frame_copy_rot_x(enable)
{
	tl_value_set_start(action_tl_frame_copy_rot_x, false)
	tl_value_set(e_value.COPY_ROT_X, enable, false)
	tl_value_set_done()
}