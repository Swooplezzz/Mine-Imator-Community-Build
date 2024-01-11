/// action_tl_frame_copy_rot_y(enable)
/// @arg enable

function action_tl_frame_copy_rot_y(enable)
{
	tl_value_set_start(action_tl_frame_copy_rot_y, false)
	tl_value_set(e_value.COPY_ROT_Y, enable, false)
	tl_value_set_done()
}