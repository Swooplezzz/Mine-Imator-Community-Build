/// view_shape_camera(timeline)
/// @arg timeline
/// @desc Renders a camera shape.

function view_shape_camera(tl)
{
	// Lens
	var lens = array(
		point3D(-1.5, 5, -1.5),
		point3D(-1.5, 5, 1.5),
		point3D(1.5, 5, -1.5),
		point3D(1.5, 5, 1.5),
		point3D(-3, 9, -3),
		point3D(-3, 9, 3),
		point3D(3, 9, -3),
		point3D(3, 9, 3)
	)
	view_shape_draw(lens, tl.matrix)
	
	// Box
	view_shape_box(point3D(-3.5, -5, -4), point3D(3.5, 5, 4), tl.matrix)
	
	// Rolls
	view_shape_circle(point3D(0, 3, 6.5), 2.5, tl.matrix)
	view_shape_circle(point3D(0, -3, 6.5), 2.5, tl.matrix)
	
	// Frustum (only visible on selected cameras)
	if (tl.selected && tl.value[e_value.CAM_FOV] % 180 != 0)
		view_shape_camera_frustum(tl)
}

function view_shape_camera_frustum(tl)
{
	var distnear, distfar, ratio, sizemath;
	distnear = cam_near
	distfar = cam_far
	
	ratio = (tl.value[e_value.CAM_WIDTH] / tl.value[e_value.CAM_HEIGHT]) * tl.value[e_value.CAM_ASPECT]
	sizemath = tan(degtorad(tl.value[e_value.CAM_FOV] * 0.5)) // Multiply this by distance
	
	var viewfrustumpoints = array(
		point3D(-((sizemath * distnear) * ratio), distnear, -sizemath * distnear), //nbr
		point3D(-((sizemath * distnear) * ratio), distnear, sizemath * distnear), //ntr
		point3D(((sizemath * distnear) * ratio), distnear, -sizemath * distnear), //nbl
		point3D(((sizemath * distnear) * ratio), distnear, sizemath * distnear), //ntl
		point3D(-((sizemath * distfar) * ratio), distfar, -sizemath * distfar), //fbr
		point3D(-((sizemath * distfar) * ratio), distfar, sizemath * distfar), //ftr
		point3D(((sizemath * distfar) * ratio), distfar, -sizemath * distfar), //fbl
		point3D(((sizemath * distfar) * ratio), distfar, sizemath * distfar) //ftl
	)
	
	// DOF visualizer
	if (tl.value[e_value.CAM_DOF])
	{
		var dofnear, doffar, dofblurnear, dofblurfar;
		dofnear = min(distfar, max(distnear, tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]))
		doffar = min(distfar, max(distnear, tl.value[e_value.CAM_DOF_DEPTH] + tl.value[e_value.CAM_DOF_RANGE]))
		dofblurnear = min(distfar, max(distnear, (tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]) - tl.value[e_value.CAM_DOF_FADE_SIZE]))
		dofblurfar = min(distfar, max(distnear, (tl.value[e_value.CAM_DOF_DEPTH] + tl.value[e_value.CAM_DOF_RANGE]) + tl.value[e_value.CAM_DOF_FADE_SIZE]))
		
		var viewfrustumdofpoints = array(
			point3D(-((sizemath * dofnear) * ratio), dofnear, -sizemath * dofnear), //nbr
			point3D(-((sizemath * dofnear) * ratio), dofnear, sizemath * dofnear), //ntr
			point3D(((sizemath * dofnear) * ratio), dofnear, -sizemath * dofnear), //nbl
			point3D(((sizemath * dofnear) * ratio), dofnear, sizemath * dofnear), //ntl
			point3D(-((sizemath * doffar) * ratio), doffar, -sizemath * doffar), //fbr
			point3D(-((sizemath * doffar) * ratio), doffar, sizemath * doffar), //ftr
			point3D(((sizemath * doffar) * ratio), doffar, -sizemath * doffar), //fbl
			point3D(((sizemath * doffar) * ratio), doffar, sizemath * doffar) //ftl
		)
		var viewfrustumdofblurpoints = array(
			point3D(-((sizemath * dofblurnear) * ratio), dofblurnear, -sizemath * dofblurnear), //nbr
			point3D(-((sizemath * dofblurnear) * ratio), dofblurnear, sizemath * dofblurnear), //ntr
			point3D(((sizemath * dofblurnear) * ratio), dofblurnear, -sizemath * dofblurnear), //nbl
			point3D(((sizemath * dofblurnear) * ratio), dofblurnear, sizemath * dofblurnear), //ntl
			point3D(-((sizemath * dofblurfar) * ratio), dofblurfar, -sizemath * dofblurfar), //fbr
			point3D(-((sizemath * dofblurfar) * ratio), dofblurfar, sizemath * dofblurfar), //ftr
			point3D(((sizemath * dofblurfar) * ratio), dofblurfar, -sizemath * dofblurfar), //fbl
			point3D(((sizemath * dofblurfar) * ratio), dofblurfar, sizemath * dofblurfar) //ftl
		)
		
		draw_set_alpha(.375)
		draw_set_color(c_control_blue)
		
		view_shape_draw(viewfrustumdofpoints, tl.matrix)
		
		draw_set_color(c_control_cyan)
		
		view_shape_draw(viewfrustumdofblurpoints, tl.matrix)
		
		draw_set_alpha(1)
	}
	
	draw_set_color(c_control_red)
	draw_set_alpha(.5)
	view_shape_draw(viewfrustumpoints, tl.matrix)
	draw_set_alpha(1)
	
	/*
	// Use triangles (glitches when out of work camera view :/ )
	var viewfrustum = array(
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[0], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[1], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[2], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[3], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[4], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[5], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[6], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumpoints[7], tl.matrix))
	)
		
	render_set_culling(false)
	draw_primitive_begin(pr_trianglelist)
		
	draw_set_alpha(.15)
	draw_set_color(c_control_blue)
	view_shape_triangle_draw(viewfrustum[0], viewfrustum[1], viewfrustum[4])
	view_shape_triangle_draw(viewfrustum[5], viewfrustum[4], viewfrustum[1])
		
	view_shape_triangle_draw(viewfrustum[3], viewfrustum[2], viewfrustum[7])
	view_shape_triangle_draw(viewfrustum[6], viewfrustum[7], viewfrustum[2])
		
	draw_set_color(merge_color(c_control_blue, c_white, 0.25))
	view_shape_triangle_draw(viewfrustum[1], viewfrustum[3], viewfrustum[5])
	view_shape_triangle_draw(viewfrustum[7], viewfrustum[5], viewfrustum[3])
		
	draw_set_color(merge_color(c_control_blue, c_black, 0.25))
	view_shape_triangle_draw(viewfrustum[2], viewfrustum[0], viewfrustum[6])
	view_shape_triangle_draw(viewfrustum[4], viewfrustum[6], viewfrustum[0])
		
	draw_primitive_end()
	render_set_culling(true)
	draw_set_alpha(1)
	*/
}