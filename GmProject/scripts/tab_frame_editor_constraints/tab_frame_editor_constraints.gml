/// tab_frame_editor_constraints()

function tab_frame_editor_constraints()
{
	// Follow path
	tab_frame_editor_path()
	
	// Inverse kinematics
	tab_frame_editor_ik()
	
	// Follow rotation, position, scale
	tab_frame_editor_follow_rot()	
	tab_frame_editor_follow_pos()

	tab_frame_editor_follow_scale()
}
