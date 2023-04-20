/// CppSeparate BoolType vec3_equals(VecType, VecType)
/// vec3_equals(vec1, vec2)
/// @arg vec1
/// @arg vec2

function vec3_equals(v1, v2)
{
	gml_pragma("forceinline")
	
	return (v1[@ X] = v2[@ X] && v1[@ Y]= v2[@ Y] && v1[@ Z] = v2[@ Z])
}
