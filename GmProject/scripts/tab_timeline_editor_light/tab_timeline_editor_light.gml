// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tab_timeline_editor_light(){
tab_control_togglebutton()
	togglebutton_add("frameeditorlightspot", null, e_tl_type.SPOT_LIGHT, tl_edit.type = e_tl_type.SPOT_LIGHT, action_tl_frame_light_type)
	togglebutton_add("frameeditorlightpoint", null, e_tl_type.POINT_LIGHT, tl_edit.type = e_tl_type.POINT_LIGHT, action_tl_frame_light_type)
	draw_togglebutton("frameeditorlightlighttype", dx, dy)
tab_next()
}