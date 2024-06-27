// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function action_group_inverse_rotation(){
	if(tl_edit.value[e_value.ROT_TARGET] != null){
	var target = tl_edit.value[e_value.ROT_TARGET];
	
	var unconstrainted_mat = matrix_multiply(matrix_create(point3D(tl_edit.value[e_value.POS_X], tl_edit.value[e_value.POS_Y], tl_edit.value[e_value.POS_Z]),point3D(tl_edit.value[e_value.ROT_X], tl_edit.value[e_value.ROT_Y], tl_edit.value[e_value.ROT_Z]), vec3(1)), tl_edit.matrix_parent);
	
	var rot = matrix_rotation(unconstrainted_mat)

	var mat = matrix_inverse(unconstrainted_mat);
	
	if (target.type = e_tl_type.BODYPART && tl_edit.value[e_value.COPY_ROT_BEND] && target.model_part != null && target.model_part.bend_part != null)
	{
	var bendangle = vec3(target.value_inherit[e_value.BEND_ANGLE_X], target.value_inherit[e_value.BEND_ANGLE_Y], target.value_inherit[e_value.BEND_ANGLE_Z]);
	mat = matrix_multiply(model_part_get_bend_matrix(target.model_part, bendangle, point3D(0, 0, 0), vec3(1), target.id), mat)
	}
	
    mat = matrix_multiply(target.matrix, mat);
	
	var rot2 = matrix_rotation(matrix_inverse(mat))
	
	tl_value_set_start(action_group_inverse_rotation, true)
	for (i = X; i <= Z; i++)
	tl_value_set(e_value.COPY_ROT_OFFSET_X + i, rot2[i] - rot[i], false)
	tl_value_set_done()
	}
}