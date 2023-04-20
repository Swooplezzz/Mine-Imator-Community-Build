/// particle_spawner_spawn(type)
/// @arg type
/// @desc Adds a new particle to the spawner's list.

function particle_spawner_spawn(type)
{
	var pt, temp;
	pt = new_obj(obj_particle)
	pt.creator = id
	pt.type = type
	pt.spawntime = spawn_currentstep
	pt.frame = 0
	pt.time = 0
	pt.freezetime = 0
	
	if (is_timeline)
		temp = id.temp
	else
		temp = select
	
	// Get seed for generating particle values
	var base_seed = 0;
	
	if (is_timeline && pt.creator.value[e_value.CUSTOM_SEED])
		base_seed = (temp.pc_spawn_constant ? ds_list_size(particle_list) : pt.creator.single_fire_count) + pt.creator.value[e_value.SEED]
	else
	{
		randomize()
		base_seed = random(spawn_currentstep + ds_list_size(particle_list))
	}
	
	random_set_seed(base_seed)
	
	// Random frame(Sprite template)
	if (pt.type.sprite_template_still_frame && pt.type.sprite_template_random_frame && pt.type.temp = particle_template)
	{
		var template = particle_template_map[?pt.type.sprite_template];
		pt.frame = random(template.frames)
	}
	
	pt.time_to_live = value_random(temp.pc_destroy_at_time_seconds, temp.pc_destroy_at_time_israndom, temp.pc_destroy_at_time_random_min, temp.pc_destroy_at_time_random_max) * 60
	
	// Position
	pt.pos[X] = world_pos[X]
	pt.pos[Y] = world_pos[Y]
	pt.pos[Z] = world_pos[Z]
	if (temp.pc_spawn_region_use && type.spawn_region)
	{
		switch (temp.pc_spawn_region_type)
		{
			case "sphere":
			{
				var xyang, zang, dis;
				xyang = random(360)
				zang = random_range(-180, 180)
				dis = random_range(-temp.pc_spawn_region_sphere_radius, temp.pc_spawn_region_sphere_radius)
				pt.pos[X] += lengthdir_x(dis, xyang) * lengthdir_x(1, zang)
				pt.pos[Y] += lengthdir_y(dis, xyang) * lengthdir_x(1, zang)
				pt.pos[Z] += lengthdir_z(dis, zang)
				break
			}
			
			case "cube":
			{
				pt.pos[X] += random_range(-temp.pc_spawn_region_cube_size / 2, temp.pc_spawn_region_cube_size / 2)
				pt.pos[Y] += random_range(-temp.pc_spawn_region_cube_size / 2, temp.pc_spawn_region_cube_size / 2)
				pt.pos[Z] += random_range(-temp.pc_spawn_region_cube_size / 2, temp.pc_spawn_region_cube_size / 2)
				break
			}
			
			case "box":
			{
				pt.pos[X] += random_range(-temp.pc_spawn_region_box_size[X] / 2, temp.pc_spawn_region_box_size[X] / 2)
				pt.pos[Y] += random_range(-temp.pc_spawn_region_box_size[Y] / 2, temp.pc_spawn_region_box_size[Y] / 2)
				pt.pos[Z] += random_range(-temp.pc_spawn_region_box_size[Z] / 2, temp.pc_spawn_region_box_size[Z] / 2)
				break
			}
			
			case "path":
			{
				if (temp.pc_spawn_region_path != null)
				{
					var t, p, tangent, normal, angle;
					
					if (temp.pc_spawn_constant)
						t = random_range(0, array_length(temp.pc_spawn_region_path.path_table_matrix))
					else
						t = mod_fix(ds_list_size(particle_list) / temp.pc_spawn_amount, 1) * array_length(temp.pc_spawn_region_path.path_table_matrix)
					
					p = spline_get_point(t, temp.pc_spawn_region_path.path_table_matrix, temp.pc_spawn_region_path.path_closed, temp.pc_spawn_region_path.path_smooth)
					
					// Get tangent/normal from point
					tangent = [p[PATH_TANGENT_X], p[PATH_TANGENT_Y], p[PATH_TANGENT_Z]]
					normal = [p[PATH_NORMAL_X], p[PATH_NORMAL_Y], p[PATH_NORMAL_Z]]
					
					// Rotate around normal and add
					angle = vec3_rotate_axis_angle(normal, tangent, degtorad(random(360)))
					p = point3D_add(p, point3D_mul(angle, temp.pc_spawn_region_path_radius))
					
					pt.pos[X] = p[X]
					pt.pos[Y] = p[Y]
					pt.pos[Z] = p[Z]
				}
				break
			}
		}
	}
	
	// Animation
	pt.anispeed = value_random(type.sprite_animation_speed, type.sprite_animation_speed_israndom, type.sprite_animation_speed_random_min, type.sprite_animation_speed_random_max)
	
	for (var a = X; a <= Z; a++)
	{
		// Angle
		pt.angle[a] = value_random(type.angle[a * type.angle_extend], type.angle_israndom[a * type.angle_extend], type.angle_random_min[a * type.angle_extend], type.angle_random_max[a * type.angle_extend])
		
		// Speed
		pt.spd[a] = value_random(type.spd[a * type.spd_extend], type.spd_israndom[a * type.spd_extend], type.spd_random_min[a * type.spd_extend], type.spd_random_max[a * type.spd_extend]) / 60
		pt.spd_add[a] = value_random(type.spd_add[a * type.spd_extend], type.spd_add_israndom[a * type.spd_extend], type.spd_add_random_min[a * type.spd_extend], type.spd_add_random_max[a * type.spd_extend]) / 60
		pt.spd_mul[a] = value_random(type.spd_mul[a * type.spd_extend], type.spd_mul_israndom[a * type.spd_extend], type.spd_mul_random_min[a * type.spd_extend], type.spd_mul_random_max[a * type.spd_extend])
		if (pt.spd_mul[a] != 1)
			repeat (5)
				pt.spd_mul[a] = sqrt(pt.spd_mul[a])
		
		// Rotation
		pt.rot[a] = value_random(type.rot[a * type.rot_extend], type.rot_israndom[a * type.rot_extend], type.rot_random_min[a * type.rot_extend], type.rot_random_max[a * type.rot_extend])
		pt.rot_spd[a] = value_random(type.rot_spd[a * type.rot_spd_extend], type.rot_spd_israndom[a * type.rot_spd_extend], type.rot_spd_random_min[a * type.rot_spd_extend], type.rot_spd_random_max[a * type.rot_spd_extend]) / 60
		pt.rot_spd_add[a] = value_random(type.rot_spd_add[a * type.rot_spd_extend], type.rot_spd_add_israndom[a * type.rot_spd_extend], type.rot_spd_add_random_min[a * type.rot_spd_extend], type.rot_spd_add_random_max[a * type.rot_spd_extend]) / 60
		pt.rot_spd_mul[a] = value_random(type.rot_spd_mul[a * type.rot_spd_extend], type.rot_spd_mul_israndom[a * type.rot_spd_extend], type.rot_spd_mul_random_min[a * type.rot_spd_extend], type.rot_spd_mul_random_max[a * type.rot_spd_extend])
		if (pt.rot_spd_mul[a] != 1)
			repeat (5)
				pt.rot_spd_mul[a] = sqrt(pt.rot_spd_mul[a])
	}
	
	// Convert angle to vector
	pt.angle = vec3_normalize(vec3_mul_matrix(vec3(0, 0, 1), matrix_create(vec3(0), pt.angle, vec3(1))))
	
	// Rotate angle
	if (is_timeline)
	{
		pt.angle = vec3_mul_matrix(pt.angle, pt.creator.matrix_render)
		pt.angle = vec3_normalize(pt.angle)
	}
	
	// Angle strength
	pt.angle_speed = value_random(type.angle_speed, type.angle_speed_israndom, type.angle_speed_random_min, type.angle_speed_random_max) / 60
	pt.angle_speed_add = value_random(type.angle_speed_add, type.angle_speed_add_israndom, type.angle_speed_add_random_min, type.angle_speed_add_random_max) / 60
	pt.angle_speed_mul = value_random(type.angle_speed_mul, type.angle_speed_mul_israndom, type.angle_speed_mul_random_min, type.angle_speed_mul_random_max)
	if (pt.angle_speed_mul != 1)
		repeat (5)
			pt.angle_speed_mul = sqrt(pt.angle_speed_mul)
	
	// Sprite angle
	pt.sprite_angle = value_random(type.sprite_angle, type.sprite_angle_israndom, type.sprite_angle_random_min, type.sprite_angle_random_max)
	pt.sprite_angle_add = value_random(type.sprite_angle_add, type.sprite_angle_add_israndom, type.sprite_angle_add_random_min, type.sprite_angle_add_random_max) / 60
	
	// Scale
	pt.scale = value_random(type.scale, type.scale_israndom, type.scale_random_min, type.scale_random_max)
	pt.scale_add = value_random(type.scale_add, type.scale_add_israndom, type.scale_add_random_min, type.scale_add_random_max) / 60
	
	// Alpha
	pt.alpha = value_random(type.alpha, type.alpha_israndom, type.alpha_random_min, type.alpha_random_max)
	pt.alpha_add = value_random(type.alpha_add, type.alpha_add_israndom, type.alpha_add_random_min, type.alpha_add_random_max) / 60
	
	// Color
	if (type.color_israndom)
		pt.color = merge_color(type.color_random_start, type.color_random_end, random(1))
	else
		pt.color = type.color
	
	// Color mix
	if (type.color_mix_enabled)
	{
		if (type.color_mix_israndom)
			pt.color_mix = merge_color(type.color_mix_random_start, type.color_mix_random_end, random(1))
		else
			pt.color_mix = type.color_mix
		pt.color_mix_start = pt.color
		pt.color_mix_time = max(1, value_random(type.color_mix_time, type.color_mix_time_israndom, type.color_mix_time_random_min, type.color_mix_time_random_max) * 60)
	}
	else
	{
		pt.color_mix = -1
		pt.color_mix_start = -1
		pt.color_mix_time = 0
	}
	
	
	ds_list_add(particle_list, pt)
}
