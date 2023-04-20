/// vbuffer_render(vbuffer, [position, [rotation, [scale]]])
/// @arg vbuffer
/// @arg [position
/// @arg [rotation
/// @arg [scale]]]

function vbuffer_render()
{
	var mat;
	var vbuf = argument[0];
	
	if (vbuf = null)
		return false
		
	if (argument_count > 1)
	{
		var pos, rot, sca;
		if (argument_count > 1)
			pos = argument[1]
		else
			pos = point3D(0, 0, 0)
		
		if (argument_count > 2)
			rot = argument[2]
		else
			rot = vec3(0, 0, 0)
		
		if (argument_count > 3)
			sca = argument[3]
		else
			sca = vec3(1, 1, 1)
		
		mat = matrix_get(matrix_world)
		matrix_set(matrix_world, matrix_create(pos, rot, sca))
	}
	
	vertex_submit(vbuf, pr_trianglelist, -1)
	
	if (argument_count > 1)
		matrix_set(matrix_world, mat)
}
