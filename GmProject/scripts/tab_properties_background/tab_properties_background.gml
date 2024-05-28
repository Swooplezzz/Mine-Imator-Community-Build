/// tab_properties_background()

function tab_properties_background()
{
	var capwid;
	
	// Time/rotation
	if (window_compact || panel_compact)
	{
		tab_control_dragger()
		draw_dragger_sky("backgroundskytime", dx, dy, background_sky_time, -45, action_background_sky_time, tab.background.tbx_sky_time, true)
		tab_next()
		
		tab_control_dragger()
		draw_dragger_sky("backgroundskyrotation", dx, dy, background_sky_rotation, 0, action_background_sky_rotation, tab.background.tbx_sky_rotation, false)
		tab_next()
	}
	else
	{
		tab_control(120)
		draw_wheel_sky("backgroundskytime", dx + floor(dw * 0.25), dy + 60, background_sky_time, -45, action_background_sky_time, tab.background.tbx_sky_time, true)
		draw_wheel_sky("backgroundskyrotation", dx + floor(dw * 0.75), dy + 60, background_sky_rotation, 0, action_background_sky_rotation, tab.background.tbx_sky_rotation, false)
		tab_next()
	}
	
	// Sunlight
	tab_control_switch()
	draw_button_collapse("sunlight", collapse_map[?"sunlight"], null, true, "backgroundsunlight")
	tab_next()
	
	if (collapse_map[?"sunlight"])
	{
		tab_collapse_start()
		
		// Sunlight angle
		tab_control_dragger()
		draw_dragger("backgroundsunlightangle", dx, dy, dragger_width, background_sunlight_angle, .05, 0, no_limit, .526, .001, tab.background.tbx_sunlight_angle, action_background_sunlight_angle, null, true, false, "backgroundsunlightangletip")
		tab_next()
		
		// Sunlight strength
		tab_control_dragger()
		draw_dragger("backgroundsunlightstrength", dx, dy, dragger_width, round(background_sunlight_strength * 100), 0.1, 0, no_limit, 100, 1, tab.background.tbx_sunlight_strength, action_background_sunlight_strength)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Sky properties
	tab_control_switch()
	draw_button_collapse("sky", collapse_map[?"sky"], null, true, "backgroundskybackground")
	tab_next()
	
	if (collapse_map[?"sky"])
	{
		tab_collapse_start()
		
		// Toggle image
		tab_control_togglebutton()
		togglebutton_add("backgroundskyminecraft", null, 0, background_image_show = 0, action_background_image_show)
		togglebutton_add("backgroundskycustom", null, 1, background_image_show = 1, action_background_image_show)
		draw_togglebutton("backgroundsky", dx, dy)
		tab_next()
		
		if (background_image_show)
		{
			var text, tex;
			
			capwid = text_caption_width("backgroundimage", "backgroundimagetype")
			
			// Background image
			text = text_get("listnone")
			tex = null
			if (background_image != null)
			{
				text = background_image.display_name
				tex = background_image.texture
			}
			
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundimage", e_menu.LIST, dx, dy, dw, ui_large_height, background_image, text, action_background_image, false, tex)
			tab_next()
			
			if (background_image != null)
			{
				// Image type
				tab_control_menu()
				draw_button_menu("backgroundimagetype", e_menu.LIST, dx, dy, dw, 24, background_image_type, text_get("backgroundimagetype" + background_image_type), action_background_image_type)
				tab_next()
				
				// Background stretch
				if (background_image_type = "image")
				{
					tab_control_switch()
					draw_switch("backgroundimagestretch", dx, dy, background_image_stretch, action_background_image_stretch)
					tab_next()
				}
				
				// Rotation
				if (background_image_type != "image")
				{
					tab_control_dragger()
					draw_dragger("backgroundimagerotation", dx, dy, dragger_width, background_image_rotation, .1, -no_limit, no_limit, 0, 1, tab.background.tbx_background_rotation, action_background_image_rotation)
					tab_next()
				}
				
				// Background box mapped
				if (background_image_type = "box") 
				{
					tab_control_switch()
					draw_switch("backgroundimageboxmapped", dx, dy, background_image_box_mapped, action_background_image_box_mapped)
					tab_next()
					
					if (background_image_box_mapped)
					{
						tab_control_button_label()
						
						if (draw_button_label("backgroundimagesavemap", dx, dy, dw, icons.TEXTURE_EXPORT, e_button.SECONDARY))
							action_background_image_save_map()
						
						tab_next()
					}
				}
			}
		}
		else
		{
			var tex;
			capwid = text_caption_width("backgroundskysuntex", "backgroundskymoontex", "backgroundskymoonphase")
			
			// Sun
			tex = ((background_sky_sun_tex.type = e_res_type.PACK) ? background_sky_sun_tex.sun_texture : background_sky_sun_tex.texture)
			
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundskysuntex", e_menu.LIST, dx, dy, dw, ui_large_height, background_sky_sun_tex, background_sky_sun_tex.display_name, action_background_sky_sun_tex, false, tex)
			tab_next()
			
			// Sun angle
			tab_control_dragger()
			draw_dragger("backgroundskysunangle", dx, dy, dragger_width, background_sky_sun_angle, 0.1, -no_limit, no_limit, 0, 1, tab.background.tbx_sky_sun_angle, action_background_sky_sun_angle)
			tab_next()
			
			// Sun scale
			tab_control_dragger()
			draw_dragger("backgroundskysunscale", dx, dy, dragger_width, round(background_sky_sun_scale * 100), 0.1, 0, 10000, 100, 1, tab.background.tbx_sky_sun_scale, action_background_sky_sun_scale)
			tab_next()
			
			// Moon
			if (background_sky_moon_tex.type = e_res_type.PACK && background_sky_moon_tex.ready)
				tex = background_sky_moon_tex.moon_texture[background_sky_moon_phase]
			else
				tex = background_sky_moon_tex.texture
			
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundskymoontex", e_menu.LIST, dx, dy, dw, ui_large_height, background_sky_moon_tex, background_sky_moon_tex.display_name, action_background_sky_moon_tex, false, tex)
			tab_next()
			
			// Moon phase
			if (background_sky_moon_tex.type = e_res_type.PACK && background_sky_moon_tex.ready)
			{
				tab_control_menu(ui_large_height)
				draw_button_menu("backgroundskymoonphase", e_menu.LIST, dx, dy, dw, ui_large_height, background_sky_moon_phase, text_get("backgroundskymoonphase" + string(background_sky_moon_phase + 1)), action_background_sky_moon_phase, false, background_sky_moon_tex.moon_texture[background_sky_moon_phase])
				tab_next()
			}
			
			// Moon angle
			tab_control_dragger()
			draw_dragger("backgroundskymoonangle", dx, dy, dragger_width, background_sky_moon_angle, 0.1, -no_limit, no_limit, 0, 1, tab.background.tbx_sky_moon_angle, action_background_sky_moon_angle)
			tab_next()
			
			// Moon scale
			tab_control_dragger()
			draw_dragger("backgroundskymoonscale", dx, dy, dragger_width, round(background_sky_moon_scale * 100), 0.1, 0, 10000, 100, 1, tab.background.tbx_sky_moon_scale, action_background_sky_moon_scale)
			tab_next()
		}
		
		tab_collapse_end()
	}
	
	// Clouds
	tab_control_switch()
	draw_button_collapse("clouds", collapse_map[?"clouds"], action_background_sky_clouds_show, background_sky_clouds_show, "backgroundskycloudsshow")
	tab_next()
	
	if (background_sky_clouds_show && collapse_map[?"clouds"])
	{
		tab_collapse_start()
		
		// Clouds mode
		tab_control_togglebutton()
		togglebutton_add("backgroundskycloudsnormal", null, "normal", background_sky_clouds_mode = "normal", action_background_sky_clouds_mode)
		togglebutton_add("backgroundskycloudsfaded", null, "faded", background_sky_clouds_mode = "faded", action_background_sky_clouds_mode)
		togglebutton_add("backgroundskycloudsflat", null, "flat", background_sky_clouds_mode = "flat", action_background_sky_clouds_mode)
		draw_togglebutton("backgroundskycloudsmode", dx, dy, true, true)
		tab_next()
		
		// Advanced mode only
		if (setting_advanced_mode)
		{
			// Cloud texture
			var tex = ((background_sky_clouds_tex.type = e_res_type.PACK) ? background_sky_clouds_tex.clouds_texture : background_sky_clouds_tex.texture);
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundskycloudstex", e_menu.LIST, dx, dy, dw, ui_large_height, background_sky_clouds_tex, background_sky_clouds_tex.display_name, action_background_sky_clouds_tex, false, tex)
			tab_next()
			
			// Cloud speed
			tab_control_dragger()
			draw_dragger("backgroundskycloudsspeed", dx, dy, dragger_width, round(background_sky_clouds_speed * 100), 0.1, -no_limit, no_limit, 100, 0, tab.background.tbx_sky_clouds_speed, action_background_sky_clouds_speed)
			tab_next()
			
			// Cloud offset
			tab_control_dragger()
			draw_dragger("backgroundskycloudsoffset", dx, dy, dragger_width, background_sky_clouds_offset, 10, -no_limit, no_limit, 0, 1, tab.background.tbx_sky_clouds_offset, action_background_sky_clouds_offset)
			tab_next()
			
			// Cloud height
			tab_control_dragger()
			draw_dragger("backgroundskycloudsheight", dx, dy, dragger_width, background_sky_clouds_height, 10, -no_limit, no_limit, 1024, 0, tab.background.tbx_sky_clouds_height, action_background_sky_clouds_height)
			tab_next()
			
			// Cloud size
			tab_control_dragger()
			draw_dragger("backgroundskycloudssize", dx, dy, dragger_width, background_sky_clouds_size, 5, 16, no_limit, 1536, 0, tab.background.tbx_sky_clouds_size, action_background_sky_clouds_size)
			tab_next()
			
			// Cloud thickness
			tab_control_dragger()
			draw_dragger("backgroundskycloudsthickness", dx, dy, dragger_width, background_sky_clouds_thickness, 2, 0, no_limit, 64, 0, tab.background.tbx_sky_clouds_thickness, action_background_sky_clouds_thickness)
			tab_next()
		}
		
		tab_collapse_end()
	}
	
	// Ground
	tab_control_switch()
	draw_button_collapse("ground", collapse_map[?"ground"], action_background_ground_show, background_ground_show, "backgroundgroundshow")
	tab_next()
	
	capwid = text_caption_width("backgroundground", "backgroundgroundtex")
	
	if (background_ground_show && collapse_map[?"ground"])
	{
		tab_collapse_start()
		
		var wid, res;
		res = background_ground_tex
		if (!res_is_ready(res))
			res = mc_res
		
		// Change ground
		tab_control(24)
		
		draw_set_font(font_label)
		wid = string_width(text_get("backgroundground") + ":")
		
		draw_label(text_get("backgroundground") + ":", dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary)
		
		draw_box(dx + wid + 16, dy + 4, 20, 20, false, c_level_bottom, 1)
		
		if (background_ground_ani)
			draw_texture_slot(res.block_sheet_ani_texture[block_texture_get_frame(true)], background_ground_slot - ds_list_size(mc_assets.block_texture_list), dx + wid + 18, dy + 6, 16, 16, block_sheet_ani_width, block_sheet_ani_height, block_texture_get_blend(background_ground_name, res))
		else
			draw_texture_slot(res.block_sheet_texture, background_ground_slot, dx + wid + 18, dy + 6, 16, 16, block_sheet_width, block_sheet_height, block_texture_get_blend(background_ground_name, res))
		
		if (draw_button_icon("backgroundgroundchange", dx + dw - 24, dy, 24, 24, ground_editor.show, icons.PENCIL, null, false, "tooltipchangeground"))
			tab_toggle(ground_editor)
		
		tab_next()
		
		// Ground direction
		tab_control_meter()
		draw_meter("backgroundgrounddirection", dx, dy, dw, background_ground_direction, 0, 270, 0, 90, tab.background.tbx_ground_direction, action_background_ground_direction)
		tab_next()
		
		// Ground texture
		tab_control_menu(ui_large_height)
		draw_button_menu("backgroundgroundtex", e_menu.LIST, dx, dy, dw, ui_large_height, background_ground_tex, background_ground_tex.display_name, action_background_ground_tex, false, background_ground_tex.block_preview_texture)
		tab_next()
		
		if (project_render_material_maps)
		{
			// Ground texture (material)
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundgroundtexmaterial", e_menu.LIST, dx, dy, dw, ui_large_height, background_ground_tex_material, background_ground_tex_material.display_name, action_background_ground_tex_material, false, background_ground_tex_material.block_preview_texture)
			tab_next()
			
			// Ground texture (normal)
			tab_control_menu(ui_large_height)
			draw_button_menu("backgroundgroundtexnormal", e_menu.LIST, dx, dy, dw, ui_large_height, background_ground_tex_normal, background_ground_tex_normal.display_name, action_background_ground_tex_normal, false, background_ground_tex_normal.block_preview_texture)
			tab_next()
		}
		
		tab_collapse_end()
	}
	
	// Biome
	tab_control_menu()
	draw_button_menu("backgroundbiome", e_menu.BIOME, dx, dy, dw, 24, background_biome, minecraft_asset_get_name("biome", background_biome), action_background_biome)
	tab_next()
	
	// Biome colors
	if (background_biome = "custom")
	{
		dy += 20 
		draw_label(text_get("backgroundbiomecolors") + ":", dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label) 
		dy += 8
		
		tab_set_collumns(true, floor(content_width/150))
		
		// Grass
		tab_control_color()
		draw_button_color("backgroundgrasscolor", dx, dy, dw, background_grass_color, c_plains_biome_grass, false, action_background_grass_color)
		tab_next()
		
		// Foliage
		tab_control_color()
		draw_button_color("backgroundfoliagecolor", dx, dy, dw, background_foliage_color, c_plains_biome_foliage, false, action_background_foliage_color)
		tab_next()
		
		// Water
		tab_control_color()
		draw_button_color("backgroundwatercolor", dx, dy, dw, background_water_color, c_plains_biome_water, false, action_background_water_color)
		tab_next()
		
		tab_set_collumns(false)
		
		dy += 20 
		draw_label(text_get("backgroundleafcolors") + ":", dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label) 
		dy += 8
		
		tab_set_collumns(true, floor(content_width/150))
		
		// Oak leaves
		tab_control_color()
		draw_button_color("backgroundleavesoakcolor", dx, dy, dw, background_leaves_oak_color, c_plains_biome_foliage, false, action_background_leaves_oak_color)
		tab_next()
		
		// Spruce leaves
		tab_control_color()
		draw_button_color("backgroundleavessprucecolor", dx, dy, dw, background_leaves_spruce_color, c_plains_biome_foliage_2, false, action_background_leaves_spruce_color)
		tab_next()
		
		// Birch
		tab_control_color()
		draw_button_color("backgroundleavesbirchcolor", dx, dy, dw, background_leaves_birch_color, c_plains_biome_foliage_2, false, action_background_leaves_birch_color)
		tab_next()
		
		// Jungle
		tab_control_color()
		draw_button_color("backgroundleavesjunglecolor", dx, dy, dw, background_leaves_jungle_color, c_plains_biome_foliage, false, action_background_leaves_jungle_color)
		tab_next()
		
		// Acacia
		tab_control_color()
		draw_button_color("backgroundleavesacaciacolor", dx, dy, dw, background_leaves_acacia_color, c_plains_biome_foliage, false, action_background_leaves_acacia_color)
		tab_next()
		
		// Dark oak
		tab_control_color()
		draw_button_color("backgroundleavesdarkoakcolor", dx, dy, dw, background_leaves_dark_oak_color, c_plains_biome_foliage, false, action_background_leaves_dark_oak_color)
		tab_next()
		
		// Mangrove
		tab_control_color()
		draw_button_color("backgroundleavesmangrovecolor", dx, dy, dw, background_leaves_mangrove_color, c_plains_biome_foliage, false, action_background_leaves_mangrove_color)
		tab_next()
		
		tab_set_collumns(false)
	}
	
	dy += 20
	draw_label(text_get("backgroundscenecolors") + ":", dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label) 
	dy += 8
	
	tab_set_collumns(true, floor(content_width/150))
	
	// Sky
	tab_control_color()
	draw_button_color("backgroundskycolor", dx, dy, dw, background_sky_color, c_sky, false, action_background_sky_color)
	tab_next()
	
	// Clouds
	tab_control_color()
	draw_button_color("backgroundskycloudscolor", dx, dy, dw, background_sky_clouds_color, c_clouds, false, action_background_sky_clouds_color)
	tab_next()
	
	// Sun light
	tab_control_color()
	draw_button_color("backgroundsunlightcolor", dx, dy, dw, background_sunlight_color, c_sunlight, false, action_background_sunlight_color)
	tab_next()
	
	// Ambient
	tab_control_color()
	draw_button_color("backgroundambientcolor", dx, dy, dw, background_ambient_color, c_ambient, false, action_background_ambient_color)
	tab_next()
	
	// Night sky
	tab_control_color()
	draw_button_color("backgroundnightskycolor", dx, dy, dw, background_night_sky_color, c_night_sky, false, action_background_night_sky_color)
	tab_next()
	
	// Night ambient
	tab_control_color()
	draw_button_color("backgroundnightcolor", dx, dy, dw, background_night_color, c_night, false, action_background_night_color)
	tab_next()
	
	tab_set_collumns(false)
	
	// Twilight
	if (setting_advanced_mode)
	{
		tab_control_switch()
		draw_switch("backgroundtwilight", dx, dy, background_twilight, action_background_twilight, "backgroundtwilighttip")
		tab_next()
	}
	
	// Show fog
	tab_control_switch()
	draw_button_collapse("fog", collapse_map[?"fog"], action_background_fog_show, background_fog_show, "backgroundfog")
	tab_next()
	
	if (background_fog_show && collapse_map[?"fog"])
	{
		tab_collapse_start()
		
		// Sky fog
		tab_control_switch()
		draw_switch("backgroundfogsky", dx, dy, background_fog_sky, action_background_fog_sky)
		tab_next()
		
		// Custom color
		tab_control_switch()
		draw_switch("backgroundfogcolorcustom", dx, dy, background_fog_color_custom, action_background_fog_color_custom)
		tab_next()
		
		// Fog color
		if (background_fog_color_custom)
		{
			tab_control_color()
			draw_button_color("backgroundfogcolor", dx, dy, dw, background_fog_color, c_sky, false, action_background_fog_color)
			tab_next()
		}
		
		// Custom object fog color
		tab_control_switch()
		draw_switch("backgroundfogcustomobjectcolor", dx, dy, background_fog_custom_object_color, action_background_fog_custom_object_color)
		tab_next()
		
		// Fog color
		if (background_fog_custom_object_color)
		{
			tab_control_color()
			draw_button_color("backgroundfogobjectcolor", dx, dy, dw, background_fog_object_color, c_sky, false, action_background_fog_object_color)
			tab_next()
		}
		
		// Fog distance
		tab_control_dragger()
		draw_dragger("backgroundfogdistance", dx, dy, dragger_width, background_fog_distance, background_fog_distance / 100, 10, project_render_distance, 10000, 10, tab.background.tbx_fog_distance, action_background_fog_distance)
		tab_next()
		
		// Fog size
		tab_control_dragger()
		draw_dragger("backgroundfogsize", dx, dy, dragger_width, background_fog_size, background_fog_size / 100, 10, project_render_distance, 2000, 10, tab.background.tbx_fog_size, action_background_fog_size)
		tab_next()
		
		// Fog height
		tab_control_dragger()
		draw_dragger("backgroundfogheight", dx, dy, dragger_width, background_fog_height, background_fog_height / 100, 10, 2000, 1000, 10, tab.background.tbx_fog_height, action_background_fog_height)
		tab_next()
		
		tab_collapse_end()
	}
	
	// Wind
	tab_control_switch()
	draw_button_collapse("wind", collapse_map[?"wind"], action_background_wind, background_wind, "backgroundwind")
	tab_next()
	
	if (background_wind && collapse_map[?"wind"])
	{
		tab_collapse_start()
		
		// Wind strength
		tab_control_dragger()
		draw_dragger("backgroundwindspeed", dx, dy, dragger_width, round(background_wind_speed * 100), .1, 0, no_limit * 100, 10, 1, tab.background.tbx_wind_speed, action_background_wind_speed)
		tab_next()
		
		// Wind amount
		tab_control_dragger()
		draw_dragger("backgroundwindstrength", dx, dy, dragger_width, background_wind_strength, .1, 0, no_limit, 0.5, 0.05, tab.background.tbx_wind_strength, action_background_wind_strength)
		tab_next()
		
		// Advanced mode only
		if (setting_advanced_mode)
		{
			// Wind angle
			tab_control_dragger()
			draw_dragger("backgroundwinddirection", dx, dy, dragger_width, background_wind_direction, .1, -no_limit, no_limit, 45, 1, tab.background.tbx_wind_direction, action_background_wind_direction)
			tab_next()
			
			// Wind direction speed
			tab_control_dragger()
			draw_dragger("backgroundwinddirectionalspeed", dx, dy, dragger_width, round(background_wind_directional_speed * 100), .1, 0, no_limit, 20, 1, tab.background.tbx_wind_directional_speed, action_background_wind_directional_speed)
			tab_next()
			
			// Wind direction strength
			tab_control_dragger()
			draw_dragger("backgroundwinddirectionalstrength", dx, dy, dragger_width, background_wind_directional_strength, .01, 0, no_limit, 1.5, 0.05, tab.background.tbx_wind_directional_strength, action_background_wind_directional_strength)
			tab_next()
		}
		
		tab_collapse_end()
	}
	
	// Animation speed (Advanced mode only)
	if (setting_advanced_mode)
	{
		tab_control_dragger()
		draw_dragger("backgroundtextureanimationspeed", dx, dy, dragger_width, background_texture_animation_speed, 0.01, -no_limit, no_limit, 20, 0, tab.background.tbx_texture_animation_speed, action_background_texture_animation_speed)
		tab_next()
	}
}
