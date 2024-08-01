/// action_tl_frame_copy_rot(enable)
/// @arg enable

function action_tl_frame_copy_rot(enable)
{
	tl_value_set_start(action_tl_frame_copy_rot, false)
	tl_value_set(e_value.COPY_ROT_X + axis_edit, enable, false)
	tl_value_set_done()
}