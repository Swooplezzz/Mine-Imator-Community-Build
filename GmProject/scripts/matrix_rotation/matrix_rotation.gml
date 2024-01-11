/// matrix_rotation(mat)
/// @arg mat

function matrix_rotation(m)
{
    var rot;
    var t1, c2, t2, s1, c1, t3;
    
    t1 = arctan2(m[MAT_21], m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
    rot = vec3_mul([t2, t1, t3], 180 / pi)
    
    // Doing the operations again on another matrix gives correct results, *could* be optimized to avoid this.
    m = matrix_create(vec3(0), rot, vec3(1))
    
    t1 = arctan2(m[MAT_21], m[MAT_22])
    c2 = sqrt(m[MAT_00] * m[MAT_00] + m[MAT_10] * m[MAT_10])
    t2 = arctan2(-m[MAT_20], c2)
    s1 = sin(t1)
    c1 = cos(t1)
    t3 = arctan2(s1*m[MAT_02] - c1*m[MAT_01], c1*m[MAT_11] - s1*m[MAT_12])
    rot = vec3_mul([t2, t1, t3], 180 / pi)
    
    return rot
}