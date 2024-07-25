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
	if (tl.selected && setting_overlay_camera_frustum && tl.value[e_value.CAM_FOV] % 180 != 0)
		view_shape_camera_frustum(tl)
}

function view_shape_camera_frustum(tl)
{
	var ratio, sizemath;
	ratio = (tl.value[e_value.CAM_WIDTH] / tl.value[e_value.CAM_HEIGHT]) * tl.value[e_value.CAM_ASPECT]
	sizemath = tan(degtorad(tl.value[e_value.CAM_FOV] * 0.5)) // Multiply this by distance
	
	var viewfrustumpoints = array(
		point3D(-((sizemath * cam_near) * ratio), cam_near, -sizemath * cam_near), //nbr
		point3D(-((sizemath * cam_near) * ratio), cam_near, sizemath * cam_near), //ntr
		point3D(((sizemath * cam_near) * ratio), cam_near, -sizemath * cam_near), //nbl
		point3D(((sizemath * cam_near) * ratio), cam_near, sizemath * cam_near), //ntl
		point3D(-((sizemath * cam_far) * ratio), cam_far, -sizemath * cam_far), //fbr
		point3D(-((sizemath * cam_far) * ratio), cam_far, sizemath * cam_far), //ftr
		point3D(((sizemath * cam_far) * ratio), cam_far, -sizemath * cam_far), //fbl
		point3D(((sizemath * cam_far) * ratio), cam_far, sizemath * cam_far) //ftl
	)
	
	// DOF visualizer
	if (tl.value[e_value.CAM_DOF])
		view_shape_camera_frustum_dof(tl)
	
	/*
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
	
	// Frustum edge triangles
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
	
	// Frustum end triangles
	render_set_culling(false)
	draw_primitive_begin(pr_trianglelist)
	
	draw_set_alpha(.15)
	draw_set_color(c_control_red)
	view_shape_triangle_draw(viewfrustum[0], viewfrustum[1], viewfrustum[2])
	view_shape_triangle_draw(viewfrustum[1], viewfrustum[2], viewfrustum[3])
	
	view_shape_triangle_draw(viewfrustum[4], viewfrustum[5], viewfrustum[6])
	view_shape_triangle_draw(viewfrustum[5], viewfrustum[6], viewfrustum[7])
	
	draw_primitive_end()
	render_set_culling(true)
	draw_set_alpha(1)
	*/
	
	//		var mat = tl.matrix;
	//	var pos = tl.world_pos;
	//	var tl_cam_up = vec3(0);
		
	//	var pos_lookat = point3D_mul_matrix(point3D(0, 1, 0), mat);
	//	var tl_cam_from = point3D_copy(pos)
	//	var tl_cam_to = point3D_copy(pos_lookat)
	//	tl_cam_up[X] = mat[8]
	//	tl_cam_up[Y] = mat[9]
	//	tl_cam_up[Z] = mat[10]
	//	var tl_cam_fov = max(1, tl.value[e_value.CAM_FOV])
	//	var tl_cam_aspect = max(0, tl.value[e_value.CAM_ASPECT] * render_width / render_height)
		
	//var mV = matrix_create_lookat(tl_cam_from, tl_cam_to, tl_cam_up);
	//var mP = matrix_build_projection_perspective_fov(-tl_cam_fov, -tl_cam_aspect, cam_near, cam_far_prev);
	//cam_frustum.build(matrix_multiply(mV, mP))
	//cam_frustum.build_vbuffer()
	//vbuffer_render_matrix(cam_frustum.vbuffer, matrix_multiply(matrix_inverse(matrix_create_lookat(cam_from,cam_to,cam_up)),tl.matrix));
	
	// Frustum outline
	draw_set_color(c_control_red)
	draw_set_alpha(.5)
	view_shape_draw(viewfrustumpoints, tl.matrix)
	draw_set_alpha(1)
}

function view_shape_camera_frustum_dof(tl)
{
	var ratio, sizemath;
	ratio = (tl.value[e_value.CAM_WIDTH] / tl.value[e_value.CAM_HEIGHT]) * tl.value[e_value.CAM_ASPECT]
	sizemath = tan(degtorad(tl.value[e_value.CAM_FOV] * 0.5)) // Multiply this by distance
	
	var dofnear, doffar, dofblurnear, dofblurfar;
	dofnear = min(cam_far, max(cam_near, tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]))
	doffar = min(cam_far, max(cam_near, tl.value[e_value.CAM_DOF_DEPTH] + tl.value[e_value.CAM_DOF_RANGE]))
	dofblurnear = min(cam_far, max(cam_near, (tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]) - tl.value[e_value.CAM_DOF_FADE_SIZE]))
	dofblurfar = min(cam_far, max(cam_near, (tl.value[e_value.CAM_DOF_DEPTH] + tl.value[e_value.CAM_DOF_RANGE]) + tl.value[e_value.CAM_DOF_FADE_SIZE]))
		
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
	/*
	var viewfrustumdof = array(
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[0], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[1], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[2], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[3], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[4], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[5], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[6], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofpoints[7], tl.matrix))
	)
	var viewfrustumdofblur = array(
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[0], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[1], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[2], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[3], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[4], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[5], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[6], tl.matrix)),
		view_shape_project(point3D_mul_matrix(viewfrustumdofblurpoints[7], tl.matrix))
	)
	
	// DOF end triangles
	render_set_culling(false)
	draw_primitive_begin(pr_trianglelist)
	
	draw_set_alpha(.15)
	draw_set_color(c_control_blue)
	view_shape_triangle_draw(viewfrustumdof[0], viewfrustumdof[1], viewfrustumdof[2])
	view_shape_triangle_draw(viewfrustumdof[1], viewfrustumdof[2], viewfrustumdof[3])
	
	view_shape_triangle_draw(viewfrustumdof[4], viewfrustumdof[5], viewfrustumdof[6])
	view_shape_triangle_draw(viewfrustumdof[5], viewfrustumdof[6], viewfrustumdof[7])
	
	draw_set_color(c_control_cyan)
	view_shape_triangle_draw(viewfrustumdofblur[0], viewfrustumdofblur[1], viewfrustumdofblur[2])
	view_shape_triangle_draw(viewfrustumdofblur[1], viewfrustumdofblur[2], viewfrustumdofblur[3])
	
	view_shape_triangle_draw(viewfrustumdofblur[4], viewfrustumdofblur[5], viewfrustumdofblur[6])
	view_shape_triangle_draw(viewfrustumdofblur[5], viewfrustumdofblur[6], viewfrustumdofblur[7])
	
	draw_primitive_end()
	render_set_culling(true)
	draw_set_alpha(1)
	*/
	
	// DOF outlines
	draw_set_alpha(.375)
	draw_set_color(c_control_blue)
	
	view_shape_draw(viewfrustumdofpoints, tl.matrix)
	
	draw_set_color(c_control_cyan)
	
	view_shape_draw(viewfrustumdofblurpoints, tl.matrix)
		
	draw_set_alpha(1)
}