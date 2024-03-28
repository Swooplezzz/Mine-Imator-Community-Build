/// color_get_sat(color)
/// @arg color

function color_get_sat(color)
{
	var r, g, b;
	r = color_get_red(color)
	g = color_get_green(color)
	b = color_get_blue(color)
	
	var cmax = max(r, max(g,b))
	var cmin = min(r, min(g,b))
	
	var sat = cmin/cmax
	
	return sat
}