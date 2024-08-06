/// action_tl_frame_copy_pos_target(target)
/// @arg target

function action_tl_frame_copy_pos_target(target)
{
	tl_value_set_start(action_tl_frame_copy_pos_target, true)
	tl_value_set(e_value.POS_TARGET, target, false)
	
	//Equivalent to setting the inverse in blender
	if (target != null)
	{
		var is_new_target = (target = tl_edit.value[e_value.POS_TARGET] && tl_edit.value[e_value.POS_TARGET] != null);
		var unconstrainted_mat = matrix_multiply(matrix_create(point3D(tl_edit.value[e_value.POS_X], tl_edit.value[e_value.POS_Y], tl_edit.value[e_value.POS_Z]), vec3(0), vec3(1)), tl_edit.matrix_parent)
		
		if (is_new_target)
			unconstrainted_mat = tl_edit.matrix;	
		
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
	}
	
	tl_value_set_done()
}