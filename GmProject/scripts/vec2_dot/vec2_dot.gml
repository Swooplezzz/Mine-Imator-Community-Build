/// CppSeparate RealType vec2_dot(VecType, VecType)
/// vec2_dot(vector1, vector2)
/// @arg vector1
/// @arg vector2

function vec2_dot(v1, v2)
{
	gml_pragma("forceinline")
	
	return v1[@ X] * v2[@ X] + v1[@ Y] * v2[@ Y]
}
