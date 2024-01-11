/// tab_frame_editor_constraints()

function tab_frame_editor_constraints()
{
	// Follow path
	tab_frame_editor_path()
	
	// Inverse kinematics
	tab_frame_editor_ik()
	
	// Copy rotation, position, scale
	tab_frame_editor_copy_rot()
	tab_frame_editor_copy_pos()
	tab_frame_editor_copy_scale()
	
	// Bend IK
	tab_frame_editor_bend_ik()
}
