/// action_tl_frame_copy_pos_child(enable)
/// @arg enable

function action_tl_frame_copy_pos_child(enable)
{
	tl_value_set_start(action_tl_frame_copy_pos_child, false)
	tl_value_set(e_value.COPY_POS_CHILD, enable, false)
	tl_value_set_done()
}