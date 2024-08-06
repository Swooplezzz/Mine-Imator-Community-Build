/// action_group_inverse_position()

function action_group_inverse_position()
{
	if (tl_edit.value[e_value.POS_TARGET] != null)
	{
		var target = tl_edit.value[e_value.POS_TARGET];
		
		var unconstrainted_mat = matrix_multiply(matrix_create(point3D(tl_edit.value[e_value.POS_X], tl_edit.value[e_value.POS_Y], tl_edit.value[e_value.POS_Z]), vec3(0), vec3(1)), tl_edit.matrix_parent)
		
		var world_pos = vec3(0)
		for (var i = X; i <= Z; i++)
			world_pos[i] = unconstrainted_mat[MAT_X + i]
		
		var mat = target.matrix
		
		//BENT Half
		if (target.type = e_tl_type.BODYPART && tl_edit.value[e_value.COPY_POS_BEND] && target.model_part != null && target.model_part.bend_part != null)
		{
			var bendangle = vec3(target.value_inherit[e_value.BEND_ANGLE_X], target.value_inherit[e_value.BEND_ANGLE_Y], target.value_inherit[e_value.BEND_ANGLE_Z]);
			mat = matrix_multiply(model_part_get_bend_matrix(target.model_part, bendangle, point3D(0, 0, 0), vec3(1), target.id), mat)
		}
		
		var pos = matrix_multiply(matrix_create(world_pos, vec3(0), vec3(1)), matrix_inverse(mat))
		for (i = X; i <= Z; i++)
			tl_value_set(e_value.COPY_POS_OFFSET_X + i, pos[MAT_X + i] - tl_edit.value[e_value.POS_X + i], false)
		
		tl_value_set_done()
	}
}
