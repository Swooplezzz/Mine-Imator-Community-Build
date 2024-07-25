/// tab_timeline_editor_light()

function tab_timeline_editor_light()
{
	tab_control_togglebutton()

	togglebutton_add("timelineeditorlightpoint", null, e_tl_type.POINT_LIGHT, tl_edit.type = e_tl_type.POINT_LIGHT, action_tl_frame_light_type)
	togglebutton_add("timelineeditorlightspot", null, e_tl_type.SPOT_LIGHT, tl_edit.type = e_tl_type.SPOT_LIGHT, action_tl_frame_light_type)
	draw_togglebutton("timelineeditorlightlighttype", dx, dy)

	tab_next()
}