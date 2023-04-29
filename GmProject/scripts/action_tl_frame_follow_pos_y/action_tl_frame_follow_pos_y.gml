/// action_tl_frame_follow_pos_y(enable)
/// @arg enable

function action_tl_frame_follow_pos_y(enable)
{
	tl_value_set_start(action_tl_frame_follow_pos_y, false)
	tl_value_set(e_value.FLW_POS_Y, enable, false)
	tl_value_set_done()
}