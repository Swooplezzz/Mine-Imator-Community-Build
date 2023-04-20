/// particle_spawner_init()
/// @desc Creates the variables necessary for spawning particles.

function particle_spawner_init()
{
	spawn_queue_amount[minute_steps] = 0
	spawn_queue[minute_steps, 0] = 0
	spawn_queue_start = null
	spawn_currentstep = current_step
	spawn_laststep = current_step
	spawn_active = true
	fire = false
	single_fire_count = 0
	
	particle_list = ds_list_create()
	is_timeline = (object_index = obj_timeline)
}
