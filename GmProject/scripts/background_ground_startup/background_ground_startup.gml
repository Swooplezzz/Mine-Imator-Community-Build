/// background_ground_startup()
/// @desc Creates the vbuffer for drawing the ground.

function background_ground_startup()
{
	var totalsize, size, rep;
	
	log("Ground vbuffer init")
	
	totalsize = (project_render_distance div 256) * 256
	size = totalsize / 16
	rep = size / 16
	
	background_ground_texture = null
	background_ground_texture_material = null
	background_ground_texture_normal = null
	background_ground_ani = false
	background_ground_material_ani = false
	background_ground_normal_ani = false
	background_ground_ani_texture[0] = null
	background_ground_ani_texture_material[0] = null
	background_ground_ani_tex_normal[0] = null
	
	background_ground_vbuffer = vbuffer_start()
	
	for (var xx = -totalsize; xx < totalsize; xx += size)
	{
		for (var yy = -totalsize; yy < totalsize; yy += size)
		{
			vertex_add(xx, yy, -0.01, 0, 0, 1, 0, 0)
			vertex_add(xx + size, yy, -0.01, 0, 0, 1, rep, 0)
			vertex_add(xx, yy + size, -0.01, 0, 0, 1, 0, rep)
			vertex_add(xx + size, yy, -0.01, 0, 0, 1, rep, 0)
			vertex_add(xx + size, yy + size, -0.01, 0, 0, 1, rep, rep)
			vertex_add(xx, yy + size, -0.01, 0, 0, 1, 0, rep)
		}
	}
	vbuffer_done()
}
