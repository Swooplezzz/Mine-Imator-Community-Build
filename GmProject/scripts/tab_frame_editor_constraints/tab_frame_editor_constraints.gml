/// tab_frame_editor_constraints()

function tab_frame_editor_constraints()
{
	// Follow path
	tab_frame_editor_path()
	
	// Inverse kinematics
	tab_frame_editor_ik()
	tab_frame_editor_bend_ik()
	//var taby;
	
	// Look at
	tab_frame_editor_look_at()
	
	// Copy rotation, position, scale
	tab_frame_editor_copy_pos()
	tab_frame_editor_copy_rot()
	tab_frame_editor_copy_scale()
}
