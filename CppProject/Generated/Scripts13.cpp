/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.07.16 06:12:48 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_tl_marker_pos(ScopeAny self)
	{
		VarType marker;
		if (sReal(history_undo) > 0)
		{
			marker = save_id_find(ObjType(obj_history, global::history_data)->marker_save_id);
			idVar(marker, pos) = ObjType(obj_history, global::history_data)->marker_pos_prev;
		}
		else
		{
			IntType hobj;
			if (!(sReal(history_redo) > 0))
			{
				marker = sVar(timeline_marker_edit);
				hobj = history_set(self, ID_action_tl_marker_pos);
				withOne (obj_history, hobj, self->id)
				{
					self->marker_save_id = save_id_get(marker);
					self->marker_pos_prev = idVar(marker, edit_pos);
					self->marker_pos_new = idVar(marker, pos);
				}
				
				idVar(marker, pos) = ObjType(obj_history, hobj)->marker_pos_new;
			}
			else
			{
				withOne (Object, save_id_find(ObjType(obj_history, global::history_data)->marker_save_id), self->id)
					sVar(pos) = ObjType(obj_history, global::history_data)->marker_pos_new;
				
			}
			
		}
		
		marker_list_sort(self);
	}
	
	void action_tl_move_done(ScopeAny self, VarType par, IntType pos)
	{
		if (par == null_)
		{
			par = global::_app->id;
			pos = null_;
		}
		action_tl_parent(self, par, pos);
		withOne (obj_data, sInt(timeline_move_obj), self->id)
		{
			ds_list_destroy(self->tree_list);
			instance_destroy(ScopeAny(self));
		}
		
		sInt(timeline_move_obj) = null_;
		sVar(window_busy) = /*""*/ STR(0);
	}
	
	void action_tl_move_start(ScopeAny self)
	{
		sVar(window_busy) = /*"timelinemove"*/ STR(48);
		sInt(timeline_move_obj) = (new obj_data)->id;
		ObjType(obj_data, sInt(timeline_move_obj))->tree_list = ds_list_create();
		ObjType(obj_data, sInt(timeline_move_obj))->tree_list_filter = ds_list_create();
		action_tl_move_start_tree(self);
		tl_update_list(self);
	}
	
	void action_tl_move_start_tree(ScopeAny self)
	{
		for (IntType t = IntType(0); t < ds_list_size(sInt(tree_list)); t++)
		{
			withOne (obj_timeline, DsList(sInt(tree_list)).Value(t), self->id)
			{
				if (self->selected > 0 && self->part_of == null_)
				{
					self->move_parent = self->parent;
					self->move_parent_tree_index = ds_list_find_index(idInt(self->parent, tree_list), self->id);
					tl_set_parent(ScopeAny(self), { global::_app->timeline_move_obj });
					t--;
				}
				action_tl_move_start_tree(ScopeAny(self));
			}
			
		}
	}
	
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
	
}
