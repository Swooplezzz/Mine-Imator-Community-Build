/// ptype_find_save_ids()

function ptype_find_save_ids()
{
	creator = save_id_find(creator)
	
	if (temp != particle_sheet && temp != particle_template)
		temp = save_id_find(temp)
	
	sprite_tex = save_id_find(sprite_tex)
	sprite_template_tex = save_id_find(sprite_template_tex)
}
