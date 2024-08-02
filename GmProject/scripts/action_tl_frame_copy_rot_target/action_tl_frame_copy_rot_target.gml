/// action_tl_frame_copy_rot_target(target)
/// @arg target

function action_tl_frame_copy_rot_target(target)
{
	tl_value_set_start(action_tl_frame_copy_rot_target, true)
	tl_value_set(e_value.ROT_TARGET, target, false)
	
	if (target != null)
	{
		var is_new_target = (target = tl_edit.value[e_value.ROT_TARGET] && tl_edit.value[e_value.ROT_TARGET] != null);
		var unconstrainted_mat, rot, rot2, mat;
		unconstrainted_mat = matrix_multiply(matrix_create(point3D(tl_edit.value[e_value.POS_X], tl_edit.value[e_value.POS_Y], tl_edit.value[e_value.POS_Z]), point3D(tl_edit.value[e_value.ROT_X], tl_edit.value[e_value.ROT_Y], tl_edit.value[e_value.ROT_Z]), vec3(1)), tl_edit.matrix_parent)
		
		if (is_new_target)
			unconstrainted_mat = tl_edit.matrix;	
		
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
	
	tl_value_set_done()
}