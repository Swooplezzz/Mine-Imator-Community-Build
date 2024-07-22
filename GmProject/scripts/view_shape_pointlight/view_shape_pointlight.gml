/// view_shape_pointlight(timeline)
/// @arg timeline
/// @desc Renders a pointlight shape.

function view_shape_pointlight(tl)
{
	// Bulb
	view_shape_circle(point3D_add(tl.world_pos, vec3(0, 0, 4)), 4)
	
	// Base
	view_shape_box(point3D_add(tl.world_pos, vec3(-1.5, -1.5, -4)), point3D_add(tl.world_pos, vec3(1.5, 1.5, 0)))
	
	// Guide (only visible on selected pointlights)
	if (tl.selected && setting_overlay_timeline_guides)
		view_shape_pointlight_guide(tl)
}

function view_shape_pointlight_guide(tl)
{
	draw_set_alpha(.5)
	
	// Range
	draw_set_color(c_control_red)
	view_shape_circle(point3D_add(tl.world_pos, vec3(0, 0, 0)), max(0, tl.value[e_value.LIGHT_RANGE]))
	
	// Fade size
	draw_set_color(c_control_yellow)
	view_shape_circle(point3D_add(tl.world_pos, vec3(0, 0, 0)), max(0, tl.value[e_value.LIGHT_RANGE]) * clamp((1 - tl.value[e_value.LIGHT_FADE_SIZE]), 0, 1))
	
	draw_set_color(c_white)
	draw_set_alpha(1)
}