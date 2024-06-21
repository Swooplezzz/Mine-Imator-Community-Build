/// app_startup_interface_tabs()

function app_startup_interface_tabs()
{
	tab_move = null
	tab_move_name = ""
	tab_move_x = 0
	tab_move_width = 0
	tab_move_direction = e_scroll.VERTICAL
	tab_move_box_x = 0
	tab_move_box_y = 0
	tab_move_box_width = 0
	tab_move_box_height = 0
	tab_move_mouseon_panel = null
	tab_move_mouseon_panel_prev = null
	tab_move_mouseon_position = 0
	
	// Project properties
	properties = new_tab(setting_properties_location, true)
	with (properties)
	{
		// Project
		project = tab_add_category("project", icons.CLAPPERBOARD_SMALL, tab_properties_project, false)
		with (project)
		{
			tbx_name = new_textbox(true, 0, "")
			tbx_author = new_textbox(true, 0, "")
			tbx_description = new_textbox(false, 0, "")
			tbx_video_size_custom_width = new_textbox_integer()
			tbx_video_size_custom_height = new_textbox_integer()
			tbx_tempo = new_textbox_integer()
		}
		
		// Render
		render = tab_add_category("render", icons.CAMERA_PHOTO_SMALL, tab_properties_render, false)
		with (render)
		{
			tbx_render_distance = new_textbox_integer()
			tbx_samples = new_textbox_integer()
			
			tbx_ssao_radius = new_textbox_decimals()
			tbx_ssao_power = new_textbox_integer()
			tbx_ssao_power.suffix = "%"
			
			tbx_subsurface_samples = new_textbox_integer()
			tbx_subsurface_highlight = new_textbox_integer()
			tbx_subsurface_highlight.suffix = "%"
			tbx_subsurface_highlight_strength = new_textbox_integer()
			tbx_subsurface_highlight_strength.suffix = "%"
			
			tbx_indirect_precision = new_textbox_integer()
			tbx_indirect_precision.suffix = "%"
			tbx_indirect_blur_radius = new_textbox_decimals()
			tbx_indirect_blur_radius.suffix = "%"
			tbx_indirect_strength = new_textbox_integer()
			tbx_indirect_strength.suffix = "%"
			
			tbx_reflections_precision = new_textbox_integer()
			tbx_reflections_precision.suffix = "%"
			tbx_reflections_fade_amount = new_textbox_integer()
			tbx_reflections_fade_amount.suffix = "%"
			tbx_reflections_thickness = new_textbox_decimals()
			
			tbx_glow_radius = new_textbox_integer()
			tbx_glow_radius.suffix = "%"
			tbx_glow_intensity = new_textbox_integer()
			tbx_glow_intensity.suffix = "%"
			tbx_glow_falloff_radius = new_textbox_integer()
			tbx_glow_falloff_radius.suffix = "%"
			tbx_glow_falloff_intensity = new_textbox_integer()
			tbx_glow_falloff_intensity.suffix = "%"
			
			tbx_aa_power = new_textbox_integer()
			tbx_aa_power.suffix = "%"
			
			tbx_texture_filtering_level = new_textbox_integer()
			
			tbx_exposure = new_textbox_decimals()
			tbx_gamma = new_textbox_decimals()
			
			tbx_glint_speed = new_textbox_decimals()
			tbx_glint_speed.suffix = "%"
			tbx_glint_strength = new_textbox_decimals()
			tbx_glint_strength.suffix = "%"
			
			tbx_block_emissive = new_textbox_decimals()
			tbx_block_emissive.suffix = "%"
			tbx_block_subsurface_radius = new_textbox_decimals()
		}
		
		// Library
		library = tab_add_category("library", icons.LIBRARY_SMALL, tab_properties_library, false)
		with (library)
		{
			preview = new_obj(obj_preview)
			preview.spawn_active = true
			list = new_obj(obj_sortlist)
			list.can_deselect = true
			list.script = action_lib_list
			sortlist_column_add(list, "libname", 0)
			sortlist_column_add(list, "libtype", 0.35)
			sortlist_column_add(list, "libinstances", 0.65)
			tbx_name = new_textbox(1, 0, "")
			tbx_repeat_x = new_textbox_integer()
			tbx_repeat_y = new_textbox_integer()
			tbx_repeat_z = new_textbox_integer()
			tbx_shape_detail = new_textbox_integer()
			tbx_shape_tex_hoffset = new_textbox_ndecimals()
			tbx_shape_tex_voffset = new_textbox_ndecimals()
			tbx_shape_tex_hrepeat = new_textbox_decimals()
			tbx_shape_tex_vrepeat = new_textbox_decimals()
		}
		// Light Groups
		lightgroups = tab_add_category("lightgroups", icons.LIGHT_SPOT, tab_properties_light_groups, false)
		with (lightgroups)
		{
			list = new_obj(obj_sortlist)
			list.can_deselect = true
			list.script = action_light_group_list
			sortlist_column_add(list, "lgname", 0)
			//sortlist_column_add(list, "lgusecount", 0.65)
			tbx_name = new_textbox(1, 0, "")
		}
		// Background
		background = tab_add_category("background", icons.WORLD_SMALL, tab_properties_background, false)
		with (background)
		{
			tbx_background_rotation = new_textbox_decimals()
			tbx_background_rotation.suffix = "°"
			tbx_sky_time = new_textbox(true, 10, "-:0123456789")
			tbx_sky_rotation = new_textbox_ndecimals()
			tbx_sky_rotation.suffix = "°"
			tbx_sky_sun_angle = new_textbox_integer()
			tbx_sky_sun_angle.suffix = "°"
			tbx_sky_sun_scale = new_textbox_decimals()
			tbx_sky_sun_scale.suffix = "%"
			tbx_sky_moon_angle = new_textbox_integer()
			tbx_sky_moon_angle.suffix = "°"
			tbx_sky_moon_scale = new_textbox_decimals()
			tbx_sky_moon_scale.suffix = "%"
			tbx_sunlight_strength = new_textbox_integer()
			tbx_sunlight_strength.suffix = "%"
			tbx_sunlight_angle = new_textbox_decimals()
			tbx_sunlight_angle.suffix = "°"
			tbx_sky_clouds_height = new_textbox_ndecimals()
			tbx_sky_clouds_size = new_textbox_decimals()
			tbx_sky_clouds_thickness = new_textbox_decimals()
			tbx_sky_clouds_speed = new_textbox_ndecimals()
			tbx_sky_clouds_speed.suffix = "%"
			tbx_sky_clouds_offset = new_textbox_ndecimals()
			tbx_ground_direction = new_textbox_integer()
			tbx_ground_direction.suffix = "°"
			tbx_fog_distance = new_textbox_integer()
			tbx_fog_size = new_textbox_integer()
			tbx_fog_height = new_textbox_integer()
			tbx_wind_speed = new_textbox_decimals()
			tbx_wind_speed.suffix = "%"
			tbx_wind_strength = new_textbox_decimals()
			tbx_wind_direction = new_textbox_integer()
			tbx_wind_direction.suffix = "°"
			tbx_wind_directional_speed = new_textbox_decimals()
			tbx_wind_directional_speed.suffix = "%"
			tbx_wind_directional_strength = new_textbox_decimals()
			tbx_texture_animation_speed = new_textbox_ndecimals()
			tbx_texture_animation_speed.suffix = text_get("backgroundtextureanimationspeedfps")
		}
		
		// Resources
		resources = tab_add_category("resources", icons.FILE_SMALL, tab_properties_resources, false)
		with (resources)
		{
			preview = new_obj(obj_preview)
			list = new_obj(obj_sortlist)
			list.can_deselect = true
			list.script = action_res_list
			sortlist_column_add(list, "resname", 0)
			sortlist_column_add(list, "restype", 0.35)
			sortlist_column_add(list, "rescount", 0.65)
			sortlist_add(list, mc_res)
			
			tbx_item_sheet_width = new_textbox_integer()
			tbx_item_sheet_height = new_textbox_integer()
			
			tbx_scenery_integrity = new_textbox_integer()
			tbx_scenery_integrity.suffix = "%"
		}
	}
	
	lib_preview = properties.library.preview
	lib_list = properties.library.list
	light_group_list = properties.lightgroups.list
	res_preview = properties.resources.preview
	res_list = properties.resources.list
	
	// Ground editor
	ground_editor = new_tab(setting_ground_editor_location, false)
	ground_editor.script = tab_ground_editor
	with (ground_editor)
		ground_scroll = new_obj(obj_scrollbar)
	
	// Template editor
	template_editor = new_tab(setting_template_editor_location, false)
	template_editor.script = tab_template_editor
	
	with (template_editor)
	{
		// Character list
		char_list = new_obj(obj_sortlist)
		char_list.script = action_lib_model_name
		sortlist_column_add(char_list, "charname", 0)
		for (var c = 0; c < ds_list_size(mc_assets.char_list); c++)
			sortlist_add(char_list, mc_assets.char_list[|c].name)
		
		// Item
		item_scroll = new_obj(obj_scrollbar)
		
		// Block
		block_list = new_obj(obj_sortlist)
		block_list.script = action_lib_block_name
		sortlist_column_add(block_list, "blockname", 0)
		for (var b = 0; b < ds_list_size(mc_assets.block_list); b++)
			if (!mc_assets.block_list[|b].timeline || mc_assets.block_list[|b].tl_model_name = "" || mc_assets.block_list[|b].model_double)
				sortlist_add(block_list, mc_assets.block_list[|b].name)
		
		// Special block list
		special_block_list = new_obj(obj_sortlist)
		special_block_list.script = action_lib_model_name
		sortlist_column_add(special_block_list, "spblockname", 0)
		for (var b = 0; b < ds_list_size(mc_assets.special_block_list); b++)
			sortlist_add(special_block_list, mc_assets.special_block_list[|b].name)
		
		// Bodypart list
		bodypart_model_list = new_obj(obj_sortlist)
		bodypart_model_list.script = action_lib_bodypart_model_name
		sortlist_column_add(bodypart_model_list, "bodypartmodelname", 0)
		for (var m = 0; m < ds_list_size(mc_assets.char_list); m++)
			sortlist_add(bodypart_model_list, mc_assets.char_list[|m].name)
		for (var m = 0; m < ds_list_size(mc_assets.special_block_list); m++)
			sortlist_add(bodypart_model_list, mc_assets.special_block_list[|m].name)
		
		// Particle editor
		tbx_spawn_amount = new_textbox_integer()
		
		tbx_spawn_region_sphere_radius = new_textbox_decimals()
		tbx_spawn_region_path_radius = new_textbox_decimals()
		tbx_spawn_region_cube_size = new_textbox_decimals()
		tbx_spawn_region_box_xsize = new_textbox_decimals()
		tbx_spawn_region_box_ysize = new_textbox_decimals()
		tbx_spawn_region_box_zsize = new_textbox_decimals()
		
		tbx_bounding_box_ground_z = new_textbox_ndecimals()
		tbx_bounding_box_custom_xstart = new_textbox_ndecimals()
		tbx_bounding_box_custom_ystart = new_textbox_ndecimals()
		tbx_bounding_box_custom_zstart = new_textbox_ndecimals()
		tbx_bounding_box_custom_xend = new_textbox_ndecimals()
		tbx_bounding_box_custom_yend = new_textbox_ndecimals()
		tbx_bounding_box_custom_zend = new_textbox_ndecimals()
		
		tbx_destroy_at_amount_val = new_textbox_integer()
		tbx_destroy_at_time_seconds = new_textbox_ndecimals()
		tbx_destroy_at_time_random = new_textbox_ndecimals()
		
		type_list = new_obj(obj_sortlist)
		type_list.script = action_lib_pc_type_list
		type_list.can_deselect = true
		sortlist_column_add(type_list, "particleeditortypename", 0)
		sortlist_column_add(type_list, "particleeditortypekind", 0.4)
		sortlist_column_add(type_list, "particleeditortyperate", 0.75)
		preview_start = current_time
		preview_speed = 1
		
		tbx_type_name = new_textbox(true, 0, "")
		tbx_type_spawn_rate = new_textbox_integer()
		tbx_type_spawn_rate.suffix = "%"
		tbx_type_text = new_textbox(false, 0, "")
		tbx_type_sprite_frame_width = new_textbox_integer()
		tbx_type_sprite_frame_height = new_textbox_integer()
		tbx_type_sprite_frame_start = new_textbox_integer()
		tbx_type_sprite_frame_end = new_textbox_integer()
		
		tbx_type_sprite_animation_speed = new_textbox_decimals()
		tbx_type_sprite_animation_speed_random = new_textbox_decimals()
		
		tbx_type_xangle = new_textbox_ndecimals()
		tbx_type_xangle_random = new_textbox_ndecimals()
		tbx_type_yangle = new_textbox_ndecimals()
		tbx_type_yangle_random = new_textbox_ndecimals()
		tbx_type_zangle = new_textbox_ndecimals()
		tbx_type_zangle_random = new_textbox_ndecimals()
		tbx_type_angle_speed = new_textbox_ndecimals()
		tbx_type_angle_speed_random = new_textbox_ndecimals()
		tbx_type_angle_speed_add = new_textbox_ndecimals()
		tbx_type_angle_speed_add_random = new_textbox_ndecimals()
		tbx_type_angle_speed_mul = new_textbox_ndecimals()
		tbx_type_angle_speed_mul_random = new_textbox_ndecimals()
		
		tbx_type_xangle.suffix = "°"
		tbx_type_xangle_random.suffix = "°"
		tbx_type_yangle.suffix = "°"
		tbx_type_yangle_random.suffix = "°"
		tbx_type_zangle.suffix = "°"
		tbx_type_zangle_random.suffix = "°"
		
		tbx_type_xspd = new_textbox_ndecimals()
		tbx_type_xspd_random = new_textbox_ndecimals()
		tbx_type_yspd = new_textbox_ndecimals()
		tbx_type_yspd_random = new_textbox_ndecimals()
		tbx_type_zspd = new_textbox_ndecimals()
		tbx_type_zspd_random = new_textbox_ndecimals()
		tbx_type_xspd_add = new_textbox_ndecimals()
		tbx_type_xspd_add_random = new_textbox_ndecimals()
		tbx_type_yspd_add = new_textbox_ndecimals()
		tbx_type_yspd_add_random = new_textbox_ndecimals()
		tbx_type_zspd_add = new_textbox_ndecimals()
		tbx_type_zspd_add_random = new_textbox_ndecimals()
		tbx_type_xspd_mul = new_textbox_ndecimals()
		tbx_type_xspd_mul_random = new_textbox_ndecimals()
		tbx_type_yspd_mul = new_textbox_ndecimals()
		tbx_type_yspd_mul_random = new_textbox_ndecimals()
		tbx_type_zspd_mul = new_textbox_ndecimals()
		tbx_type_zspd_mul_random = new_textbox_ndecimals()
		
		tbx_type_xrot = new_textbox_ndecimals()
		tbx_type_xrot.suffix = "°"
		tbx_type_xrot_random = new_textbox_ndecimals()
		tbx_type_xrot_random.suffix = "°"
		tbx_type_yrot = new_textbox_ndecimals()
		tbx_type_yrot.suffix = "°"
		tbx_type_yrot_random = new_textbox_ndecimals()
		tbx_type_yrot_random.suffix = "°"
		tbx_type_zrot = new_textbox_ndecimals()
		tbx_type_zrot.suffix = "°"
		tbx_type_zrot_random = new_textbox_ndecimals()
		tbx_type_zrot_random.suffix = "°"
		
		tbx_type_xrot_spd = new_textbox_ndecimals()
		tbx_type_xrot_spd_random = new_textbox_ndecimals()
		tbx_type_yrot_spd = new_textbox_ndecimals()
		tbx_type_yrot_spd_random = new_textbox_ndecimals()
		tbx_type_zrot_spd = new_textbox_ndecimals()
		tbx_type_zrot_spd_random = new_textbox_ndecimals()
		tbx_type_xrot_spd_add = new_textbox_ndecimals()
		tbx_type_xrot_spd_add_random = new_textbox_ndecimals()
		tbx_type_yrot_spd_add = new_textbox_ndecimals()
		tbx_type_yrot_spd_add_random = new_textbox_ndecimals()
		tbx_type_zrot_spd_add = new_textbox_ndecimals()
		tbx_type_zrot_spd_add_random = new_textbox_ndecimals()
		tbx_type_xrot_spd_mul = new_textbox_ndecimals()
		tbx_type_xrot_spd_mul_random = new_textbox_ndecimals()
		tbx_type_yrot_spd_mul = new_textbox_ndecimals()
		tbx_type_yrot_spd_mul_random = new_textbox_ndecimals()
		tbx_type_zrot_spd_mul = new_textbox_ndecimals()
		tbx_type_zrot_spd_mul_random = new_textbox_ndecimals()
		
		tbx_type_xrot_spd.suffix = "°"
		tbx_type_xrot_spd_random.suffix = "°"
		tbx_type_yrot_spd.suffix = "°"
		tbx_type_yrot_spd_random.suffix = "°"
		tbx_type_zrot_spd.suffix = "°"
		tbx_type_zrot_spd_random.suffix = "°"
		tbx_type_xrot_spd_add.suffix = "°"
		tbx_type_xrot_spd_add_random.suffix = "°"
		tbx_type_yrot_spd_add.suffix = "°"
		tbx_type_yrot_spd_add_random.suffix = "°"
		tbx_type_zrot_spd_add.suffix = "°"
		tbx_type_zrot_spd_add_random.suffix = "°"
		tbx_type_xrot_spd_mul.suffix = "°"
		tbx_type_xrot_spd_mul_random.suffix = "°"
		tbx_type_yrot_spd_mul.suffix = "°"
		tbx_type_yrot_spd_mul_random.suffix = "°"
		tbx_type_zrot_spd_mul.suffix = "°"
		tbx_type_zrot_spd_mul_random.suffix = "°"
		
		tbx_type_sprite_angle = new_textbox_ndecimals()
		tbx_type_sprite_angle.suffix = "°"
		tbx_type_sprite_angle_random = new_textbox_ndecimals()
		tbx_type_sprite_angle_random.suffix = "°"
		tbx_type_sprite_angle_add = new_textbox_ndecimals()
		tbx_type_sprite_angle_add.suffix = "°"
		tbx_type_sprite_angle_add_random = new_textbox_ndecimals()
		tbx_type_sprite_angle_add_random.suffix = "°"
		
		tbx_type_sprite_angle_add.suffix = "°"
		tbx_type_sprite_angle_add_random.suffix = "°"
		
		tbx_type_scale = new_textbox_ndecimals()
		tbx_type_scale_random = new_textbox_ndecimals()
		tbx_type_scale_add = new_textbox_ndecimals()
		tbx_type_scale_add_random = new_textbox_ndecimals()
		
		tbx_type_alpha = new_textbox_integer()
		tbx_type_alpha.suffix = "%"
		tbx_type_alpha_random = new_textbox_integer()
		tbx_type_alpha_random.suffix = "%"
		tbx_type_alpha_add = new_textbox_ninteger()
		tbx_type_alpha_add.suffix = "%"
		tbx_type_alpha_add_random = new_textbox_ninteger()
		tbx_type_alpha_add_random.suffix = "%"
		
		tbx_type_color_mix_time = new_textbox_decimals()
		tbx_type_color_mix_time_random = new_textbox_decimals()
		
		tbx_type_bounce_factor = new_textbox_decimals()
	}
	
	ptype_list = template_editor.type_list
	
	// Timeline
	timeline = new_tab("bottom", true, null, e_window.TIMELINE)
	timeline.script = tab_timeline
	timeline.movable = false
	with (timeline)
	{
		tbx_interval_size = new_textbox_integer()
		tbx_interval_offset = new_textbox_integer()
		tbx_marker_name = new_textbox(true, 0, "")
		tbx_search = new_textbox(true, 0, "")
		tbx_rename = new_textbox(true, 0, "")
		
		list_width = 320
		
		hor_scroll = new_obj(obj_scrollbar)
		hor_scroll.zoomable = true
		hor_scroll_tl = new_obj(obj_scrollbar)
		ver_scroll = new_obj(obj_scrollbar)
	}
	
	// Timeline editor
	timeline_editor = new_tab(setting_timeline_editor_location, false)
	with (timeline_editor)
	{
		// Information
		info = tab_add_category("timelineeditorinfo", icons.LIST_BULLETED_SMALL, tab_timeline_editor_info, true)
		with (info)
		{
			tbx_name = new_textbox(true, 0, "")
			tbx_text = new_textbox(false, 0, "")
			tbx_rot_point_x = new_textbox_ndecimals()
			tbx_rot_point_y = new_textbox_ndecimals()
			tbx_rot_point_z = new_textbox_ndecimals()
		}
		

		
		// Hierarchy
		hierarchy = tab_add_category("timelineeditorhierarchy", icons.HIERARCHY_SMALL, tab_timeline_editor_hierarchy, true)
		
		// Graphics
		appearance = tab_add_category("timelineeditorappearance", [icons.SPHERE_SHADING_SMALL, icons.SPHERE_SHADING_SMALL__DARK], tab_timeline_editor_appearance, false)
		with (appearance)
		{
			tbx_glint_scale = new_textbox_integer()
			tbx_glint_scale.suffix = "%"
			tbx_glint_speed = new_textbox_integer()
			tbx_glint_speed.suffix = "%"
			tbx_glint_strength = new_textbox_integer()
			tbx_glint_strength.suffix = "%"
			tbx_depth = new_textbox_ninteger()
		}
		
		// Audio
		audio = tab_add_category("timelineeditoraudio", icons.NOTE_SMALL, tab_timeline_editor_audio, true)
		
		//Lights
		light = tab_add_category("timelineeditorlight", icons.LIGHT_POINT_SMALL, tab_timeline_editor_light, true)		
		
		// Path
		path = tab_add_category("timelineeditorpath", icons.PATH_SMALL, tab_timeline_editor_path, true)
		with (path)
		{
			tbx_detail = new_textbox_decimals()
			
			tbx_radius = new_textbox_decimals()
			tbx_tex_length = new_textbox_decimals()
			tbx_shape_detail = new_textbox_decimals()
		}
	}
	
	// Frame editor
	frame_editor = new_tab(setting_frame_editor_location, false)
	with (frame_editor)
	{
		// Transform
		transform = tab_add_category("frameeditortransform", icons.TRANSFORM_SMALL, tab_frame_editor_transform, false)
		with (transform)
		{
			// Position
			tbx_pos_x = new_textbox_ndecimals()
			tbx_pos_y = new_textbox_ndecimals()
			tbx_pos_z = new_textbox_ndecimals()
			
			// Rotation
			tbx_rot_x = new_textbox_ndecimals()
			tbx_rot_x.suffix = "°"
			tbx_rot_y = new_textbox_ndecimals()
			tbx_rot_y.suffix = "°"
			tbx_rot_z = new_textbox_ndecimals()
			tbx_rot_z.suffix = "°"
			
			// Scale
			scale_all = false
			tbx_sca_x = new_textbox_decimals()
			tbx_sca_y = new_textbox_decimals()
			tbx_sca_z = new_textbox_decimals()
			
			// Bend
			bend_sliders = false
			tbx_bend[0] = new_textbox_ndecimals()
			tbx_bend[0].suffix = "°"
			tbx_bend[1] = new_textbox_ndecimals()
			tbx_bend[1].suffix = "°"
			tbx_bend[2] = new_textbox_ndecimals()
			tbx_bend[2].suffix = "°"
			
			tbx_path_point_angle = new_textbox_ndecimals()
			tbx_path_point_angle.suffix = "°"
			tbx_path_point_scale = new_textbox_decimals()
		}

		// Constraints
		constraints = tab_add_category("frameeditorconstraints", icons.JOINT_SMALL, tab_frame_editor_constraints, false)
		with (constraints)
		{
			// Path
			tbx_path_offset = new_textbox_ndecimals()
			
			//// Follow position offset
			//tbx_copy_pos_offset_x = new_textbox_decimals()
			//tbx_copy_pos_offset_y = new_textbox_decimals()
			//tbx_copy_pos_offset_z = new_textbox_decimals()
			
			// IK
			tbx_ik_blend = new_textbox_integer()
			tbx_ik_blend.suffix = "%"
			tbx_ik_angle_offset = new_textbox_ndecimals()
			tbx_ik_angle_offset.suffix = "°"
			
			// Bend IK
			tbx_bend_ik_multiplier = new_textbox_ndecimals()
		}
		
		// Material
		material = tab_add_category("frameeditormaterial", [icons.SPHERE_MATERIAL_SMALL, icons.SPHERE_MATERIAL_SMALL__DARK], tab_frame_editor_material, false)
		with (material)
		{
			tbx_alpha = new_textbox_integer()
			tbx_alpha.suffix = "%"
			tbx_mix_percent = new_textbox_integer()
			tbx_mix_percent.suffix = "%"
			tbx_emissive = new_textbox_integer()
			tbx_emissive.suffix = "%"
			tbx_metallic = new_textbox_integer()
			tbx_metallic.suffix = "%"
			tbx_roughness = new_textbox_integer()
			tbx_roughness.suffix = "%"
			tbx_subsurface = new_textbox_decimals()
			tbx_subsurface_radius[X] = new_textbox_integer()
			tbx_subsurface_radius[X].suffix = "%"
			tbx_subsurface_radius[Y] = new_textbox_integer()
			tbx_subsurface_radius[Y].suffix = "%"
			tbx_subsurface_radius[Z] = new_textbox_integer()
			tbx_subsurface_radius[Z].suffix = "%"
			tbx_wind_influence = new_textbox_integer()
			tbx_wind_influence.suffix = "%"
		}
		
		// Particles
		particles = tab_add_category("frameeditorparticles", icons.PARTICLES_SMALL, tab_frame_editor_particles, false)
		with (particles)
		{
			tbx_seed = new_textbox_ninteger()
			tbx_force = new_textbox_ndecimals()
			tbx_force_directional = new_textbox_ndecimals()
			tbx_force_vortex = new_textbox_ndecimals()
		}
		
		// Light
		light = tab_add_category("frameeditorlight", icons.LIGHT_POINT_SMALL, tab_frame_editor_light, false)
		with (light)
		{
			has_spotlight = false
			tbx_size = new_textbox_decimals()
			tbx_range = new_textbox_decimals()
			tbx_strength = new_textbox_integer()
			tbx_strength.suffix = "%"
			tbx_specular_strength = new_textbox_integer()
			tbx_specular_strength.suffix = "%"
			tbx_fade_size = new_textbox_integer()
			tbx_fade_size.suffix = "%"
			tbx_spot_radius = new_textbox_decimals()
			tbx_spot_sharpness = new_textbox_integer()
			tbx_spot_sharpness.suffix = "%"
			
			tbx_spot_gobo_offset_x = new_textbox_decimals()
			tbx_spot_gobo_offset_y = new_textbox_decimals()			
			
			tbx_spot_gobo_repeat_x = new_textbox_decimals()
			tbx_spot_gobo_repeat_y = new_textbox_decimals()
		}
		
		// Camera
		camera = tab_add_category("frameeditorcamera", icons.CAMERA_SMALL, tab_frame_editor_camera, false)
		with (camera)
		{
			video_template = null
			tbx_video_size_custom_width = new_textbox_integer()
			tbx_video_size_custom_height = new_textbox_integer()
			tbx_aspect = new_textbox_decimals()
			tbx_fov = new_textbox_decimals()
			tbx_fov.suffix = "°"
			
			tbx_blade_amount = new_textbox_integer()
			tbx_blade_angle = new_textbox_integer()
			tbx_blade_angle.suffix = "°"
			
			tbx_exposure = new_textbox_decimals()
			tbx_gamma = new_textbox_decimals()
			
			tbx_rotate_distance = new_textbox_decimals()
			tbx_rotate_angle_xy = new_textbox_ndecimals()
			tbx_rotate_angle_xy.suffix = "°"
			tbx_rotate_angle_z = new_textbox_ndecimals()
			tbx_rotate_angle_z.suffix = "°"
			look_at_rotate = true
			
			tbx_shake_strength_x = new_textbox_decimals()
			tbx_shake_strength_x.suffix = "%"
			tbx_shake_strength_y = new_textbox_decimals()
			tbx_shake_strength_y.suffix = "%"
			tbx_shake_strength_z = new_textbox_decimals()
			tbx_shake_strength_z.suffix = "%"
			tbx_shake_speed_x = new_textbox_decimals()
			tbx_shake_speed_x.suffix = "%"
			tbx_shake_speed_y = new_textbox_decimals()
			tbx_shake_speed_y.suffix = "%"
			tbx_shake_speed_z = new_textbox_decimals()
			tbx_shake_speed_z.suffix = "%"
			
			tbx_dof_depth = new_textbox_decimals()
			tbx_dof_range = new_textbox_decimals()
			tbx_dof_fade_size = new_textbox_decimals()
			tbx_dof_blur_size = new_textbox_decimals()
			tbx_dof_blur_size.suffix = "%"
			tbx_dof_blur_ratio = new_textbox_integer()
			tbx_dof_blur_ratio.suffix = "%"
			tbx_dof_bias = new_textbox_integer()
			tbx_dof_bias.suffix = "%"
			tbx_dof_threshold = new_textbox_integer()
			tbx_dof_threshold.suffix = "%"
			tbx_dof_gain = new_textbox_integer()
			tbx_dof_gain.suffix = "%"
			tbx_dof_fringe_angle_red = new_textbox_ndecimals()
			tbx_dof_fringe_angle_red.suffix = "°"
			tbx_dof_fringe_angle_green = new_textbox_ndecimals()
			tbx_dof_fringe_angle_green.suffix = "°"
			tbx_dof_fringe_angle_blue = new_textbox_ndecimals()
			tbx_dof_fringe_angle_blue.suffix = "°"
			tbx_dof_fringe_red = new_textbox_integer()
			tbx_dof_fringe_red.suffix = "%"
			tbx_dof_fringe_green = new_textbox_integer()
			tbx_dof_fringe_green.suffix = "%"
			tbx_dof_fringe_blue = new_textbox_integer()
			tbx_dof_fringe_blue.suffix = "%"
		
			tbx_bloom_threshold = new_textbox_integer()
			tbx_bloom_threshold.suffix = "%"
			tbx_bloom_intensity = new_textbox_integer()
			tbx_bloom_intensity.suffix = "%"
			tbx_bloom_radius = new_textbox_integer()
			tbx_bloom_radius.suffix = "%"
			tbx_bloom_ratio = new_textbox_integer()
			tbx_bloom_ratio.suffix = "%"
			
			tbx_lens_dirt_radius = new_textbox_integer()
			tbx_lens_dirt_radius.suffix = "%"
			tbx_lens_dirt_intensity = new_textbox_integer()
			tbx_lens_dirt_intensity.suffix = "%"
			tbx_lens_dirt_power = new_textbox_integer()
			tbx_lens_dirt_power.suffix = "%"
			
			tbx_contrast = new_textbox_integer()
			tbx_contrast.suffix = "%"
			tbx_brightness = new_textbox_ninteger()
			tbx_brightness.suffix = "%"
			tbx_saturation = new_textbox_integer()
			tbx_saturation.suffix = "%"
			tbx_vibrance = new_textbox_integer()
			tbx_vibrance.suffix = "%"
			
			tbx_grain_strength = new_textbox_ninteger()
			tbx_grain_strength.suffix = "%"
			tbx_grain_saturation = new_textbox_integer()
			tbx_grain_saturation.suffix = "%"
			tbx_grain_size = new_textbox_integer()
			
			tbx_vignette_radius = new_textbox_integer()
			tbx_vignette_radius.suffix = "%"
			tbx_vignette_softness = new_textbox_integer()
			tbx_vignette_softness.suffix = "%"
			tbx_vignette_strength = new_textbox_integer()
			tbx_vignette_strength.suffix = "%"
			
			tbx_ca_blur_amount = new_textbox_integer()
			tbx_ca_blur_amount.suffix = "%"
			tbx_ca_red_offset = new_textbox_integer()
			tbx_ca_red_offset.suffix = "%"
			tbx_ca_green_offset = new_textbox_integer()
			tbx_ca_green_offset.suffix = "%"
			tbx_ca_blue_offset = new_textbox_integer()
			tbx_ca_blue_offset.suffix = "%"
			
			tbx_distort_zoom_amount = new_textbox_decimals()
			tbx_distort_zoom_amount.suffix = "%"
			tbx_distort_amount = new_textbox_ninteger()
			tbx_distort_amount.suffix = "%"
		}
		
		// Sound
		sound = tab_add_category("frameeditorsound", icons.VOLUME_SMALL, tab_frame_editor_sound, true)
		with (sound)
		{
			tbx_volume = new_textbox_integer()
			tbx_volume.suffix = "%"
			tbx_pitch = new_textbox_integer()
			tbx_pitch.suffix = "%"
			tbx_start = new_textbox_decimals()
			tbx_end = new_textbox_ndecimals()
		}
		
		// Text
		text = tab_add_category("frameeditortext", icons.TEXT_SMALL, tab_frame_editor_text, false)
		with (text)
			tbx_text = new_textbox(false, 0, "")
		
		// Item
		item = tab_add_category("frameeditoritem", icons.ITEM_SMALL, tab_frame_editor_item, false)
		with (item)
		{
			item_scroll = new_obj(obj_scrollbar)
			item_slot = new_textbox_integer()
		}
		
		// Keyframe
		keyframe = tab_add_category("frameeditorkeyframe", icons.KEYFRAME_SMALL, tab_frame_editor_keyframe, false)
		with (keyframe)
		{
			tbx_ease_in_x = new_textbox_integer()
			tbx_ease_in_x.suffix = "%"
			
			tbx_ease_in_y = new_textbox_ninteger()
			tbx_ease_in_y.suffix = "%"
			
			tbx_ease_out_x = new_textbox_integer()
			tbx_ease_out_x.suffix = "%"
			
			tbx_ease_out_y = new_textbox_ninteger()
			tbx_ease_out_y.suffix = "%"
			
			ease_link = false
		}
	}
	
	// Settings
	settings = new_tab(setting_settings_location, false)
	with (settings)
	{
		// Program
		program = tab_add_category("settingsprogram", icons.SETTINGS_SMALL, tab_settings_program, false)
		with (program)
		{
			tbx_backup_time = new_textbox_integer()
			tbx_backup_amount = new_textbox_integer()
			
			tbx_watermark_padding = new_textbox_integer()
			tbx_watermark_padding.suffix = "%"
			tbx_watermark_scale = new_textbox_integer()
			tbx_watermark_scale.suffix = "%"
			tbx_watermark_opacity = new_textbox_integer()
			tbx_watermark_opacity.suffix = "%"
		}
		
		// Interface
		interface = tab_add_category("settingsinterface", icons.BRUSH_SMALL, tab_settings_interface, false)
		with (interface)
		{
			tbx_work_camera_fov = new_textbox_decimals()
			tbx_work_camera_fov.suffix = "°"
		}
		
		// Controls
		controls = tab_add_category("settingscontrols", icons.KEYBOARD_SMALL, tab_settings_controls, false)
		with (controls)
		{
			tbx_move_speed = new_textbox_decimals()
			tbx_look_sensitivity = new_textbox_decimals()
			tbx_fast_modifier = new_textbox_decimals()
			tbx_slow_modifier = new_textbox_decimals()
		}
	}
}
