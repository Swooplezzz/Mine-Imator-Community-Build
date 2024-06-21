/// app_startup_lists()

function app_startup_lists()
{
	globalvar value_name_list, transition_list, transition_list_order;
	globalvar temp_type_name_list, tl_type_name_list, res_type_name_list;
	globalvar videotemplate_list, videoquality_list;
	globalvar language_english_map, language_map;
	globalvar camera_values_list, camera_values_copy, camera_use_default_list;
	globalvar minecraft_pattern_list, minecraft_pattern_short_list, minecraft_sherd_map;
	globalvar minecraft_armor_trim_pattern_list, minecraft_armor_trim_material_list;
	globalvar minecraft_map_color_array, minecraft_swatch_array, minecraft_swatch_color_map, minecraft_swatch_dyes;
	globalvar biome_list, particle_template_list, particle_template_map;
	globalvar blend_mode_list, blend_mode_map;
	globalvar timeline_icon_list, timeline_icon_list_dark;
	globalvar render_pass_list;
	
	// Values
	value_name_list = ds_list_create()
	ds_list_add(value_name_list,
		"POS_X",
		"POS_Y",
		"POS_Z",
		"ROT_X",
		"ROT_Y",
		"ROT_Z",
		"SCA_X",
		"SCA_Y",
		"SCA_Z",
		"BEND_ANGLE",
		"BEND_ANGLE_X",
		"BEND_ANGLE_Y",
		"BEND_ANGLE_Z",
		"ALPHA",
		"RGB_ADD",
		"RGB_SUB",
		"RGB_MUL",
		"HSB_ADD",
		"HSB_SUB",
		"HSB_MUL",
		"MIX_COLOR",
		"GLOW_COLOR",
		"MIX_PERCENT",
		"EMISSIVE",
		"METALLIC",
		"ROUGHNESS",
		"SUBSURFACE",
		"SUBSURFACE_RADIUS_RED",
		"SUBSURFACE_RADIUS_GREEN",
		"SUBSURFACE_RADIUS_BLUE",
		"SUBSURFACE_COLOR",
		"WIND_INFLUENCE",
		"SPAWN",
		"FREEZE",
		"CLEAR",
		"CUSTOM_SEED",
		"SEED",
		"ATTRACTOR",
		"FORCE",
		"FORCE_DIRECTIONAL",
		"FORCE_VORTEX",
		"LIGHT_COLOR",
		"LIGHT_STRENGTH",
		"LIGHT_SPECULAR_STRENGTH",
		"LIGHT_SIZE",
		"LIGHT_RANGE",
		"LIGHT_FADE_SIZE",
		"LIGHT_SPOT_RADIUS",
		"LIGHT_SPOT_SHARPNESS",
		"CAM_FOV",
		"CAM_ASPECT",
		"CAM_BLADE_AMOUNT",
		"CAM_BLADE_ANGLE",
		"CAM_LIGHT_MANAGEMENT",
		"CAM_TONEMAPPER",
		"CAM_EXPOSURE",
		"CAM_GAMMA",
		"CAM_ROTATE",
		"CAM_ROTATE_DISTANCE",
		"CAM_ROTATE_ANGLE_XY",
		"CAM_ROTATE_ANGLE_Z",
		"CAM_SHAKE",
		"CAM_SHAKE_MODE",
		"CAM_SHAKE_STRENGTH_X",
		"CAM_SHAKE_STRENGTH_Y",
		"CAM_SHAKE_STRENGTH_Z",
		"CAM_SHAKE_SPEED_X",
		"CAM_SHAKE_SPEED_Y",
		"CAM_SHAKE_SPEED_Z",
		"CAM_DOF",
		"CAM_DOF_DEPTH",
		"CAM_DOF_RANGE",
		"CAM_DOF_FADE_SIZE",
		"CAM_DOF_BLUR_SIZE",
		"CAM_DOF_BLUR_RATIO",
		"CAM_DOF_BIAS",
		"CAM_DOF_THRESHOLD",
		"CAM_DOF_GAIN",
		"CAM_DOF_FRINGE",
		"CAM_DOF_FRINGE_ANGLE_RED",
		"CAM_DOF_FRINGE_ANGLE_GREEN",
		"CAM_DOF_FRINGE_ANGLE_BLUE",
		"CAM_DOF_FRINGE_RED",
		"CAM_DOF_FRINGE_GREEN",
		"CAM_DOF_FRINGE_BLUE",
		"CAM_BLOOM",
		"CAM_BLOOM_THRESHOLD",
		"CAM_BLOOM_INTENSITY",
		"CAM_BLOOM_RADIUS",
		"CAM_BLOOM_RATIO",
		"CAM_BLOOM_BLEND",
		"CAM_LENS_DIRT",
		"CAM_LENS_DIRT_BLOOM",
		"CAM_LENS_DIRT_GLOW",
		"CAM_LENS_DIRT_RADIUS",
		"CAM_LENS_DIRT_INTENSITY",
		"CAM_LENS_DIRT_POWER",
		"CAM_COLOR_CORRECTION",
		"CAM_CONTRAST",
		"CAM_BRIGHTNESS",
		"CAM_SATURATION",
		"CAM_VIBRANCE",
		"CAM_COLOR_BURN",
		"CAM_GRAIN",
		"CAM_GRAIN_STRENGTH",
		"CAM_GRAIN_SATURATION",
		"CAM_GRAIN_SIZE",
		"CAM_VIGNETTE",
		"CAM_VIGNETTE_RADIUS",
		"CAM_VIGNETTE_SOFTNESS",
		"CAM_VIGNETTE_STRENGTH",
		"CAM_VIGNETTE_COLOR",
		"CAM_CA",
		"CAM_CA_BLUR_AMOUNT",
		"CAM_CA_DISTORT_CHANNELS",
		"CAM_CA_RED_OFFSET",
		"CAM_CA_GREEN_OFFSET",
		"CAM_CA_BLUE_OFFSET",
		"CAM_DISTORT",
		"CAM_DISTORT_REPEAT",
		"CAM_DISTORT_ZOOM_AMOUNT",
		"CAM_DISTORT_AMOUNT",
		"CAM_SIZE_USE_PROJECT",
		"CAM_SIZE_KEEP_ASPECT_RATIO",
		"CAM_WIDTH",
		"CAM_HEIGHT",
		"BG_IMAGE_SHOW",
		"BG_IMAGE_ROTATION",
		"BG_SKY_MOON_PHASE",
		"BG_SKY_TIME",
		"BG_SKY_ROTATION",
		"BG_SUNLIGHT_STRENGTH",
		"BG_SUNLIGHT_ANGLE",
		"BG_SKY_SUN_ANGLE",
		"BG_SKY_SUN_SCALE",
		"BG_SKY_MOON_ANGLE",
		"BG_SKY_MOON_SCALE",
		"BG_TWILIGHT",
		"BG_SKY_CLOUDS_SHOW",
		"BG_SKY_CLOUDS_SPEED",
		"BG_SKY_CLOUDS_HEIGHT",
		"BG_SKY_CLOUDS_OFFSET",
		"BG_GROUND_SHOW",
		"BG_GROUND_SLOT",
		"BG_GROUND_DIRECTION",
		"BG_BIOME",
		"BG_SKY_COLOR",
		"BG_SKY_CLOUDS_COLOR",
		"BG_SUNLIGHT_COLOR",
		"BG_AMBIENT_COLOR",
		"BG_NIGHT_SKY_COLOR",
		"BG_NIGHT_SKY_CLOUDS_COLOR",
		"BG_NIGHT_SKY_STARS_COLOR",
		"BG_NIGHT_COLOR",
		"BG_GRASS_COLOR",
		"BG_FOLIAGE_COLOR",
		"BG_WATER_COLOR",
		"BG_LEAVES_OAK_COLOR",
		"BG_LEAVES_SPRUCE_COLOR",
		"BG_LEAVES_BIRCH_COLOR",
		"BG_LEAVES_JUNGLE_COLOR",
		"BG_LEAVES_ACACIA_COLOR",
		"BG_LEAVES_DARK_OAK_COLOR",
		"BG_LEAVES_MANGROVE_COLOR",
		"BG_FOG_SHOW",
		"BG_FOG_SKY",
		"BG_FOG_CUSTOM_COLOR",
		"BG_FOG_COLOR",
		"BG_FOG_CUSTOM_OBJECT_COLOR",
		"BG_FOG_OBJECT_COLOR",
		"BG_FOG_DISTANCE",
		"BG_FOG_SIZE",
		"BG_FOG_HEIGHT",
		"BG_WIND",
		"BG_WIND_SPEED",
		"BG_WIND_STRENGTH",
		"BG_WIND_DIRECTION",
		"BG_WIND_DIRECTIONAL_SPEED",
		"BG_WIND_DIRECTIONAL_STRENGTH",
		"BG_TEXTURE_ANI_SPEED",
		"TEXTURE_OBJ",
		"TEXTURE_MATERIAL_OBJ",
		"TEXTURE_NORMAL_OBJ",
		"SOUND_OBJ",
		"SOUND_VOLUME",
		"SOUND_PITCH",
		"SOUND_START",
		"SOUND_END",
		"TEXT",
		"TEXT_FONT",
		"TEXT_HALIGN",
		"TEXT_VALIGN",
		"TEXT_AA",
		"TEXT_OUTLINE",
		"TEXT_OUTLINE_COLOR",
		"CUSTOM_ITEM_SLOT",
		"ITEM_SLOT",
		"ITEM_NAME",
		"PATH_OBJ",
		"PATH_OFFSET",
		"PATH_POINT_ANGLE",
		"PATH_POINT_SCALE",
		"IK_TARGET",
		"IK_BLEND",
		"IK_TARGET_ANGLE",
		"IK_ANGLE_OFFSET",
		"BEND_IK_MULTIPLIER",
		"ROT_TARGET",
		"POS_TARGET",
		"SCALE_TARGET",
		"BEND_IK_TARGET",
		"COPY_ROT_X",
		"COPY_ROT_Y",
		"COPY_ROT_Z",
		"COPY_POS_X",
		"COPY_POS_Y",
		"COPY_POS_Z",
		"COPY_SCALE_X",
		"COPY_SCALE_Y",
		"COPY_SCALE_Z",
		"COPY_POS_OFFSET_X",
		"COPY_POS_OFFSET_Y",
		"COPY_POS_OFFSET_Z",
		"COPY_SCALE_MULT",
		"VISIBLE",
		"TRANSITION",
		"EASE_IN_X",
		"EASE_IN_Y",
		"EASE_OUT_X",
		"EASE_OUT_Y",
		"SPOT_GOBO_OFFSET_X",
		"SPOT_GOBO_OFFSET_Y",
		"SPOT_GOBO_REPEAT_X",
		"SPOT_GOBO_REPEAT_Y"
	)
	
	// Camera values
	camera_values_list = ds_list_create()
	
	for (var i = e_value.CAM_FOV; i <= e_value.CAM_HEIGHT; i++)
		ds_list_add(camera_values_list, i)
	
	camera_values_copy = ds_list_create()
	for (var i = 0; i < ds_list_size(camera_values_list); i++)
		camera_values_copy[|i] = tl_value_default(camera_values_list[|i])
	
	camera_use_default_list = ds_list_create()
	
	for (var i = 0; i < ds_list_size(camera_values_list); i++)
	{
		var valueid = e_value.CAM_FOV + i;
		
		if (tl_value_is_bool(valueid))
			camera_use_default_list[|i] = false
		else if (valueid = e_value.CAM_WIDTH || valueid = e_value.CAM_HEIGHT)
			camera_use_default_list[|i] = null
		else
			camera_use_default_list[|i] = true
	}
	
	// Template types
	temp_type_name_list = ds_list_create()
	ds_list_add(temp_type_name_list,
		"char",
		"spblock",
		"scenery",
		"item",
		"block",
		"bodypart",
		"particles",
		"text",
		"cube",
		"cone",
		"cylinder",
		"sphere",
		"surface",
		"model"
	)
	
	// Timeline types
	tl_type_name_list = ds_list_create()
	ds_list_add(tl_type_name_list,
		"char",
		"spblock",
		"scenery",
		"item",
		"block",
		"bodypart",
		"particles",
		"text",
		"cube",
		"cone",
		"cylinder",
		"sphere",
		"surface",
		"model",
		"camera",
		"spotlight",
		"pointlight",
		"folder",
		"background",
		"audio",
		"path",
		"pathpoint",
		"shape",
		"lightsource"
	)
	
	// Resource types
	res_type_name_list = ds_list_create()
	ds_list_add(res_type_name_list,
		"pack",
		"packunzipped",
		"skin",
		"downloadskin",
		"itemsheet",
		"legacyblocksheet",
		"blocksheet",
		"scenery",
		"fromworld",
		"particlesheet",
		"texture",
		"font",
		"sound",
		"model"
	)
	
	// Transitions
	transition_list = ds_list_create()
	ds_list_add(transition_list,
		"linear",
		"instant",
		"bezier",
		"easeinquad",
		"easeoutquad",
		"easeinoutquad",
		"easeincubic",
		"easeoutcubic",
		"easeinoutcubic",
		"easeinquart",
		"easeoutquart",
		"easeinoutquart",
		"easeinquint",
		"easeoutquint",
		"easeinoutquint",
		"easeinsine",
		"easeoutsine",
		"easeinoutsine",
		"easeinexpo",
		"easeoutexpo",
		"easeinoutexpo",
		"easeincirc",
		"easeoutcirc",
		"easeinoutcirc",
		"easeinelastic",
		"easeoutelastic",
		"easeinoutelastic",
		"easeinback",
		"easeoutback",
		"easeinoutback",
		"easeinbounce",
		"easeoutbounce",
		"easeinoutbounce"
	)
	
	// Organized list
	transition_list_order = ds_list_create()
	
	for (var i = 0; i < ds_list_size(transition_list); i++)
		if (!string_contains(transition_list[|i], "ease"))
			ds_list_add(transition_list_order, transition_list[|i])
	
	for (var i = 0; i < ds_list_size(transition_list); i++)
		if (string_contains(transition_list[|i], "easein") &&
			!string_contains(transition_list[|i], "easeinout"))
				ds_list_add(transition_list_order, transition_list[|i])
	
	for (var i = 0; i < ds_list_size(transition_list); i++)
		if (string_contains(transition_list[|i], "easeout"))
			ds_list_add(transition_list_order, transition_list[|i])
	
	for (var i = 0; i < ds_list_size(transition_list); i++)
		if (string_contains(transition_list[|i], "easeinout"))
			ds_list_add(transition_list_order, transition_list[|i])
	
	log("Make transitions")
	transition_texture_map = new_transition_texture_map(36, 36, 6, true)
	transition_texture_small_map = new_transition_texture_map(24, 24, 3, false)
	log("Transitions OK")
	
	// Video templates
	videotemplate_list = ds_list_create()
	ds_list_add(videotemplate_list,
		new_videotemplate("avatar", 512, 512),
		new_videotemplate("hd_720p", 1280, 720),
		new_videotemplate("fhd_1080p", 1920, 1080),
		new_videotemplate("qhd_1440p", 2560, 1440),
		new_videotemplate("uhd_4k", 3840, 2160),
		new_videotemplate("hd_720p_cinematic", 1680, 720),
		new_videotemplate("fhd_1080p_cinematic", 2560, 1080),
		new_videotemplate("qhd_1440p_cinematic", 3440, 1440),
		new_videotemplate("uhd_4k_cinematic", 5120, 2160)
	)
	
	// Video qualities
	videoquality_list = ds_list_create()
	ds_list_add(videoquality_list,
		new_videoquality("best", 5000000),
		new_videoquality("high", 2500000),
		new_videoquality("medium", 1200000),
		new_videoquality("low", 700000),
		new_videoquality("verylow", 350000)
	)
	
	// Language
	language_english_map = ds_map_create()
	language_map = ds_map_create()
	
	language_load(language_file, language_english_map)
	ds_map_copy(language_map, language_english_map)
	langauge_new(language_file)
	
	// Biomes
	biome_list = ds_list_create()
	ds_list_add(biome_list, new_biome("custom", 0, 0, true, c_plains_biome_grass, c_plains_biome_foliage, c_plains_biome_water, null))
	
	// Particles
	particle_template_list = ds_list_create()
	particle_template_map = ds_map_create()
	
	minecraft_pattern_list = ds_list_create()
	minecraft_pattern_short_list = ds_list_create()
	minecraft_sherd_map = ds_map_create()
	
	minecraft_armor_trim_pattern_list = ds_list_create()
	minecraft_armor_trim_material_list = ds_list_create()
	minecraft_map_color_array = []
	minecraft_swatch_array = []
	minecraft_swatch_color_map = ds_map_create()
	
	blend_mode_list = ds_list_create()
	ds_list_add(blend_mode_list,
		"normal",
		"add",
		"subtract",
		"multiply",
		"screen"
	)
	
	blend_mode_map = ds_map_create()
	ds_map_add(blend_mode_map, "normal", bm_normal)
	ds_map_add(blend_mode_map, "add", bm_add)
	ds_map_add(blend_mode_map, "subtract", bm_subtract)
	ds_map_add(blend_mode_map, "multiply", array(bm_zero, bm_src_color))
	ds_map_add(blend_mode_map, "screen", array(bm_one, bm_inv_src_color))
	
	// List of icons in sync with e_tl_type
	/*
		CHARACTER,
		SPECIAL_BLOCK,
		SCENERY,
		ITEM,
		BLOCK,
		BODYPART,
		PARTICLE_SPAWNER,
		TEXT,
		CUBE,
		CONE,
		CYLINDER,
		SPHERE,
		SURFACE,
		MODEL,
		CAMERA,
		SPOT_LIGHT,
		POINT_LIGHT,
		FOLDER,
		BACKGROUND,
		AUDIO
	*/
	
	timeline_icon_list = ds_list_create()
	ds_list_add(timeline_icon_list,
		icons.CHARACTER,
		icons.BLOCK_SPECIAL,
		icons.SCENERY,
		icons.ITEM,
		icons.BLOCK,
		icons.PART,
		icons.FIREWORKS,
		icons.TEXT,
		icons.CUBE,
		icons.CONE,
		icons.CYLINDER,
		icons.SPHERE,
		icons.PLANE,
		icons.MODEL,
		icons.CAMERA,
		icons.LIGHT_SPOT,
		icons.LIGHT_POINT,
		icons.FOLDER,
		icons.CLOUD,
		icons.NOTE,
		icons.PATH,
		icons.PATH_POINT
	)
	
	timeline_icon_list_dark = ds_list_create()
	ds_list_add(timeline_icon_list_dark,
		icons.CHARACTER,
		icons.BLOCK_SPECIAL,
		icons.SCENERY,
		icons.ITEM,
		icons.BLOCK,
		icons.PART,
		icons.FIREWORKS,
		icons.TEXT,
		icons.CUBE__DARK,
		icons.CONE__DARK,
		icons.CYLINDER__DARK,
		icons.SPHERE__DARK,
		icons.PLANE,
		icons.MODEL,
		icons.CAMERA,
		icons.LIGHT_SPOT,
		icons.LIGHT_POINT,
		icons.FOLDER,
		icons.CLOUD,
		icons.NOTE,
		icons.PATH,
		icons.PATH_POINT
	)
	
	render_pass_list = ds_list_create()
	ds_list_add(render_pass_list,
		"combined",
		"diffuse",
		"specular",
		"ao",
		"shadows",
		"indirect",
		"indirectshadows",
		"reflections",
		"depth",
		"normal",
		"material"
	)
}
