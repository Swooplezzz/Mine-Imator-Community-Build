// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function color_to_hue(color){
	var r,g,b;
	r = color_get_red(color) / 255
	g = color_get_green(color) / 255
	b = color_get_blue(color) / 255
	
	var cmax, cmin
	
	cmax = max(r, g, b)
	cmin = min(r, g, b)
	
	var deltaC = cmax - cmin
	
	var h = 0;
	
	if(cmax == r){
		h = 60 * (((g-b)/deltaC) mod 6)
	}
	else if(cmax == g){
		h = 60 * (((b-r)/deltaC) + 2)
	}
	else if(cmax == b){
		h = 60 * (((r-g)/deltaC) + 4)
	}
	else if(deltaC == 0){
		h=0
	}
	else{
		return h
	}
	
	return h
	
	

}