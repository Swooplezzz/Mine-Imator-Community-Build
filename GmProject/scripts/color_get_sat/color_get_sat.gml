// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function color_get_sat(color){
	var r,g,b
	
	r = color_get_red(color)
	g = color_get_green(color)
	b = color_get_blue(color)
	
	var max_ = max(r, max(g,b))
	var min_ = min(r, min(g,b))
	
	var sat = min_/max_
	
	return sat
}