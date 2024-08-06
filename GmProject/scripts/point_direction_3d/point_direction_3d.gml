/// point_direction_3d(pos1, pos2)
/// @param x1
/// @param y1
/// @param z1
/// @param x2
/// @param y2
/// @param z2

function point_direction_3d(pos1, pos2)
{
	var x1 = pos1[X];
	var y1 = pos1[Y];
	var z1 = pos1[Z];
	var x2 = pos2[X];
	var y2 = pos2[Y];
	var z2 = pos2[Z];
	var length_of_xyz = point_distance_3d(x1, y1, z1, x2, y2, z2);
	
	if (length_of_xyz = 0)
		return vec3(0.0)
	
	var normal_z = (z2 - z1) / length_of_xyz;
	var yaw = point_direction(x1, y1, x2, y2)
	var pitch = arcsin(normal_z);
	pitch *= 180 / pi
	
	return vec3(-pitch, 0, yaw + 90)
}