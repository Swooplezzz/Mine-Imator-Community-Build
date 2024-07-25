/// view_shape_spotlight(timeline)
/// @arg timeline
/// @desc Renders a spotlight shape.

function view_shape_spotlight(tl)
{
	var points;
	
	// Sphere
	view_shape_circle(tl.world_pos, 2)
	
	// Cone
	points = array(
		point3D(-2, -3, -2),
		point3D(-2, -3, 2),
		point3D(2, -3, -2),
		point3D(2, -3, 2),
		point3D(-4, 6, -4),
		point3D(-4, 6, 4),
		point3D(4, 6, -4),
		point3D(4, 6, 4)
	)
	view_shape_draw(points, tl.matrix)
	
	// Guide (only visible on selected spotlights)
	if (tl.selected && setting_overlay_timeline_guides)
	{
		draw_set_alpha(.5)
		
		// Sharpness
		draw_set_color(c_control_yellow)
		view_shape_spotlight_guidecircle(tl, tl.value[e_value.LIGHT_RANGE], max(0, tl.value[e_value.LIGHT_SPOT_RADIUS]) * clamp((tl.value[e_value.LIGHT_SPOT_SHARPNESS]), 0, 1))
		
		// Fade size
		draw_set_color(c_control_yellow)
		view_shape_spotlight_guidecircle(tl, max(0, tl.value[e_value.LIGHT_RANGE]) * clamp((1 - tl.value[e_value.LIGHT_FADE_SIZE]), 0, 1), tl.value[e_value.LIGHT_SPOT_RADIUS])
		
		// Range
		draw_set_color(c_control_red)
		var length, lensin, lencos;
		length = max(0, tl.value[e_value.LIGHT_RANGE]);
		lensin = sin(degtorad(tl.value[e_value.LIGHT_SPOT_RADIUS] * 0.5));
		lencos = cos(degtorad(tl.value[e_value.LIGHT_SPOT_RADIUS] * 0.5));
		
		view_shape_line(point3D_mul_matrix(point3D(0, 0, 0), tl.matrix), point3D_mul_matrix(point3D(0, length, 0), tl.matrix))
	
		// Spot radius
		view_shape_line(point3D_mul_matrix(point3D(0, 0, 0), tl.matrix), point3D_mul_matrix(point3D(0, abs(length * lencos), length * lensin), tl.matrix))
		view_shape_line(point3D_mul_matrix(point3D(0, 0, 0), tl.matrix), point3D_mul_matrix(point3D(0, abs(length * lencos), length * -lensin), tl.matrix))
		view_shape_line(point3D_mul_matrix(point3D(0, 0, 0), tl.matrix), point3D_mul_matrix(point3D(length * lensin, abs(length * lencos), 0), tl.matrix))
		view_shape_line(point3D_mul_matrix(point3D(0, 0, 0), tl.matrix), point3D_mul_matrix(point3D(length * -lensin, abs(length * lencos), 0), tl.matrix))
	
		view_shape_spotlight_guidecircle(tl, tl.value[e_value.LIGHT_RANGE], tl.value[e_value.LIGHT_SPOT_RADIUS])
		
		draw_set_color(c_white)
		draw_set_alpha(1)
	}
}

function view_shape_spotlight_guidecircle(tl, range, radius)
{
	var length, lensin, lencos;
	length = max(0, range);
	lensin = sin(degtorad(radius * 0.5));
	lencos = cos(degtorad(radius * 0.5));
	
	var start3D, end3D, detail;
	detail = 32;
	start3D = point3D_mul_matrix(point3D(cos(0) * length * lensin, sin(0) * length * lensin, 0), tl.matrix)
	
	// Draw circle
	for (var i = 0; i <= 1; i += 1/detail)
	{
		end3D = point3D_mul_matrix(point3D(cos(pi * 2 * i) * length * lensin, abs(length * lencos), sin(pi * 2 * i) * length * lensin), tl.matrix)
		
		// Using 0 to set up start positions
		if (i > 0)
			view_shape_line(start3D, end3D)
		
		start3D = end3D
	}
}