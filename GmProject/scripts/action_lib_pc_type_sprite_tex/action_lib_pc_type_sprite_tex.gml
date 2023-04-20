/// action_lib_pc_type_sprite_tex(resource)
/// @arg resource

function action_lib_pc_type_sprite_tex(res)
{
	var fn;
	fn = ""
	
	if (history_undo)
		res = history_undo_res()
	else if (history_redo)
		res = history_redo_res()
	else
	{
		if (res = e_option.BROWSE)
		{
			fn = file_dialog_open_image_pack()
			
			if (!file_exists_lib(fn))
				return 0
			
			res = new_res(fn, e_res_type.PARTICLE_SHEET)
			with (res)
				res_load()
		}
		
		history_set_res(action_lib_pc_type_sprite_tex, fn, ptype_edit.sprite_tex, res)
	}
	
	with (ptype_edit)
	{
		sprite_tex.count--
		sprite_tex = res
		sprite_tex.count++
		ptype_update_sprite_vbuffers()
	}
	
	tab_template_editor_particles_preview_restart()
}
