/// CppSeparate VecType vec2_normalize(VecType)
/// vec2_normalize(vector)
/// @arg vector

function vec2_normalize(vec)
{
	gml_pragma("forceinline")
	
	return vec2_div(vec, vec2_length(vec))
}
