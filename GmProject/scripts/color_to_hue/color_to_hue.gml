/// color_to_hue(color)
/// @arg color

function color_to_hue(color)
{
	var r, g, b;
	r = color_get_red(color) / 255
	g = color_get_green(color) / 255
	b = color_get_blue(color) / 255
	
	var cmax, cmin
	
	cmax = max(r, g, b)
	cmin = min(r, g, b)
	
	var deltaC = cmax - cmin
	
	if (deltaC == 0)
		return 0
	else if (cmax == r)
		return 60 * (((g-b)/deltaC) mod 6)
	else if (cmax == g)
		return 60 * (((b-r)/deltaC) + 2)
	else if (cmax == b)
		return 60 * (((r-g)/deltaC) + 4)
	
	return 0
}