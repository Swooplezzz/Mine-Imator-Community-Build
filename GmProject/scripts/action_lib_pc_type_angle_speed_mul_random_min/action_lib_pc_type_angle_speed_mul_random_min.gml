/// action_lib_pc_type_angle_speed_mul_random_min(value, add)
/// @arg value
/// @arg add
function action_lib_pc_type_angle_speed_mul_random_min(val, add)
{
	if (!history_undo && !history_redo)
		history_set_var(action_lib_pc_type_angle_speed_mul_random_min, ptype_edit.angle_speed_mul_random_min, ptype_edit.angle_speed_mul_random_min * add + val, true)
	
	ptype_edit.angle_speed_mul_random_min = ptype_edit.angle_speed_mul_random_min * add + val
}
