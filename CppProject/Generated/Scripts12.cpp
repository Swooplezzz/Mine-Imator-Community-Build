/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.11.15 18:00:31 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_tl_inherit_select(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(inherit_select) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(update_matrix) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
					{
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						{
							sVar(inherit_select) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(update_matrix) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_inherit_select, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->inherit_select, enable);
					
					self->inherit_select = enable;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
	}
	
	void action_tl_inherit_subsurface(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(inherit_subsurface) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(update_matrix) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
					{
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						{
							sVar(inherit_subsurface) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(update_matrix) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_inherit_subsurface, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->inherit_subsurface, enable);
					
					self->inherit_subsurface = enable;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
	}
	
	void action_tl_inherit_surface(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(inherit_surface) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(update_matrix) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
					{
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						{
							sVar(inherit_surface) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(update_matrix) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_inherit_surface, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->inherit_surface, enable);
					
					self->inherit_surface = enable;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
	}
	
	void action_tl_inherit_texture(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(inherit_texture) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(update_matrix) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
					{
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						{
							sVar(inherit_texture) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(update_matrix) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_inherit_texture, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->inherit_texture, enable);
					
					self->inherit_texture = enable;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
	}
	
	void action_tl_inherit_visibility(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(inherit_visibility) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(update_matrix) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
					{
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						{
							sVar(inherit_visibility) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(update_matrix) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_inherit_visibility, false);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->inherit_visibility, enable);
					
					self->inherit_visibility = enable;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
	}
	
	void action_tl_intervals_show(ScopeAny self)
	{
		sInt(project_changed) = true;
		sVar(timeline_intervals_show) = !(sVar(timeline_intervals_show) > 0);
	}
	
	void action_tl_interval_offset(ScopeAny self, VarType val, VarType add)
	{
		sInt(project_changed) = true;
		sVar(timeline_interval_offset) = sVar(timeline_interval_offset) * add + val;
	}
	
	void action_tl_interval_size(ScopeAny self, VarType val, VarType add)
	{
		sInt(project_changed) = true;
		sVar(timeline_interval_size) = sVar(timeline_interval_size) * add + val;
	}
	
	void action_tl_keyframes_create(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, global::_app->id)
			{
				for (IntType t = IntType(0); t < self->tl_create_amount; t++)
				{
					withOne (Object, save_id_find(self->tl_create_save_id.Value(t)), self->id)
					{
						withOne (obj_keyframe, DsList(sInt(keyframe_list)).Value(ObjType(obj_history, self.otherId)->tl_create_index.Value(t)), self->id)
							instance_destroy(ScopeAny(self));
						
						tl_update_values(self);
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, global::_app->id)
				{
					for (IntType t = IntType(0); t < self->tl_create_amount; t++)
					{
						withOne (Object, save_id_find(self->tl_create_save_id.Value(t)), self->id)
						{
							tl_keyframe_add(self, ObjType(obj_history, self.otherId)->marker_pos);
							tl_update_values(self);
						}
						
					}
				}
				
			}
			else
			{
				IntType hobj = history_set(self, ID_action_tl_keyframes_create);
				withOne (obj_history, hobj, global::_app->id)
				{
					self->marker_pos = global::_app->timeline_marker;
					self->tl_create_amount = IntType(0);
				}
				
				withAll (obj_timeline, global::_app->id)
				{
					if (!(self->selected > 0) || (self->keyframe_current > 0 && ObjType(obj_keyframe, self->keyframe_current)->position == global::_app->timeline_marker))
						continue;
					IntType kf = tl_keyframe_add(ScopeAny(self), global::_app->timeline_marker);
					ObjType(obj_history, hobj)->tl_create_save_id[ObjType(obj_history, hobj)->tl_create_amount] = self->save_id;
					ObjType(obj_history, hobj)->tl_create_index[ObjType(obj_history, hobj)->tl_create_amount] = ds_list_find_index(self->keyframe_list, kf);
					ObjType(obj_history, hobj)->tl_create_amount++;
					self->update_matrix = true;
				}
				
			}
		
		
		tl_update_matrix(self);
		tl_update_length();
		app_update_tl_edit(self);
	}
	
	void action_tl_keyframes_cut(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				history_restore_keyframes(self);
				history_restore_tl_select(self);
			}
			
		}
		else
		{
			if (!(sReal(history_redo) > 0))
			{
				withOne (obj_history, history_set(self, ID_action_tl_keyframes_cut), self->id)
				{
					history_save_keyframes(self);
					history_save_tl_select(ScopeAny(self));
				}
				
				tl_keyframes_copy(self);
			}
			tl_keyframes_remove();
		}
		
		withAll (obj_timeline, self->id)
			tl_update_values(ScopeAny(self));
		
		tl_update_matrix(self);
		tl_update_length();
		app_update_tl_edit(self);
	}
	
	RealType action_tl_keyframes_load(ScopeAny self, VarType fn)
	{
		if (sReal(history_undo) > 0)
		{
			tl_keyframes_remove();
			withOne (obj_history, global::history_data, self->id)
			{
				history_destroy_loaded(self);
				history_restore_tl_select(self);
			}
			
			tl_update_list(self);
			withAll (obj_timeline, self->id)
				tl_update_values(ScopeAny(self));
			
			tl_update_matrix(self);
		}
		else
		{
			VarType insertpos;
			IntType hobj, tladd;
			hobj = null_;
			if (sReal(history_redo) > 0)
			{
				fn = ObjType(obj_history, global::history_data)->filename;
				insertpos = ObjType(obj_history, global::history_data)->insert_pos;
				if (!file_exists_lib(fn))
					return IntType(0);
			}
			else
			{
				if (!file_exists_lib(fn))
					return IntType(0);
				if (!(global::tl_edit > 0))
				{
					error(/*"erroropenkeyframes"*/ STR(36));
					return IntType(0);
				}
				insertpos = sVar(timeline_insert_pos);
				hobj = history_set(self, ID_action_tl_keyframes_load);
				withOne (obj_history, hobj, self->id)
				{
					self->filename = fn;
					ObjType(obj_history, self->id)->insert_pos = insertpos;
					history_save_tl_select(ScopeAny(self));
				}
				
			}
			
			tladd = global::tl_edit;
			tl_deselect_all();
			action_tl_keyframes_load_file(self, fn, tladd, insertpos, null_);
			project_load_update(self);
			withOne (obj_history, hobj, self->id)
				history_save_loaded(self);
			
			project_reset_loaded(self);
		}
		
		app_update_tl_edit(self);
		return 0.0;
	}
	
	VarType action_tl_keyframes_load_file(ScopeAny self, VarType fn, VarType tl, VarType insertpos, VarType maxlen)
	{
		IntType rootmap;
		BoolType legacy;
		if (string_contains(filename_ext(fn), /*".miframes"*/ STR(37)))
		{
			log({ /*"Opening keyframes"*/ STR(38), fn });
			rootmap = project_load_start(fn);
			if (rootmap == null_)
				return false;
			legacy = false;
		}
		else
		{
			log({ /*"Opening legacy keyframes"*/ STR(39), fn });
			if (!project_load_legacy_start(fn))
				return false;
			legacy = true;
		}
		
		project_reset_loaded(self);
		global::save_folder = sStr(project_folder);
		global::load_folder = filename_dir(fn);
		VarType ismodel, tempo, len, kflist;
		RealType temposcale, num;
		IntType dummy;
		if (!legacy)
		{
			ismodel = value_get_real(DsMap(rootmap).Value(/*"is_model"*/ STR(40)), false);
			tempo = value_get_real(DsMap(rootmap).Value(/*"tempo"*/ STR(41)), sVar(project_tempo));
			temposcale = ((RealType)sVar(project_tempo) / tempo);
			kflist = DsMap(rootmap).Value(/*"keyframes"*/ STR(42));
			if (ds_list_valid(kflist))
				num = ds_list_size((IntType)(kflist));
			else
				num = IntType(0);
			
			len = value_get_real(DsMap(rootmap).Value(/*"length"*/ STR(43)), IntType(0));
		}
		else
		{
			ismodel = buffer_read_byte();
			tempo = buffer_read_byte();
			temposcale = ((RealType)sVar(project_tempo) / tempo);
			num = buffer_read_int();
			len = buffer_read_int();
			dummy = (new obj_data)->id;
		}
		
		len = max({ IntType(1), round(temposcale * len) });
		if (ismodel > 0 && idVar(tl, part_of) != null_)
			tl = idVar(tl, part_of);
		for (IntType k = IntType(0); k < num; k++)
		{
			RealType pos;
			VarType partname, kfcurmap, tladd;
			partname = /*""*/ STR(0);
			tladd = tl;
			if (!legacy)
			{
				kfcurmap = DsList(kflist).Value(k);
				pos = round(temposcale * value_get_real(DsMap(kfcurmap).Value(/*"position"*/ STR(44)), IntType(0)));
				if (!is_undefined(DsMap(kfcurmap).Value(/*"part_name"*/ STR(45))))
					partname = DsMap(kfcurmap).Value(/*"part_name"*/ STR(45));
			}
			else
			{
				pos = round(temposcale * buffer_read_int());
				RealType bp = buffer_read_int();
				withOne (obj_data, dummy, self->id)
					project_load_legacy_value_types(ScopeAny(self));
				
				if (bp != null_)
				{
					VarType modelpartlist = DsMap(global::legacy_model_part_map).Value(idVar(idVar(tl, temp), model_name));
					if (!is_undefined(modelpartlist) && bp < ds_list_size((IntType)(modelpartlist)))
						partname = DsList(modelpartlist).Value(bp);
					else
						tladd = null_;
					
				}
			}
			
			if (ismodel > 0 && partname != /*""*/ STR(0))
				withOne (Object, tl, self->id)
					tladd = tl_part_find(self, partname);
			
			if (maxlen != null_ && pos > maxlen - tempo * 0.2)
				tladd = null_;
			if (tladd != null_)
			{
				IntType newkf = (new obj_keyframe)->id;
				withOne (obj_keyframe, newkf, self->id)
				{
					self->loaded = true;
					self->selected = false;
					for (IntType v = IntType(0); v < e_value_amount; v++)
						self->value[v] = idArr(tladd, value_default).Value(v);
					if (!legacy)
						project_load_values(DsMap(kfcurmap).Value(/*"values"*/ STR(46)), VarType::CreateRef(self->value));
					else
						project_load_legacy_values(ScopeAny(self), dummy);
					
					if (global::load_format < e_project_FORMAT_113 && idVar(tladd, model_part) != null_ && idInt(idVar(tladd, model_part), bend_part) != null_)
					{
						IntType legacyaxis;
						for (legacyaxis = X_; legacyaxis <= Z_; legacyaxis++)
							if (idVec(idVar(tladd, model_part), bend_axis).Real(legacyaxis))
								break;
						self->value[e_value_BEND_ANGLE_X + legacyaxis] = self->value.Value(e_value_BEND_ANGLE_LEGACY);
						self->value[e_value_BEND_ANGLE_LEGACY] = IntType(0);
					}
					if (self->value.Value(e_value_ITEM_NAME) != /*""*/ STR(0))
						self->value[e_value_ITEM_SLOT] = ds_list_find_index((IntType)(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list), self->value.Value(e_value_ITEM_NAME));
					if (self->value.Value(e_value_ITEM_SLOT) < IntType(0))
						self->value[e_value_ITEM_SLOT] = ds_list_find_index((IntType)(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list), default_item);
				}
				
				withOne (Object, tladd, self->id)
					tl_keyframe_add(self, insertpos + pos, newkf);
				
				tl_keyframe_select(newkf);
			}
			else
				if (legacy)
					withOne (obj_data, dummy, self->id)
						project_load_legacy_values(ScopeAny(self), self->id);
			
			
		}
		if (!legacy)
			project_load_objects(rootmap);
		else
		{
			project_load_legacy_objects();
			withOne (obj_data, dummy, self->id)
				instance_destroy(ScopeAny(self));
			
			buffer_delete(global::buffer_current);
		}
		
		project_load_find_save_ids(self);
		log({ /*"Loaded "*/ STR(47) + string(num) + /*" keyframes"*/ STR(48) });
		return insertpos + len;
	}
	
	void action_tl_keyframes_move(ScopeAny self)
	{
		RealType movex;
		BoolType moved;
		movex = sVar(timeline_mouse_pos) - sVar(timeline_move_kf_mouse_pos);
		moved = false;
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0))
				continue;
			self->new_position = max({ IntType(0), self->move_pos + movex });
			if (self->position == self->new_position)
				continue;
			ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
		}
		
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0) || self->position == self->new_position)
				continue;
			moved = true;
			withOne (Object, self->timeline, self->id)
			{
				tl_keyframe_add(self, ObjType(obj_keyframe, self.otherId)->new_position, self.otherId);
				sBool(update_matrix) = true;
			}
			
		}
		
		if (moved)
		{
			if (idVar(ObjType(obj_keyframe, sInt(timeline_move_kf))->timeline, type) == e_tl_type_AUDIO && ObjType(obj_keyframe, sInt(timeline_move_kf))->value.Value(e_value_SOUND_OBJ) > 0)
				sVar(timeline_marker) = sVar(timeline_mouse_pos);
			else
				sVar(timeline_marker) = ObjType(obj_keyframe, sInt(timeline_move_kf))->position;
			
		}
	}
	
	void action_tl_keyframes_move_done(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				ArrType newindex = array_copy_1d(self->kf_move_new_index);
				for (IntType k = IntType(0); k < self->kf_move_amount; k++)
				{
					withOne (obj_keyframe, DsList(idInt(save_id_find(self->kf_move_tl_save_id.Value(k)), keyframe_list)).Value(newindex.Value(k)), self->id)
					{
						self->new_position = ObjType(obj_history, self.otherId)->kf_move_old_pos.Value(k);
						if (self->position == self->new_position)
							continue;
						IntType index = ds_list_find_index(idInt(self->timeline, keyframe_list), self->id);
						ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
						for (IntType a = IntType(0); a < ObjType(obj_history, self.otherId)->kf_move_amount; a++)
							if (save_id_find(ObjType(obj_history, self.otherId)->kf_move_tl_save_id.Value(a)) == self->timeline && newindex.Value(a) > index)
								newindex[a]--;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					ArrType oldindex = array_copy_1d(self->kf_move_old_index);
					for (IntType k = IntType(0); k < self->kf_move_amount; k++)
					{
						withOne (obj_keyframe, DsList(idInt(save_id_find(self->kf_move_tl_save_id.Value(k)), keyframe_list)).Value(oldindex.Value(k)), self->id)
						{
							self->new_position = ObjType(obj_history, self.otherId)->kf_move_new_pos.Value(k);
							if (self->position == self->new_position)
								continue;
							IntType index = ds_list_find_index(idInt(self->timeline, keyframe_list), self->id);
							ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
							for (IntType a = IntType(0); a < ObjType(obj_history, self.otherId)->kf_move_amount; a++)
								if (save_id_find(ObjType(obj_history, self.otherId)->kf_move_tl_save_id.Value(a)) == self->timeline && oldindex.Value(a) > index)
									oldindex[a]--;
						}
						
					}
				}
				
			}
			else
			{
				withOne (obj_history, history_set(self, ID_action_tl_keyframes_move_done), self->id)
				{
					self->kf_move_amount = IntType(0);
					withAll (obj_keyframe, self->id)
					{
						if (!(self->selected > 0))
							continue;
						ObjType(obj_history, self.otherId)->kf_move_tl_save_id[ObjType(obj_history, self.otherId)->kf_move_amount] = save_id_get(self->timeline);
						ObjType(obj_history, self.otherId)->kf_move_old_index[ObjType(obj_history, self.otherId)->kf_move_amount] = self->move_index;
						ObjType(obj_history, self.otherId)->kf_move_old_pos[ObjType(obj_history, self.otherId)->kf_move_amount] = self->move_pos;
						ObjType(obj_history, self.otherId)->kf_move_new_index[ObjType(obj_history, self.otherId)->kf_move_amount] = ds_list_find_index(idInt(self->timeline, keyframe_list), self->id);
						ObjType(obj_history, self.otherId)->kf_move_new_pos[ObjType(obj_history, self.otherId)->kf_move_amount] = self->position;
						ObjType(obj_history, self.otherId)->kf_move_amount++;
					}
					
				}
				
				sVar(window_busy) = /*""*/ STR(0);
			}
		
		
		if (sReal(history_undo) > 0 || sReal(history_redo) > 0)
		{
			withAll (obj_keyframe, self->id)
			{
				if (!(self->selected > 0) || self->position == self->new_position)
					continue;
				withOne (Object, self->timeline, self->id)
				{
					tl_keyframe_add(self, ObjType(obj_keyframe, self.otherId)->new_position, self.otherId);
					sBool(update_matrix) = true;
				}
				
			}
			
		}
		tl_update_length();
	}
	
	void action_tl_keyframes_move_start(ScopeAny self, IntType keyframe)
	{
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0))
				continue;
			self->move_index = ds_list_find_index(idInt(self->timeline, keyframe_list), self->id);
			self->move_pos = self->position;
		}
		
		sInt(timeline_move_kf) = keyframe;
		sVar(timeline_move_kf_mouse_pos) = sVar(timeline_mouse_pos);
		sVar(window_busy) = /*"timelinemovekeyframes"*/ STR(49);
	}
	
	void action_tl_keyframes_paste(ScopeAny self, VarType position)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				tl_keyframes_remove();
				history_restore_tl_select(self);
			}
			
		}
		else
		{
			VarType pos;
			if (sReal(history_redo) > 0)
			{
				pos = ObjType(obj_history, global::history_data)->paste_pos;
				sInt(copy_kf_amount) = ObjType(obj_history, global::history_data)->copy_kf_amount;
				sArr(copy_kf_tl_save_id) = array_copy_1d(ObjType(obj_history, global::history_data)->copy_kf_tl_save_id);
				sArr(copy_kf_pos) = array_copy_1d(ObjType(obj_history, global::history_data)->copy_kf_pos);
				sArr(copy_kf_value) = array_copy_2d(ObjType(obj_history, global::history_data)->copy_kf_value);
				sArr(copy_kf_tl_part_of_save_id) = array_copy_1d(ObjType(obj_history, global::history_data)->copy_kf_tl_part_of_save_id);
				sArr(copy_kf_tl_model_part_name) = array_copy_1d(ObjType(obj_history, global::history_data)->copy_kf_tl_model_part_name);
			}
			else
			{
				pos = position;
				withOne (obj_history, history_set(self, ID_action_tl_keyframes_paste), self->id)
				{
					self->paste_pos = pos;
					self->copy_kf_amount = global::_app->copy_kf_amount;
					self->copy_kf_tl_save_id = array_copy_1d(global::_app->copy_kf_tl_save_id);
					self->copy_kf_pos = array_copy_1d(global::_app->copy_kf_pos);
					self->copy_kf_value = array_copy_2d(global::_app->copy_kf_value);
					self->copy_kf_tl_part_of_save_id = array_copy_1d(global::_app->copy_kf_tl_part_of_save_id);
					self->copy_kf_tl_model_part_name = array_copy_1d(global::_app->copy_kf_tl_model_part_name);
					history_save_tl_select(ScopeAny(self));
				}
				
			}
			
			tl_keyframes_paste(self, pos);
		}
		
		withAll (obj_timeline, self->id)
			tl_update_values(ScopeAny(self));
		
		tl_update_matrix(self);
		tl_update_length();
		app_update_tl_edit(self);
	}
	
	void action_tl_keyframes_remove(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				history_restore_keyframes(self);
				history_restore_tl_select(self);
			}
			
		}
		else
		{
			if (!(sReal(history_redo) > 0))
			{
				withOne (obj_history, history_set(self, ID_action_tl_keyframes_remove), self->id)
				{
					history_save_keyframes(self);
					history_save_tl_select(ScopeAny(self));
				}
				
			}
			tl_keyframes_remove();
		}
		
		withAll (obj_timeline, self->id)
			tl_update_values(ScopeAny(self));
		
		tl_update_matrix(self);
		tl_update_length();
		app_update_tl_edit(self);
	}
	
	void action_tl_keyframes_select_area(ScopeAny self, RealType stl, RealType etl, RealType spos, RealType epos)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				history_restore_tl_select(self);
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					history_restore_tl_select_new(self);
				
			}
			else
			{
				IntType hobj;
				BoolType ctrl;
				hobj = history_set(self, ID_action_tl_keyframes_select_area);
				ctrl = keyboard_check(vk_control);
				withOne (obj_history, hobj, self->id)
					history_save_tl_select(ScopeAny(self));
				
				for (RealType t = stl; t <= etl; t++)
				{
					VarType tl = DsList(sInt(tree_visible_list)).Value(t);
					if (idVar(tl, lock) > 0)
						continue;
					for (IntType k = IntType(0); k < ds_list_size(idInt(tl, keyframe_list)); k++)
					{
						IntType kf;
						RealType len;
						kf = DsList(idInt(tl, keyframe_list)).Value(k);
						len = tl_keyframe_length(kf);
						if ((!ctrl && ObjType(obj_keyframe, kf)->selected > 0) || ObjType(obj_keyframe, kf)->position + len < spos)
							continue;
						if (ObjType(obj_keyframe, kf)->position > epos)
							break;
						if (ctrl)
							tl_keyframe_deselect(kf);
						else
							tl_keyframe_select(kf);
						
					}
				}
				withOne (obj_history, hobj, self->id)
					history_save_tl_select_new(ScopeAny(self));
				
			}
		
		
		app_update_tl_edit(self);
	}
	
	void action_tl_keyframes_sound_resize(ScopeAny self)
	{
		RealType movex = sVar(timeline_mouse_pos) - sVar(timeline_sound_resize_mouse_pos);
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0) || self->sound_resize_index < IntType(0))
				continue;
			self->new_position = max({ IntType(0), self->sound_resize_pos + movex });
			self->new_start = self->sound_resize_start + movex / global::_app->project_tempo;
			if (self->new_start < IntType(0) || self->position == self->new_position)
				continue;
			ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
		}
		
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0) || self->sound_resize_index < IntType(0) || self->new_start < IntType(0) || self->position == self->new_position)
				continue;
			self->value[e_value_SOUND_START] = self->new_start;
			withOne (Object, self->timeline, self->id)
			{
				tl_keyframe_add(self, ObjType(obj_keyframe, self.otherId)->new_position, self.otherId);
				sBool(update_matrix) = true;
			}
			
		}
		
	}
	
	void action_tl_keyframes_sound_resize_done(ScopeAny self)
	{
		withAll (obj_timeline, self->id)
			self->update_values = false;
		
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType k = IntType(0); k < self->kf_resize_amount; k++)
				{
					withOne (obj_keyframe, DsList(idInt(save_id_find(self->kf_resize_tl_save_id.Value(k)), keyframe_list)).Value(sArr(kf_resize_new_index).Value(k)), self->id)
					{
						self->new_position = ObjType(obj_history, self.otherId)->kf_resize_old_pos.Value(k);
						if (self->position == self->new_position)
							continue;
						self->value[e_value_SOUND_START] = ObjType(obj_history, self.otherId)->kf_resize_old_start.Value(k);
						for (IntType a = IntType(0); a < ObjType(obj_history, self.otherId)->kf_resize_amount; a++)
							if (save_id_find(ObjType(obj_history, self.otherId)->kf_resize_tl_save_id.Value(a)) == self->timeline && ObjType(obj_history, self.otherId)->kf_resize_new_index.Value(a) > ds_list_find_index(idInt(self->timeline, keyframe_list), self->id))
								ObjType(obj_history, self.otherId)->kf_resize_new_index[a]--;
						ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
						idBool(self->timeline, update_values) = true;
					}
					
				}
			}
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
				{
					for (IntType k = IntType(0); k < self->kf_resize_amount; k++)
					{
						withOne (obj_keyframe, DsList(idInt(save_id_find(self->kf_resize_tl_save_id.Value(k)), keyframe_list)).Value(sArr(kf_resize_old_index).Value(k)), self->id)
						{
							self->new_position = ObjType(obj_history, self.otherId)->kf_resize_new_pos.Value(k);
							if (self->position == self->new_position)
								continue;
							self->value[e_value_SOUND_START] = ObjType(obj_history, self.otherId)->kf_resize_new_start.Value(k);
							for (IntType a = IntType(0); a < ObjType(obj_history, self.otherId)->kf_resize_amount; a++)
								if (save_id_find(ObjType(obj_history, self.otherId)->kf_resize_tl_save_id.Value(a)) == self->timeline && ObjType(obj_history, self.otherId)->kf_resize_old_index.Value(a) > ds_list_find_index(idInt(self->timeline, keyframe_list), self->id))
									ObjType(obj_history, self.otherId)->kf_resize_old_index[a]--;
							ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
							idBool(self->timeline, update_values) = true;
						}
						
					}
				}
				
			}
			else
			{
				withOne (obj_history, history_set(self, ID_action_tl_keyframes_sound_resize_done), self->id)
				{
					self->kf_resize_amount = IntType(0);
					withAll (obj_keyframe, self->id)
					{
						if (!(self->selected > 0) || self->sound_resize_index < IntType(0))
							continue;
						ObjType(obj_history, self.otherId)->kf_resize_tl_save_id[ObjType(obj_history, self.otherId)->kf_resize_amount] = save_id_get(self->timeline);
						ObjType(obj_history, self.otherId)->kf_resize_old_index[ObjType(obj_history, self.otherId)->kf_resize_amount] = self->sound_resize_index;
						ObjType(obj_history, self.otherId)->kf_resize_old_pos[ObjType(obj_history, self.otherId)->kf_resize_amount] = self->sound_resize_pos;
						ObjType(obj_history, self.otherId)->kf_resize_old_start[ObjType(obj_history, self.otherId)->kf_resize_amount] = self->sound_resize_start;
						ObjType(obj_history, self.otherId)->kf_resize_new_index[ObjType(obj_history, self.otherId)->kf_resize_amount] = ds_list_find_index(idInt(self->timeline, keyframe_list), self->id);
						ObjType(obj_history, self.otherId)->kf_resize_new_pos[ObjType(obj_history, self.otherId)->kf_resize_amount] = self->position;
						ObjType(obj_history, self.otherId)->kf_resize_new_start[ObjType(obj_history, self.otherId)->kf_resize_amount] = self->value.Value(e_value_SOUND_START);
						ObjType(obj_history, self.otherId)->kf_resize_amount++;
						idBool(self->timeline, update_values) = true;
					}
					
				}
				
				sVar(window_busy) = /*""*/ STR(0);
			}
		
		
		if (sReal(history_undo) > 0 || sReal(history_redo) > 0)
		{
			withAll (obj_keyframe, self->id)
			{
				if (!(self->selected > 0) || self->position == self->new_position)
					continue;
				withOne (Object, self->timeline, self->id)
					tl_keyframe_add(self, ObjType(obj_keyframe, self.otherId)->new_position, self.otherId);
				
			}
			
		}
		tl_update_length();
		withAll (obj_timeline, self->id)
			if (self->update_values)
				tl_update_values(ScopeAny(self));
		
	}
	
}
