/// action_tl_frame_light_type(mode)
/// @arg mode

function action_tl_frame_light_type(mode)
{
	tl_edit.type = mode
	render_samples = -1
	
	with(tl_edit)
		tl_update_value_types()
	
	app_update_tl_edit()
}