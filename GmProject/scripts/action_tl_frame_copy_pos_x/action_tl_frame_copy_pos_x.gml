/// action_tl_frame_copy_pos_x(enable)
/// @arg enable

function action_tl_frame_copy_pos_x(enable)
{
	tl_value_set_start(action_tl_frame_copy_pos_x, false)
	tl_value_set(e_value.COPY_POS_X, enable, false)
	tl_value_set_done()
}