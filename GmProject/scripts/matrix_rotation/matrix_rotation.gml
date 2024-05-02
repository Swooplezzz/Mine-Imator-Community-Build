/// matrix_rotation(mat)
/// @arg mat

function matrix_rotation(m)
{
	var ogm = array_copy_1d(m);
    var rot1, rot2;
    var t1, c2, t2, s1, c1, t3;
    
    t1 = arctan2(m[MAT_21], m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
    rot1 = vec3_mul([t2, t1, t3], 180 / pi)
    
    // Doing the operations again on another matrix gives correct results, *could* be optimized to avoid this.
    m = matrix_create(vec3(0), rot1, vec3(1))
    
    t1 = arctan2(m[MAT_21], m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
	
    rot1 = vec3_mul([t2, t1, t3], 180 / pi)
	
	m = ogm; 
	
    t1 = arctan2(-m[MAT_21], -m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], -c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
    rot2 = vec3_mul([t2, t1, t3], 180 / pi)
    
    
    // Doing the operations again on another matrix gives correct results, *could* be optimized to avoid this.
    m = matrix_create(vec3(0), rot2, vec3(1))
    
    t1 = arctan2(-m[MAT_21], -m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], -c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
    rot2 = vec3_mul([t2, t1, t3], 180 / pi)
	
	//compare direction vectors ??
	//if (m[MAT_01] < 1)
	//{
	//	if (m[MAT_01] > -1)
	//	{
	//		rot[Z] = arcsin(-m[MAT_01])* 180/pi;
	//		rot[X] = arctan2(m[MAT_21], m[MAT_11])* 180/pi;
	//		rot[Y] = arctan2(m[MAT_02], m[MAT_00])* 180/pi;
	//	}
	//	else
	//	{
	//		rot[Z] = pi/2* 180/pi;
	//		rot[X] = -arctan2(-m[MAT_20], m[MAT_22])* 180/pi;
	//		rot[Y] = 0;
	//	}
	//}
	//else
	//{
	//	rot[Z] = -pi/2 * 180/pi;
	//	rot[X] = arctan2(-m[MAT_20], m[MAT_22])* 180/pi;
	//	rot[Y] = 0;
	//}
	
	// returns two euler calculation methods, so we can pick the best
	//var mat = m;
	
	// BLI_ASSERT_UNIT_M3(mat);

	//if (R->parity)
	//{
	//  negate_v3(eul1);
	//  negate_v3(eul2);
	//}
	
	if (abs(rot2[X]) + abs(rot2[Y]) + abs(rot2[Z]) < abs(rot1[X]) + abs(rot1[Y]) + abs(rot1[Z]))
		return rot2
	
    return rot1
}

