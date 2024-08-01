/// action_tl_frame_copy_pos(enable)
/// @arg enable

function action_tl_frame_copy_pos(enable)
{
	tl_value_set_start(action_tl_frame_copy_pos, false)
	tl_value_set(e_value.COPY_POS_X + axis_edit, enable, false)
	tl_value_set_done()
}