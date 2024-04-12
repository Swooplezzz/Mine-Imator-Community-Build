/// draw_image_accent(sprite, subimage, x, y, [xscale, yscale, [color, alpha, [rotation]]])
/// @arg sprite
/// @arg subimage
/// @arg x
/// @arg y
/// @arg [xscale
/// @arg yscale
/// @arg [color
/// @arg alpha
/// @arg [rotation]]]

function draw_image_accent(sprite, subimage, xx, yy, xscale = 1, yscale = 1, color = c_white, alpha = 1, rotation = 0)
{
	var accent, hueshift, satshift;
	accent = 0
	hueshift = 0
	satshift = 0
	
	if (setting_accent = 9)
		accent = setting_accent_custom
	else
		accent = setting_theme.accent_list[app.setting_accent]
	
	if (accent != c_white && accent != c_black) // radians: pi - half a hue circle, 2 * pi - full circle
	{
		hueshift = (2 * pi) - degtorad(color_to_hue(accent))
		satshift = 1 - color_get_sat(accent)
	}
	
	shader_set(shader_hue_yiq)
	shader_submit_float(shader_get_uniform(shader_hue_yiq, "hueShift"), hueshift)
	shader_submit_float(shader_get_uniform(shader_hue_yiq, "satShift"), satshift)
	
	draw_image(sprite, subimage, xx, yy, xscale, yscale, color, alpha, rotation)
	
	shader_clear()
}