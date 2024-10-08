/// CppSeparate VecType point3D_mul(VecType, VarType)
/// point3D_mul(point, multiplier)
/// @arg point
/// @arg multiplier

function point3D_mul(pnt, mul)
{
	gml_pragma("forceinline")
	
	if (is_array(mul))
		return [pnt[@ X] * mul[@ X], pnt[@ Y] * mul[@ Y], pnt[@ Z] * mul[@ Z]]
	else
		return [pnt[@ X] * mul, pnt[@ Y] * mul, pnt[@ Z] * mul]
}
