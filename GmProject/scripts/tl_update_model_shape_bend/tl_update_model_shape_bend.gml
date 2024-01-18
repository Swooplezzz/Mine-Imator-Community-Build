/// tl_update_model_shape_bend()
/// @desc Updates the shapes of the model part if the bending was changed since the last call.

function tl_update_model_shape_bend()
{
	var bend = vec3(value_inherit[e_value.BEND_ANGLE_X],
					value_inherit[e_value.BEND_ANGLE_Y],
					value_inherit[e_value.BEND_ANGLE_Z]);

			
	if (value[e_value.BEND_IK_TARGET] != null)
	{
		var mat = matrix_parent;
		
		// Target rotation matrix
		var target_rot_mat =  array_copy_1d(value[e_value.BEND_IK_TARGET].matrix)
		
		// Remove global position
		target_rot_mat[MAT_X] = 0;
		target_rot_mat[MAT_Y] = 0;
		target_rot_mat[MAT_Z] = 0;
		
		// Remove scale
		matrix_remove_scale(target_rot_mat)
		
		// Invert matrix_parent (Used for resetting the bend rotation)
		var mat_inv = matrix_inverse(mat) 
		
		// Multiply the target rotation with the inverse transform matrix
		var rot_target = matrix_rotation(matrix_multiply(target_rot_mat,mat_inv)) 
		
		// Set the bend to the final value
		bend = rot_target; 
		bend[X] *= (model_part.bend_invert[X] ? -1: 1)
		bend[Y] *= (model_part.bend_invert[Y] ? -1: 1)
		bend[Z] *= (model_part.bend_invert[Z] ? -1: 1)
		
	    value_inherit[e_value.BEND_ANGLE_X] = bend[X]
		value_inherit[e_value.BEND_ANGLE_Y] = bend[Y]
		value_inherit[e_value.BEND_ANGLE_Z] = bend[Z]
    }
	
	// No change
	if (vec3_equals(bend_rot_last, bend) && bend_model_part_last = model_part)
		return 0

	// Invalid part, no bending or no shapes
	if (model_part = null || model_part.bend_part = null || model_part.shape_list = null)
		return 0
	
	// Clear old vbuffers
	if (model_shape_vbuffer_map != null && ds_map_size(model_shape_vbuffer_map) > 0)
	{
		var key = ds_map_find_first(model_shape_vbuffer_map);
		while (!is_undefined(key))
		{
			if (instance_exists(key) && key.vbuffer_default != model_shape_vbuffer_map[?key]) // Don't clear default buffers
				vbuffer_destroy(model_shape_vbuffer_map[?key])
			
			key = ds_map_find_next(model_shape_vbuffer_map, key)
		}
		ds_map_clear(model_shape_vbuffer_map)
	}
	
	// Create map if unavailable
	if (model_shape_vbuffer_map = null)
		model_shape_vbuffer_map = ds_map_create()
	
	bend_rot_last = bend
	bend_model_part_last = model_part
	
	model_part_fill_shape_vbuffer_map(model_part, model_shape_vbuffer_map, model_shape_alpha_map, bend_rot_last)
}
