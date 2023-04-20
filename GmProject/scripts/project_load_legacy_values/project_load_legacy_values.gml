/// project_load_legacy_values(timeline)
/// @arg timeline

function project_load_legacy_values(tl)
{
	if (tl.value_type[e_value_type.TRANSFORM_POS])
	{
		value[e_value.POS_X] = buffer_read_double()
		value[e_value.POS_Y] = buffer_read_double()
		value[e_value.POS_Z] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.TRANSFORM_ROT])
	{
		value[e_value.ROT_X] = buffer_read_double()
		value[e_value.ROT_Y] = buffer_read_double()
		value[e_value.ROT_Z] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.TRANSFORM_SCA])
	{
		value[e_value.SCA_X] = buffer_read_double()
		value[e_value.SCA_Y] = buffer_read_double()
		value[e_value.SCA_Z] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.TRANSFORM_BEND])
	{
		value[e_value.BEND_ANGLE_LEGACY] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.MATERIAL_COLOR])
	{
		value[e_value.ALPHA] = buffer_read_double()
		value[e_value.RGB_ADD] = buffer_read_int()
		value[e_value.RGB_SUB] = buffer_read_int()
		value[e_value.RGB_MUL] = buffer_read_int()
		value[e_value.HSB_ADD] = buffer_read_int()
		value[e_value.HSB_SUB] = buffer_read_int()
		value[e_value.HSB_MUL] = buffer_read_int()
		value[e_value.MIX_COLOR] = buffer_read_int()
		value[e_value.MIX_PERCENT] = buffer_read_double()
		value[e_value.EMISSIVE] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.PARTICLES])
	{
		value[e_value.SPAWN] = buffer_read_byte()
		value[e_value.ATTRACTOR] = project_load_legacy_save_id()
		if (value[e_value.ATTRACTOR] = "root")
			value[e_value.ATTRACTOR] = null
		value[e_value.FORCE] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.LIGHT])
	{
		value[e_value.LIGHT_COLOR] = buffer_read_int()
		value[e_value.LIGHT_RANGE] = buffer_read_double()
		value[e_value.LIGHT_FADE_SIZE] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.SPOTLIGHT])
	{
		value[e_value.LIGHT_SPOT_RADIUS] = buffer_read_double()
		value[e_value.LIGHT_SPOT_SHARPNESS] = buffer_read_double()
	}
	
	if (tl.value_type[e_value_type.CAMERA])
	{
		if (load_format >= e_project.FORMAT_100_DEMO_4)
		{
			value[e_value.CAM_FOV] = buffer_read_double()
			if (load_format != e_project.FORMAT_106_2)
				/*value[e_value.CAM_RATIO] = */buffer_read_double()
			value[e_value.CAM_ROTATE] = buffer_read_byte()
			value[e_value.CAM_ROTATE_DISTANCE] = buffer_read_double()
			value[e_value.CAM_ROTATE_ANGLE_XY] = buffer_read_double()
			value[e_value.CAM_ROTATE_ANGLE_Z] = buffer_read_double()
		}
		else
		{
			buffer_read_double() // old rotate values
			buffer_read_double()
			buffer_read_double()
			value[e_value.CAM_FOV] = buffer_read_double()
		}
		value[e_value.CAM_DOF] = buffer_read_byte()
		value[e_value.CAM_DOF_DEPTH] = buffer_read_double()
		value[e_value.CAM_DOF_RANGE] = buffer_read_double()
		value[e_value.CAM_DOF_FADE_SIZE] = buffer_read_double()
		
		if (load_format = e_project.FORMAT_106_2)
		{
			value[e_value.CAM_WIDTH] = buffer_read_int()
			value[e_value.CAM_HEIGHT] = buffer_read_int()
			value[e_value.CAM_SIZE_USE_PROJECT] = buffer_read_byte()
			value[e_value.CAM_SIZE_KEEP_ASPECT_RATIO] = buffer_read_byte()
		}
		
		//Bloom
		if (load_format = e_project.FORMAT_CB_102)
		{
			value[e_value.CAM_BLOOM] = buffer_read_byte() // CAMBLOOM
			value[e_value.CAM_BLOOM_THRESHOLD] = buffer_read_double() // CAMBLOOMTHRE
			value[e_value.CAM_BLOOM_INTENSITY] = buffer_read_double() // CAMBLOOMOFFS
			
			value[e_value.CAM_BLOOM_THRESHOLD] = ((value[e_value.CAM_BLOOM_THRESHOLD]-1)*-1)*100
			value[e_value.CAM_BLOOM_INTENSITY] = ((value[e_value.CAM_BLOOM_INTENSITY]-1)*-1)*100
		}
		
		//Bloom
		if (load_format >= e_project.FORMAT_CB_103)
		{
			value[e_value.CAM_BLOOM] = buffer_read_byte() // CAMBLOOM
			value[e_value.CAM_BLOOM_THRESHOLD] = buffer_read_int() / 100 // CAMBLOOMTHRE
			value[e_value.CAM_BLOOM_INTENSITY] = buffer_read_int() / 100 // CAMBLOOMOFFS
		}
	}
	
	if (tl.value_type[e_value_type.BACKGROUND])
	{
		value[e_value.BG_SKY_MOON_PHASE] = buffer_read_byte()
		value[e_value.BG_SKY_TIME] = buffer_read_double()
		value[e_value.BG_SKY_ROTATION] = buffer_read_double()
		value[e_value.BG_SKY_CLOUDS_SPEED] = buffer_read_double()
		value[e_value.BG_SKY_COLOR] = buffer_read_int()
		value[e_value.BG_SKY_CLOUDS_COLOR] = buffer_read_int()
		value[e_value.BG_SUNLIGHT_COLOR] = buffer_read_int()
		value[e_value.BG_AMBIENT_COLOR] = buffer_read_int()
		value[e_value.BG_NIGHT_COLOR] = buffer_read_int()
		value[e_value.BG_FOG_COLOR] = buffer_read_int()
		value[e_value.BG_FOG_DISTANCE] = buffer_read_double()
		value[e_value.BG_FOG_SIZE] = buffer_read_double()
		if (load_format >= e_project.FORMAT_100_DEBUG)
			value[e_value.BG_FOG_HEIGHT] = buffer_read_double()
		value[e_value.BG_WIND_SPEED] = buffer_read_double()
		value[e_value.BG_WIND_STRENGTH] = buffer_read_double()
		value[e_value.BG_TEXTURE_ANI_SPEED] = buffer_read_double()
		
		if (load_format >= e_project.FORMAT_CB_100)
		{
			/*value[BGBIOMECOLOR] = */buffer_read_int()
		}
	}
	
	if (tl.value_type[e_value_type.MATERIAL_TEXTURE])
	{
		value[e_value.TEXTURE_OBJ] = project_load_legacy_save_id()
		if (value[e_value.TEXTURE_OBJ] = "root")
			value[e_value.TEXTURE_OBJ] = 0
	}
	
	if (tl.value_type[e_value_type.SOUND])
	{
		value[e_value.SOUND_OBJ] = project_load_legacy_save_id()
		value[e_value.SOUND_VOLUME] = buffer_read_double()
		value[e_value.SOUND_START] = buffer_read_double()
		value[e_value.SOUND_END] = buffer_read_double()
	}
	
	value[e_value.VISIBLE] = buffer_read_byte()
	value[e_value.TRANSITION] = transition_list[|buffer_read_int()]
}
