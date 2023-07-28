// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function render_high_volumetric_scatter()
{
	var resultsurftemp, specresultsurftemp, sampleoffset, sunout, samplestart, sampleend, lightlist;
	sampleoffset = point3D(0, 0, 0)
	sunout = (background_sunlight_color_final != c_black)
	samplestart = 0
	sampleend = 0
	lightlist = array()
	
	// Get visible lights
	with (obj_timeline)
	{
		// Light source check
		if (type != e_tl_type.POINT_LIGHT && type != e_tl_type.SPOT_LIGHT)
			continue
		
		// Hidden
		if (!value_inherit[e_value.VISIBLE] || hide)
			continue
		
		// Shadowless pointlight
		if (type = e_tl_type.POINT_LIGHT && !shadows)
		{
			ds_list_add(render_shadowless_point_list, id)
			continue
		}
		
		lightlist = array_add(lightlist, id)
	}
}
