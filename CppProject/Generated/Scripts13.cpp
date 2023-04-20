/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.03.04 17:45:23 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_tl_name(ScopeAny self, VarType name)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, name) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						tl_update_display_name(self);
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
							idVar(self->id, name) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							tl_update_display_name(self);
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_name, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->name, name);
					
					ObjType(obj_timeline, self->id)->name = name;
					tl_update_display_name(ScopeAny(self));
				}
				
			}
		
		
	}
	
	void action_tl_name_single(ScopeAny self, VarType name)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, name) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						tl_update_display_name(self);
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
							idVar(self->id, name) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							tl_update_display_name(self);
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_name_single, true);
				withOne (Object, sVar(timeline_rename), self->id)
				{
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, idVar(self.otherId, name), name);
					
					idVar(self->id, name) = name;
					tl_update_display_name(self);
				}
				
			}
		
		
	}
	
	void action_tl_only_render_glow(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(only_render_glow) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(only_render_glow) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_only_render_glow, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_only_render_glow_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_only_render_glow_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, ObjType(obj_timeline, tl)->only_render_glow, nval);
		
		ObjType(obj_timeline, tl)->only_render_glow = nval;
		for (IntType i = IntType(0); i < ds_list_size(ObjType(obj_timeline, tl)->tree_list); i++)
			if (!(ObjType(obj_timeline, DsList(ObjType(obj_timeline, tl)->tree_list).Value(i))->selected > 0))
				action_tl_only_render_glow_tree(DsList(ObjType(obj_timeline, tl)->tree_list).Value(i), nval, hobj);
	}
	
	void action_tl_parent(ScopeAny self, VarType par, IntType index)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->tl_amount; t++)
				{
					withOne (Object, save_id_find(self->tl_save_id.Value(t)), self->id)
					{
						tl_set_parent(self, { save_id_find(ObjType(obj_history, self.otherId)->tl_old_parent_save_id.Value(t)), ObjType(obj_history, self.otherId)->tl_old_parent_tree_index.Value(t) });
						sVar(value)[e_value_POS_X] = ObjType(obj_history, self.otherId)->tl_old_x.Value(t);
						sVar(value)[e_value_POS_Y] = ObjType(obj_history, self.otherId)->tl_old_y.Value(t);
						sVar(value)[e_value_POS_Z] = ObjType(obj_history, self.otherId)->tl_old_z.Value(t);
					}
					
				}
			}
			
		}
		else
		{
			IntType hobj;
			hobj = null_;
			if (sReal(history_redo) > 0)
			{
				par = save_id_find(ObjType(obj_history, global::history_data)->new_parent);
				index = ObjType(obj_history, global::history_data)->new_index;
			}
			else
			{
				if (par == null_)
					par = global::_app->id;
				hobj = history_set(self, ID_action_tl_parent);
				withOne (obj_history, hobj, self->id)
				{
					self->new_parent = save_id_get(par);
					self->new_index = index;
					self->tl_amount = IntType(0);
				}
				
			}
			
			withAll (obj_timeline, self->id)
				self->moved = false;
			
			action_tl_parent_tree(self, hobj, par, index);
			withOne (obj_data, sInt(timeline_move_obj), self->id)
				action_tl_parent_tree(ScopeAny(self), hobj, par, index);
			
		}
		
		tl_update_list(self);
		tl_update_matrix(self);
	}
	
	void action_tl_parent_tree(ScopeAny self, IntType hobj, VarType newparent, IntType newindex)
	{
		for (IntType t = IntType(0); t < ds_list_size(sInt(tree_list)); t++)
		{
			withOne (obj_timeline, DsList(sInt(tree_list)).Value(t), self->id)
			{
				if (self->selected > 0 && self->part_of == null_ && self->id != newparent && !tl_has_child(ScopeAny(self), newparent) && !self->moved)
				{
					withOne (obj_history, hobj, self->id)
					{
						self->tl_save_id[self->tl_amount] = save_id_get(self.otherId);
						if (idVar(self.otherId, parent) == global::_app->timeline_move_obj)
						{
							self->tl_old_parent_save_id[self->tl_amount] = save_id_get(idVar(self.otherId, move_parent));
							self->tl_old_parent_tree_index[self->tl_amount] = idInt(self.otherId, move_parent_tree_index);
						}
						else
						{
							self->tl_old_parent_save_id[self->tl_amount] = save_id_get(idVar(self.otherId, parent));
							self->tl_old_parent_tree_index[self->tl_amount] = ds_list_find_index(idInt(idVar(self.otherId, parent), tree_list), self.otherId);
						}
						
						self->tl_old_x[self->tl_amount] = idVar(self.otherId, value).Value(e_value_POS_X);
						self->tl_old_y[self->tl_amount] = idVar(self.otherId, value).Value(e_value_POS_Y);
						self->tl_old_z[self->tl_amount] = idVar(self.otherId, value).Value(e_value_POS_Z);
						self->tl_amount++;
					}
					
					tl_set_parent(ScopeAny(self), { newparent, newindex });
					self->moved = true;
					if (ds_list_size(self->keyframe_list) == IntType(0))
					{
						if (self->parent == global::_app->id)
						{
							self->value[e_value_POS_X] = self->value_default.Value(e_value_POS_X);
							self->value[e_value_POS_Y] = self->value_default.Value(e_value_POS_Y);
							self->value[e_value_POS_Z] = self->value_default.Value(e_value_POS_Z);
						}
						else
						{
							self->value[e_value_POS_X] = IntType(0);
							self->value[e_value_POS_Y] = IntType(0);
							self->value[e_value_POS_Z] = IntType(0);
						}
						
					}
					t--;
				}
				if (self->parent != global::_app->timeline_move_obj)
					action_tl_parent_tree(ScopeAny(self), hobj, newparent, newindex);
			}
			
		}
	}
	
	void action_tl_path_closed(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(path_closed) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							sVar(path_closed) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_closed, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_path_closed_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_path_closed_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, ObjType(obj_timeline, tl)->path_closed, nval);
		
		ObjType(obj_timeline, tl)->path_closed = nval;
		withOne (obj_timeline, tl, noone)
			self->path_update = true;
		
		for (IntType i = IntType(0); i < ds_list_size(ObjType(obj_timeline, tl)->tree_list); i++)
			if (!(ObjType(obj_timeline, DsList(ObjType(obj_timeline, tl)->tree_list).Value(i))->selected > 0))
				action_tl_path_closed_tree(DsList(ObjType(obj_timeline, tl)->tree_list).Value(i), nval, hobj);
	}
	
	void action_tl_path_detail(ScopeAny self, VarType value, VarType add)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_detail) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_detail) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_detail, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_detail, ObjType(obj_timeline, self.otherId)->path_detail * add + value);
					
					ObjType(obj_timeline, self->id)->path_detail = ObjType(obj_timeline, self->id)->path_detail * add + value;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_point_add(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				withOne (Object, save_id_find(self->spawn_save_id), self->id)
				{
					if (self->subAssetId == ID_obj_timeline)
						tl_remove_clean(self);
					instance_destroy(self);
				}
				
				history_restore_tl_select(self);
			}
			
		}
		else
		{
			IntType hobj;
			VarType tl;
			hobj = null_;
			if (!(sReal(history_redo) > 0))
				hobj = history_set(self, ID_action_tl_path_point_add);
		}
		
		if (!(sReal(history_undo) > 0))
		{
			if (!(sReal(history_redo) > 0))
				withOne (Object, sVar(hobj), self->id)
					history_save_tl_select(self);
			
			sVar(tl) = new_tl(e_tl_type_PATH_POINT);
			if (global::tl_edit != null_)
			{
				withOne (Object, sVar(tl), self->id)
					tl_set_parent(self, { global::tl_edit });
				
			}
			tl_deselect_all();
			withOne (Object, sVar(tl), self->id)
				tl_select(self);
			
			if (!(sReal(history_redo) > 0))
			{
				withOne (Object, sVar(hobj), self->id)
				{
					history_save_tl_select_new(self);
					sVar(spawn_save_id) = idVar(sVar(tl), save_id);
				}
				
			}
		}
		app_update_tl_edit(self);
		tl_update_list(self);
		tl_update_matrix(self);
	}
	
	void action_tl_path_shape_detail(ScopeAny self, VarType value, VarType add)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_detail) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_detail) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_detail, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_detail, ObjType(obj_timeline, self.otherId)->path_shape_detail * add + value);
					
					ObjType(obj_timeline, self->id)->path_shape_detail = ObjType(obj_timeline, self->id)->path_shape_detail * add + value;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_generate(ScopeAny self, VarType generate)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_generate) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_generate) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_generate, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_generate, generate);
					
					ObjType(obj_timeline, self->id)->path_shape_generate = generate;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_invert(ScopeAny self, VarType invert)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_invert) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_invert) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_invert, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_invert, invert);
					
					ObjType(obj_timeline, self->id)->path_shape_invert = invert;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_radius(ScopeAny self, VarType value, VarType add)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_radius) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_radius) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_radius, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_radius, ObjType(obj_timeline, self.otherId)->path_shape_radius * add + value);
					
					ObjType(obj_timeline, self->id)->path_shape_radius = ObjType(obj_timeline, self->id)->path_shape_radius * add + value;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_smooth_ring(ScopeAny self, VarType smooth_ring)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_smooth_ring) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_smooth_ring) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_smooth_ring, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_smooth_ring, smooth_ring);
					
					ObjType(obj_timeline, self->id)->path_shape_smooth_ring = smooth_ring;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_smooth_segments(ScopeAny self, VarType smooth_segments)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_smooth_segments) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_smooth_segments) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_smooth_segments, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_smooth_segments, smooth_segments);
					
					ObjType(obj_timeline, self->id)->path_shape_smooth_segments = smooth_segments;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_tex_length(ScopeAny self, VarType value, VarType add)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_tex_length) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_tex_length) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_tex_length, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_tex_length, ObjType(obj_timeline, self.otherId)->path_shape_tex_length * add + value);
					
					ObjType(obj_timeline, self->id)->path_shape_tex_length = ObjType(obj_timeline, self->id)->path_shape_tex_length * add + value;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_shape_tube(ScopeAny self, VarType tube)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						idVar(self->id, path_shape_tube) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							idVar(self->id, path_shape_tube) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_shape_tube, true);
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0))
						continue;
					withOne (obj_history, hobj, self->id)
						history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->path_shape_tube, tube);
					
					ObjType(obj_timeline, self->id)->path_shape_tube = tube;
					self->path_update = true;
				}
				
			}
		
		
	}
	
	void action_tl_path_smooth(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(path_smooth) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						sBool(path_update) = true;
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
							sVar(path_smooth) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							sBool(path_update) = true;
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_path_smooth, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_path_smooth_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_path_smooth_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, ObjType(obj_timeline, tl)->path_smooth, nval);
		
		ObjType(obj_timeline, tl)->path_smooth = nval;
		withOne (obj_timeline, tl, noone)
			self->path_update = true;
		
		for (IntType i = IntType(0); i < ds_list_size(ObjType(obj_timeline, tl)->tree_list); i++)
			if (!(ObjType(obj_timeline, DsList(ObjType(obj_timeline, tl)->tree_list).Value(i))->selected > 0))
				action_tl_path_smooth_tree(DsList(ObjType(obj_timeline, tl)->tree_list).Value(i), nval, hobj);
	}
	
	void action_tl_play(ScopeAny self)
	{
		if (!(sReal(timeline_playing) > 0))
		{
			sReal(timeline_playing) = true;
			sInt(timeline_playing_start_time) = current_time();
			sVar(timeline_playing_start_marker) = sVar(timeline_marker);
			sVar(timeline_playing_last_marker) = sVar(timeline_marker);
			sVar(timeline_playing_start_hor_scroll) = ObjType(obj_scrollbar, idInt(sVar(timeline), hor_scroll))->value;
			action_tl_play_start();
		}
		else
		{
			sVar(timeline_marker) = round(sVar(timeline_marker));
			action_tl_play_break(self);
		}
		
	}
	
	void action_tl_play_beginning()
	{
		global::_app->timeline_playing = true;
		global::_app->timeline_playing_start_time = current_time();
		if (global::_app->timeline_region_start != null_)
		{
			global::_app->timeline_playing_start_marker = global::_app->timeline_region_start;
			global::_app->timeline_marker = global::_app->timeline_region_start;
		}
		else
		{
			global::_app->timeline_playing_start_marker = IntType(0);
			global::_app->timeline_marker = IntType(0);
		}
		
		global::_app->timeline_marker_previous = global::_app->timeline_marker + IntType(1);
		action_tl_play_start();
	}
	
	void action_tl_play_break(ScopeAny self)
	{
		sReal(timeline_playing) = false;
		audio_stop_all();
		withAll (obj_keyframe, self->id)
			self->sound_play_index = null_;
		
	}
	
	void action_tl_play_jump(ScopeAny self)
	{
		if (sReal(timeline_playing) > 0)
		{
			sInt(timeline_playing_start_time) = current_time();
			sVar(timeline_playing_start_marker) = sVar(timeline_marker);
			sVar(timeline_playing_start_hor_scroll) = ObjType(obj_scrollbar, idInt(sVar(timeline), hor_scroll))->value;
			action_tl_play_start();
		}
	}
	
	void action_tl_play_repeat(ScopeAny self)
	{
		sInt(project_changed) = true;
		if (!(sVar(timeline_repeat) > 0) && !(sVar(timeline_seamless_repeat) > 0))
		{
			sVar(timeline_repeat) = true;
		}
		else
			if (sVar(timeline_repeat) > 0)
			{
				sVar(timeline_seamless_repeat) = true;
				sVar(timeline_repeat) = false;
			}
			else
			{
				sVar(timeline_seamless_repeat) = false;
				sVar(timeline_repeat) = false;
			}
		
		
		if (sReal(timeline_playing) > 0 && sVar(timeline_length) > IntType(0))
		{
			sInt(timeline_playing_start_time) = current_time();
			if (sVar(timeline_marker) > sVar(timeline_length))
				sVar(timeline_playing_start_marker) = IntType(0);
			else
				sVar(timeline_playing_start_marker) = sVar(timeline_marker);
			
		}
	}
	
}
