function to_euler(q)
{
	var QX=q[X], QY=q[Y], QZ=q[Z], QW=q[W];

	var t0 = (QX+QZ)*(QX-QZ);        // QX^2-QZ^2
	var t1 = (QW+QY)*(QW-QY);        // QW^2-QY^2
	var QXQX = 0.5*(t0+t1);        // 1/2 QX of QX'
	var QXQY = QX*QY+QW*QZ;            // 1/2 QY of QX'
	var QXQZ = QW*QY-QX*QZ;            // 1/2 QZ of QX'
	var t  = QXQX*QXQX+QXQY*QXQY;        // cos(theta)^2
	var QYQZ = 2.0*(QY*QZ+QW*QX);      // QZ of QY'
	
	var v;
	v[Z] = arctan2(QXQY, QXQX);    // QYaQW   (psi)
	v[Y] = arctan(QXQZ/sqrt(t)); // pitch (theta)

	if (t != 0) 
		v[X] = arctan2(QYQZ, t1-t0);
	else
		v[X] = (2.0*arctan2(QX,QW) - sign(QXQZ)*v[Z]);
	
	var rot = vec3_mul(v, 180/pi);

	return NormalizeAngles(rot);
}

function NormalizeAngles(angles)
{
    angles[X] = NormalizeAngle(angles[X]);
    angles[Y] = NormalizeAngle(angles[Y]);
    angles[Z] = NormalizeAngle(angles[Z]);
    return angles;
}
	
function NormalizeAngle(angle)
{
	var modAngle = angle mod 360.0;
		
	if (modAngle < 0.0)
		return modAngle + 360.0;
	else
		return modAngle;
}

/// quat_euler(euler)
/// @arg euler

function quat_euler(euler)
{
	/// euler_to_quaternion(euler_x, euler_y, euler_z)
	/// @desc Converts Euler angles in degrees to a quaternion
	//	var q, c1, c2, c3, s1, s2, s3;

	//	var ex = euler[@ X];
	//	var ey = euler[@ Y];
	//	var ez = euler[@ Z];
	
	//	var t0 = dcos(ez * 0.5);
	//	var t1 = dsin(ez * 0.5);
	//	var t2 = dcos(ex * 0.5);
	//	var t3 = dsin(ex * 0.5);
	//	var t4 = dcos(ey * 0.5);
	//	var t5 = dsin(ey * 0.5);
	
	//	var qw = t0 * t2 * t4 + t1 * t3 * t5;
	//	var qx = t0 * t3 * t4 - t1 * t2 * t5;
	//	var qy = t0 * t2 * t5 + t1 * t3 * t4;
	//	var qz = t1 * t2 * t4 - t0 * t3 * t5;
		
	//	return vec4(qx, qy, qz, qw);
	    //    var yaw = -euler[X];
        //var pitch = -euler[Y];
        //var roll = euler[Z];
        //var rollOver2 = roll * 0.5;
        //var sinRollOver2 = dsin(rollOver2);
        //var cosRollOver2 = dcos(rollOver2);
        //var pitchOver2 = pitch * 0.5;
        //var sinPitchOver2 = dsin(pitchOver2);
        //var cosPitchOver2 = dcos(pitchOver2);
        //var yawOver2 = yaw * 0.5;
        //var sinYawOver2 = dsin(yawOver2);
        //var cosYawOver2 = dcos(yawOver2);
        //var result;
        //result[X] = cosYawOver2 * cosPitchOver2 * cosRollOver2 + sinYawOver2 * sinPitchOver2 * sinRollOver2;
        //result[Y] = cosYawOver2 * cosPitchOver2 * sinRollOver2 - sinYawOver2 * sinPitchOver2 * cosRollOver2;
        //result[Z] = cosYawOver2 * sinPitchOver2 * cosRollOver2 + sinYawOver2 * cosPitchOver2 * sinRollOver2;
        //result[W] = sinYawOver2 * cosPitchOver2 * cosRollOver2 - cosYawOver2 * sinPitchOver2 * sinRollOver2;
        //return result;

	var q, c1, c2, c3, s1, s2, s3;
	q = vec4(0.0);
	
	q[X] = dsin(euler[X]/2) * dcos(euler[Y]/2) * dcos(euler[Z]/2) - dcos(euler[X]/2) * dsin(euler[Y]/2) * dsin(euler[Z]/2)
	q[Y] = dcos(euler[X]/2) * dsin(euler[Y]/2) * dcos(euler[Z]/2) + dsin(euler[X]/2) * dcos(euler[Y]/2) * dsin(euler[Z]/2)
	q[Z] = dcos(euler[X]/2) * dcos(euler[Y]/2) * dsin(euler[Z]/2) - dsin(euler[X]/2) * dsin(euler[Y]/2) * dcos(euler[Z]/2)
	q[W] = dcos(euler[X]/2) * dcos(euler[Y]/2) * dcos(euler[Z]/2) + dsin(euler[X]/2) * dsin(euler[Y]/2) * dsin(euler[Z]/2)
	
	return q;
}

function QuatInvert(_quat)
{
    return vec4_mul([-_quat[0], -_quat[1], -_quat[2], _quat[3]], 1/(_quat[0]*_quat[0]+_quat[1]*_quat[1]+_quat[2]*_quat[2]+_quat[3]*_quat[3]));
}

function quat_mul(_a, _b)
{
    var _ax = _a[0];
    var _ay = _a[1];
    var _az = _a[2];
    var _aw = _a[3];
    
    var _bx = _b[0];
    var _by = _b[1];
    var _bz = _b[2];
    var _bw = _b[3];
    
    return [    _aw * _bx + _ax * _bw + _ay * _bz - _az * _by,
                _aw * _by + _ay * _bw + _az * _bx - _ax * _bz,
                _aw * _bz + _az * _bw + _ax * _by - _ay * _bx,
                _aw * _bw - _ax * _bx - _ay * _by - _az * _bz];
}