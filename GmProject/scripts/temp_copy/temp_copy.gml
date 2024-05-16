/// temp_copy(to)
/// @arg to
/// @desc Copies all the variables into the given object.

function temp_copy(to)
{
	if (id = app.bench_settings && type = e_tl_type.SHAPE)
		to.type = e_temp_type.CUBE + shape_type
	else
		to.type = type
	
	to.name = name
	
	to.model = model
	to.model_file = model_file
	to.model_tex = model_tex
	to.model_tex_material = model_tex_material
	to.model_tex_normal = model_tex_normal
	to.model_name = model_name
	to.model_state = array_copy_1d(model_state)
	to.model_part_name = model_part_name
	
	to.model_use_blend_color = model_use_blend_color
	to.model_blend_color = model_blend_color
	to.model_blend_color_default = model_blend_color_default
	
	to.pattern_base_color = pattern_base_color
	to.pattern_pattern_list = array_copy_1d(pattern_pattern_list)
	to.pattern_color_list = array_copy_1d(pattern_color_list)
	to.pattern_skin = sprite_duplicate(pattern_skin)
	
	to.armor_array = array_copy_1d(armor_array)
	
	for (var i = 0; i < 4; i++)
	{
		if (sprite_exists(armor_skin_array[i]))
			to.armor_skin_array[i] = texture_duplicate(armor_skin_array[i])
		else
			to.armor_skin_array[i] = null
	}
	
	to.item_tex = item_tex
	to.item_tex_material = item_tex_material
	to.item_tex_normal = item_tex_normal
	to.item_slot = item_slot
	to.item_3d = item_3d
	to.item_face_camera = item_face_camera
	to.item_bounce = item_bounce
	to.item_spin = item_spin
	
	to.block_name = block_name
	to.block_state = array_copy_1d(block_state)
	to.block_tex = block_tex
	to.block_tex_material = block_tex_material
	to.block_tex_normal = block_tex_normal
	
	to.scenery = scenery
	
	to.block_repeat_enable = block_repeat_enable
	to.block_repeat = array_copy_1d(block_repeat)
	
	to.block_randomize = block_randomize
	
	to.shape_tex = shape_tex
	to.shape_tex_material = shape_tex_material
	to.shape_tex_normal = shape_tex_normal
	to.shape_tex_mapped = shape_tex_mapped
	to.shape_tex_hoffset = shape_tex_hoffset
	to.shape_tex_voffset = shape_tex_voffset
	to.shape_tex_hrepeat = shape_tex_hrepeat
	to.shape_tex_vrepeat = shape_tex_vrepeat
	to.shape_tex_hmirror = shape_tex_hmirror
	to.shape_tex_vmirror = shape_tex_vmirror
	to.shape_closed = shape_closed
	to.shape_invert = shape_invert
	to.shape_smooth = shape_smooth
	to.shape_detail = shape_detail
	to.shape_face_camera = shape_face_camera
	
	to.text_font = text_font
	to.text_3d = text_3d
	to.text_face_camera = text_face_camera
	
	if (type = e_temp_type.PARTICLE_SPAWNER)
		temp_particles_copy(to)
}
