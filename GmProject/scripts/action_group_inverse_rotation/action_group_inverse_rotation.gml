/// action_group_inverse_rotation()

function action_group_inverse_rotation()
{
	if (tl_edit.value[e_value.ROT_TARGET] != null)
	{
		var target, unconstrainted_mat, rot, rot2, mat;
		target = tl_edit.value[e_value.ROT_TARGET]
		unconstrainted_mat = matrix_multiply(matrix_create(point3D(tl_edit.value[e_value.POS_X], tl_edit.value[e_value.POS_Y], tl_edit.value[e_value.POS_Z]),point3D(tl_edit.value[e_value.ROT_X], tl_edit.value[e_value.ROT_Y], tl_edit.value[e_value.ROT_Z]), vec3(1)), tl_edit.matrix_parent)
		rot = matrix_rotation(unconstrainted_mat)
		mat = matrix_multiply(target.matrix, matrix_inverse(unconstrainted_mat))
		
		//BENT Half
		if (target.type = e_tl_type.BODYPART && tl_edit.value[e_value.COPY_ROT_BEND] && target.model_part != null && target.model_part.bend_part != null)
		{
			var bendangle = vec3(target.value_inherit[e_value.BEND_ANGLE_X], target.value_inherit[e_value.BEND_ANGLE_Y], target.value_inherit[e_value.BEND_ANGLE_Z]);
			mat = matrix_multiply(model_part_get_bend_matrix(target.model_part, bendangle, point3D(0, 0, 0), vec3(1), target.id), mat)
		}
		

		
		rot2 = matrix_rotation(matrix_inverse(mat))
		for (var i = X; i <= Z; i++)
			tl_value_set(e_value.COPY_ROT_OFFSET_X + i, rot2[i], false)
	}
}