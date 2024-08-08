/// tl_update_path()

function tl_update_path()
{
	if (type != e_tl_type.PATH)
		return 0
	
	path_update = false
	
	// Clear
	if (path_vbuffer != null)
	{
		vbuffer_destroy(path_vbuffer)
		path_vbuffer = null
	}
	
	if (path_select_vbuffer != null)
	{
		vbuffer_destroy(path_select_vbuffer)
		path_select_vbuffer = null
	}
	
	ds_list_clear(path_points_list)
	path_table = []
	path_table_matrix = []
	
	// Get points from childen points
	for (var i = 0; i < ds_list_size(tree_list); i++)
	{
		var tl = tree_list[|i];

		if (tl.type = e_tl_type.PATH_POINT)
		{
			var pos = [tl.value[e_value.POS_X], tl.value[e_value.POS_Y], tl.value[e_value.POS_Z]]
			if (tl.value[e_value.POS_TARGET] != null)
			{
				
					if (tl.value[e_value.COPY_POS_CHILD])
					{
						
						pos[X] = tl.value[e_value.POS_X] + tl.value[e_value.COPY_POS_OFFSET_X]
						pos[Y] = tl.value[e_value.POS_Y] + tl.value[e_value.COPY_POS_OFFSET_Y]
						pos[Z] = tl.value[e_value.POS_Z] + tl.value[e_value.COPY_POS_OFFSET_Z] 
						
						var par = tl.value[e_value.POS_TARGET];
						var mat = array_copy_1d(par.matrix);
						
						//BENT Half
						if (par.type = e_tl_type.BODYPART && tl.value[e_value.COPY_POS_BEND] && par.model_part != null && par.model_part.bend_part != null)
						{
							var bendangle = vec3(par.value_inherit[e_value.BEND_ANGLE_X], par.value_inherit[e_value.BEND_ANGLE_Y], par.value_inherit[e_value.BEND_ANGLE_Z]);
							mat = matrix_multiply(model_part_get_bend_matrix(par.model_part, bendangle, point3D(0, 0, 0), vec3(1), par.id), mat)
						}
						
						mat = matrix_multiply(matrix_create(pos, vec3(0), vec3(1)), mat);
						
						mat = matrix_multiply(mat, matrix_inverse(matrix))
				    	pos = vec3((mat[MAT_X]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_X] +tl.value[e_value.POS_X]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_X])
						,(mat[MAT_Y]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Y] + tl.value[e_value.POS_Y]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Y])
						, (mat[MAT_Z]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Z] + tl.value[e_value.POS_Z]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Z]));
					
					}
					else
					{
						// NOT IS CHILD
						matrix_remove_rotation(matrix)
				        pos = point3D_add(vec3(tl.value[e_value.COPY_POS_OFFSET_X],tl.value[e_value.COPY_POS_OFFSET_Y],tl.value[e_value.COPY_POS_OFFSET_Z]), pos);
				        var target = tl.value[e_value.POS_TARGET];
				        var targmat = array_copy_1d(target.matrix);
				        targmat = matrix_multiply(matrix_create(pos, vec3(0), vec3(1)), targmat);
				        var mat = matrix_multiply(targmat, matrix_inverse(matrix))
					
	                    pos = vec3((mat[MAT_X]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_X] +tl.value[e_value.POS_X]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_X])
						,(mat[MAT_Y]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Y] + tl.value[e_value.POS_Y]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Y])
						, (mat[MAT_Z]) * tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Z] + tl.value[e_value.POS_Z]* (1 - tl.value[e_value.COPY_POS_BLEND] * tl.value[e_value.COPY_POS_Z]));
					}
				
			
			}
			
			ds_list_add(path_points_list, [pos[X], pos[Y], pos[Z], tl.value[e_value.PATH_POINT_ANGLE], tl.value[e_value.PATH_POINT_SCALE], 0, 0, 0, 0, 0, 0])
		}
	}
	
	// Update timelines
	with (obj_timeline)
	{
		if (value[e_value.PATH_OBJ] = other.id)
			update_matrix = true
	}
	
	// Not enough points
	if (ds_list_size(path_points_list) < 2)
	{
		with (app)
			tl_update_matrix(true)
		
		return 0
	}
	
	var detail, splinepoints;
	detail = (ds_list_size(path_points_list) + ((ds_list_size(path_points_list) - 1 + path_closed) * path_detail))
	
	// Subdivide points
	splinepoints = spline_subdivide(ds_list_create_array(path_points_list), path_closed)
	
	// Calculate distance between points
	var points_distance = [];
	var sampleprev, sample;
	path_length = 0
	
	for (var i = 0; i < array_length(splinepoints); i++)
	{
		sampleprev = spline_get_point(i, splinepoints, path_closed, path_smooth, 0)
		points_distance[i] = 0
		
		for (var j = 0; j <= 1; j += 0.05)
		{
			sample = spline_get_point(i + j, splinepoints, path_closed, path_smooth, 0)
			points_distance[i] += point3D_distance(sampleprev, sample)
			sampleprev = sample
		}
		
		points_distance[i] = max(0.001, points_distance[i])
		path_length += points_distance[i]
	}
	
	if (path_length = 0)
	{
		path_table[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		path_table_matrix[0] = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		return 0
	}
	
	// Move along path length and record points
	var t = 0;
	for (var i = 0; i < detail; i++)
	{
		var length = (i/(detail - 1)) * path_length;
		
		var j = 0;
		while (length > points_distance[j] && length > 0.01)
		{
			length -= points_distance[j]
			j++
		}
		
		if (points_distance[j] = 0)
			continue
		
		path_table[t] = spline_get_point(j + (length / points_distance[j]), splinepoints, path_closed, path_smooth, 0)
		path_table_matrix[t] = path_table[t]
		t++
	}
	
	// Generate tangent/normal values in points
	spline_make_frames(path_table, path_closed, path_smooth)
	
	if (path_shape != "none")
		path_vbuffer = vbuffer_create_path(id)
	else
		path_select_vbuffer = vbuffer_create_path(id, true)
	
	if (matrix != 0)
	{
		path_table_matrix = []
		for (var j = 0; j < array_length(path_table); j++)
		{
			var pos = point3D_mul_matrix(path_table[j], matrix);
			
			path_table_matrix[j] = array_copy_1d(path_table[j])
			path_table_matrix[j][X] = pos[X]
			path_table_matrix[j][Y] = pos[Y]
			path_table_matrix[j][Z] = pos[Z]
		}
	}
}