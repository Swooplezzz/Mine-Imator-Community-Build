/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.12.15 10:03:12 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void action_tl_alpha_mode(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(alpha_mode) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(alpha_mode) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_alpha_mode, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_alpha_mode_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_alpha_mode_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, alpha_mode), nval);
		
		idVar(tl, alpha_mode) = nval;
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			if (!(idReal(DsList(idInt(tl, tree_list)).Value(i), selected) > 0))
				action_tl_alpha_mode_tree(DsList(idInt(tl, tree_list)).Value(i), nval, hobj);
	}
	
	void action_tl_backfaces(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(backfaces) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(backfaces) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_backfaces, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_backfaces_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_backfaces_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, backfaces), nval);
		
		idVar(tl, backfaces) = nval;
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			if (!(idReal(DsList(idInt(tl, tree_list)).Value(i), selected) > 0))
				action_tl_backfaces_tree(DsList(idInt(tl, tree_list)).Value(i), nval, hobj);
	}
	
	void action_tl_blend_mode(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(blend_mode) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(blend_mode) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_blend_mode, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_blend_mode_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_blend_mode_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, blend_mode), nval);
		
		idVar(tl, blend_mode) = nval;
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			if (!(idReal(DsList(idInt(tl, tree_list)).Value(i), selected) > 0))
				action_tl_blend_mode_tree(DsList(idInt(tl, tree_list)).Value(i), nval, hobj);
	}
	
	void action_tl_collapse_all(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_collapse_all, false);
				for (IntType t = IntType(0); t < ds_list_size(sInt(tree_list)); t++)
					withOne (Object, DsList(sInt(tree_list)).Value(t), self->id)
						action_tl_extend_children_tree(self->id, false, hobj);
				
			}
		
		
		tl_update_list(self);
	}
	
	void action_tl_collapse_children(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_collapse_children, false);
				action_tl_extend_children_tree(global::list_item_value, false, hobj);
			}
		
		
		tl_update_list(self);
	}
	
	void action_tl_color_tag(ScopeAny self, IntType color)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(color_tag) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
					
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
							sVar(color_tag) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_color_tag, false);
				if (global::list_item_value == null_ || idReal(global::list_item_value, selected) > 0)
				{
					withAll (obj_timeline, self->id)
					{
						if (!(self->selected > 0))
							continue;
						withOne (obj_history, hobj, self->id)
							history_save_var(self, self.otherId, ObjType(obj_timeline, self.otherId)->color_tag, color);
						
						self->color_tag = color;
					}
					
				}
				else
				{
					withOne (Object, global::list_item_value, self->id)
					{
						withOne (obj_history, hobj, self->id)
							history_save_var(self, self.otherId, idVar(self.otherId, color_tag), color);
						
						sVar(color_tag) = color;
					}
					
				}
				
			}
		
		
	}
	
	void action_tl_color_tag_remove(ScopeAny self)
	{
		action_tl_color_tag(self, null_);
	}
	
	void action_tl_depth(ScopeAny self, VarType val, VarType add)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
				{
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
					{
						sVar(depth) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
						tl_update_depth(self);
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
							sVar(depth) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
							tl_update_depth(self);
						}
						
					}
				}
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_depth, true);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_depth_tree(self->id, val, add, hobj);
				
			}
		
		
	}
	
	void action_tl_depth_tree(VarType tl, VarType nval, VarType add, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, depth), idVar(tl, depth) * add + nval);
		
		idVar(tl, depth) = idVar(tl, depth) * add + nval;
		withOne (Object, tl, noone)
			tl_update_depth(self);
		
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			if (!(idReal(DsList(idInt(tl, tree_list)).Value(i), selected) > 0))
				action_tl_depth_tree(DsList(idInt(tl, tree_list)).Value(i), nval, add, hobj);
	}
	
	void action_tl_deselect(ScopeAny self, VarType tl)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				history_restore_tl_select(self);
			
		}
		else
		{
			if (!(sReal(history_redo) > 0))
			{
				withOne (obj_history, history_set(self, ID_action_tl_deselect), self->id)
				{
					self->tl_save_id = save_id_get(tl);
					history_save_tl_select(ScopeAny(self));
				}
				
			}
			else
				tl = save_id_find(ObjType(obj_history, global::history_data)->tl_save_id);
			
			withOne (Object, tl, self->id)
				tl_deselect(self);
			
		}
		
		app_update_tl_edit(self);
	}
	
	void action_tl_deselect_all(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				history_restore_tl_select(self);
			
		}
		else
		{
			if (!(sReal(history_redo) > 0))
				withOne (obj_history, history_set(self, ID_action_tl_deselect_all), self->id)
					history_save_tl_select(ScopeAny(self));
			
			tl_deselect_all();
		}
		
		app_update_tl_edit(self);
	}
	
	void action_tl_duplicate(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withAll (obj_timeline, self->id)
				if (self->selected > 0 && self->part_of == null_)
					tl_remove_clean(ScopeAny(self));
			
			withAll (obj_timeline, self->id)
				if (self->delete_ready)
					instance_destroy(ScopeAny(self));
			
			withOne (obj_history, global::history_data, self->id)
				history_restore_tl_select(self);
			
		}
		else
		{
			IntType contexttl;
			RealType contextselected;
			contexttl = null_;
			contextselected = false;
			withAll (obj_timeline, self->id)
			{
				self->root_copy = null_;
				self->copy = null_;
			}
			
			if (!(sReal(history_redo) > 0))
			{
				withOne (obj_history, history_set(self, ID_action_tl_duplicate), self->id)
				{
					history_save_tl_select(ScopeAny(self));
					if (global::list_item_value != null_)
					{
						self->tl_context_save_id = idVar(global::list_item_value, save_id);
						self->tl_context_selected = idReal(global::list_item_value, selected);
					}
					else
					{
						self->tl_context_save_id = null_;
						self->tl_context_selected = false;
					}
					
				}
				
				contexttl = save_id_find(ObjType(obj_history, sArr(history).Value(IntType(0)))->tl_context_save_id);
				contextselected = ObjType(obj_history, sArr(history).Value(IntType(0)))->tl_context_selected;
			}
			else
			{
				contexttl = save_id_find(ObjType(obj_history, global::history_data)->tl_context_save_id);
				contextselected = ObjType(obj_history, global::history_data)->tl_context_selected;
			}
			
			if (contexttl == null_ || contextselected > 0)
			{
				withAll (obj_timeline, self->id)
				{
					if (!(self->selected > 0) || self->part_of != null_ || self->copy != null_ || self->parent_is_selected)
						continue;
					tl_duplicate(ScopeAny(self));
					self->root_copy = self->copy;
					withOne (obj_timeline, self->root_copy, self->id)
						tl_set_parent_root(ScopeAny(self));
					
				}
				
			}
			else
			{
				withOne (Object, contexttl, self->id)
				{
					if (sVar(part_of) != null_ || sInt(copy) != null_ || sBool(parent_is_selected))
						continue;
					tl_duplicate(self);
					sInt(root_copy) = sInt(copy);
					withOne (obj_timeline, sInt(root_copy), self->id)
						tl_set_parent_root(ScopeAny(self));
					
				}
				
			}
			
			tl_deselect_all();
			withAll (obj_timeline, self->id)
			{
				withOne (obj_timeline, self->root_copy, self->id)
				{
					tl_update_recursive_select(ScopeAny(self));
					tl_select(ScopeAny(self));
					tl_set_parent(ScopeAny(self), { ObjType(obj_timeline, self.otherId)->parent });
				}
				
			}
			
		}
		
		tl_update_list(self);
		tl_update_matrix(self);
		app_update_tl_edit(self);
	}
	
	void action_tl_extend(ScopeAny self, VarType timeline)
	{
		VarType tl;
		if (sReal(history_undo) > 0 || sReal(history_redo) > 0)
			tl = save_id_find(ObjType(obj_history, global::history_data)->tl_save_id);
		else
		{
			tl = timeline;
			withOne (obj_history, history_set(self, ID_action_tl_extend), self->id)
				self->tl_save_id = save_id_get(tl);
			
		}
		
		idVar(tl, tree_extend) = !(idVar(tl, tree_extend) > 0);
		tl_update_list(self);
	}
	
	void action_tl_extend_all(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_extend_all, false);
				for (IntType t = IntType(0); t < ds_list_size(sInt(tree_list)); t++)
					withOne (Object, DsList(sInt(tree_list)).Value(t), self->id)
						action_tl_extend_children_tree(self->id, true, hobj);
				
			}
		
		
		tl_update_list(self);
	}
	
	void action_tl_extend_children(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(tree_extend) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_extend_children, false);
				action_tl_extend_children_tree(global::list_item_value, true, hobj);
			}
		
		
		tl_update_list(self);
	}
	
	void action_tl_extend_children_tree(VarType tl, BoolType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, tree_extend), nval);
		
		idVar(tl, tree_extend) = nval;
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			action_tl_extend_children_tree(DsList(idInt(tl, tree_list)).Value(i), nval, hobj);
	}
	
	void action_tl_fog(ScopeAny self, VarType enable)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
				for (IntType t = IntType(0); t < self->save_var_amount; t++)
					withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
						sVar(fog) = ObjType(obj_history, self.otherId)->save_var_old_value.Value(t);
			
			
		}
		else
			if (sReal(history_redo) > 0)
			{
				withOne (obj_history, global::history_data, self->id)
					for (IntType t = IntType(0); t < self->save_var_amount; t++)
						withOne (Object, save_id_find(self->save_var_save_id.Value(t)), self->id)
							sVar(fog) = ObjType(obj_history, self.otherId)->save_var_new_value.Value(t);
				
				
			}
			else
			{
				VarType hobj = history_save_var_start(self, ID_action_tl_fog, false);
				withAll (obj_timeline, self->id)
					if (self->selected > 0)
						action_tl_fog_tree(self->id, enable, hobj);
				
			}
		
		
	}
	
	void action_tl_fog_tree(VarType tl, VarType nval, VarType hobj)
	{
		withOne (obj_history, hobj, noone)
			history_save_var(self, tl, idVar(tl, fog), nval);
		
		idVar(tl, fog) = nval;
		for (IntType i = IntType(0); i < ds_list_size(idInt(tl, tree_list)); i++)
			if (!(idReal(DsList(idInt(tl, tree_list)).Value(i), selected) > 0))
				action_tl_fog_tree(DsList(idInt(tl, tree_list)).Value(i), nval, hobj);
	}
	
	void action_tl_folder(ScopeAny self)
	{
		if (sReal(history_undo) > 0)
		{
			withOne (obj_history, global::history_data, self->id)
			{
				withOne (Object, save_id_find(self->spawn_save_id), self->id)
				{
					tl_remove_clean(self);
					instance_destroy(self);
				}
				
			}
			
		}
		else
		{
			IntType hobj, tl;
			hobj = null_;
			if (!(sReal(history_redo) > 0))
				hobj = history_set(self, ID_action_tl_folder);
			tl = new_tl(e_tl_type_FOLDER);
			if (global::tl_edit != null_)
				withOne (obj_timeline, tl, self->id)
					tl_set_parent(ScopeAny(self), { idVar(global::tl_edit, parent), ds_list_find_index(idInt(idVar(global::tl_edit, parent), tree_list), global::tl_edit) });
			
			if (!(sReal(history_redo) > 0))
			{
				ObjType(obj_history, hobj)->spawn_save_id = save_id_get(tl);
				if (global::tl_edit_amount > IntType(0))
					action_tl_parent(self, tl, IntType(0));
				action_tl_select(self, tl);
			}
		}
		
		tl_update_list(self);
		tl_update_matrix(self);
	}
	
	void action_tl_frame_alpha(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_alpha, true);
		tl_value_set(self, { e_value_ALPHA, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_attractor(ScopeAny self, VarType attractor)
	{
		tl_value_set_start(self, ID_action_tl_frame_attractor, false);
		tl_value_set(self, { e_value_ATTRACTOR, attractor, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_bend_angle(ScopeAny self, RealType val, BoolType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_bend_angle, true);
		tl_value_set(self, { e_value_BEND_ANGLE_X + global::axis_edit, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_bend_angle_xyz(ScopeAny self, VarType bend)
	{
		tl_value_set_start(self, ID_action_tl_frame_bend_angle_xyz, false);
		tl_value_set(self, { e_value_BEND_ANGLE_X, bend.Value(X_), false });
		tl_value_set(self, { e_value_BEND_ANGLE_Y, bend.Value(Y_), false });
		tl_value_set(self, { e_value_BEND_ANGLE_Z, bend.Value(Z_), false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_aspect(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_aspect, true);
		tl_value_set(self, { e_value_CAM_ASPECT, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_blade_amount(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_blade_amount, true);
		tl_value_set(self, { e_value_CAM_BLADE_AMOUNT, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_blade_angle(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_blade_angle, true);
		tl_value_set(self, { e_value_CAM_BLADE_ANGLE, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom, false);
		tl_value_set(self, { e_value_CAM_BLOOM, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom_blend(ScopeAny self, VarType color)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom_blend, true);
		tl_value_set(self, { e_value_CAM_BLOOM_BLEND, color, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom_intensity(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom_intensity, true);
		tl_value_set(self, { e_value_CAM_BLOOM_INTENSITY, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom_radius(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom_radius, true);
		tl_value_set(self, { e_value_CAM_BLOOM_RADIUS, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom_ratio(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom_ratio, true);
		tl_value_set(self, { e_value_CAM_BLOOM_RATIO, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_bloom_threshold(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_bloom_threshold, true);
		tl_value_set(self, { e_value_CAM_BLOOM_THRESHOLD, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca, false);
		tl_value_set(self, { e_value_CAM_CA, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca_blue_offset(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca_blue_offset, true);
		tl_value_set(self, { e_value_CAM_CA_BLUE_OFFSET, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca_blur_amount(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca_blur_amount, true);
		tl_value_set(self, { e_value_CAM_CA_BLUR_AMOUNT, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca_distort_channels(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca_distort_channels, false);
		tl_value_set(self, { e_value_CAM_CA_DISTORT_CHANNELS, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca_green_offset(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca_green_offset, true);
		tl_value_set(self, { e_value_CAM_CA_GREEN_OFFSET, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_ca_red_offset(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_ca_red_offset, true);
		tl_value_set(self, { e_value_CAM_CA_RED_OFFSET, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clip_far(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clip_far, true);
		tl_value_set(self, { e_value_CAM_CLIP_FAR, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clip_near(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clip_near, true);
		tl_value_set(self, { e_value_CAM_CLIP_NEAR, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor, false);
		tl_value_set(self, { e_value_CAM_COLOR_CORRECTION, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor_brightness(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor_brightness, true);
		tl_value_set(self, { e_value_CAM_BRIGHTNESS, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor_color_burn(ScopeAny self, VarType color)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor_color_burn, true);
		tl_value_set(self, { e_value_CAM_COLOR_BURN, color, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor_contrast(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor_contrast, true);
		tl_value_set(self, { e_value_CAM_CONTRAST, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor_saturation(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor_saturation, true);
		tl_value_set(self, { e_value_CAM_SATURATION, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_clrcor_vibrance(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_clrcor_vibrance, true);
		tl_value_set(self, { e_value_CAM_VIBRANCE, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_distort(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_distort, false);
		tl_value_set(self, { e_value_CAM_DISTORT, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_distort_amount(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_distort_amount, true);
		tl_value_set(self, { e_value_CAM_DISTORT_AMOUNT, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_distort_repeat(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_distort_repeat, false);
		tl_value_set(self, { e_value_CAM_DISTORT_REPEAT, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_distort_zoom_amount(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_distort_amount, true);
		tl_value_set(self, { e_value_CAM_DISTORT_ZOOM_AMOUNT, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof, false);
		tl_value_set(self, { e_value_CAM_DOF, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_bias(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_bias, true);
		tl_value_set(self, { e_value_CAM_DOF_BIAS, val / 10.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_blur_ratio(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_blur_ratio, true);
		tl_value_set(self, { e_value_CAM_DOF_BLUR_RATIO, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_blur_size(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_blur_size, true);
		tl_value_set(self, { e_value_CAM_DOF_BLUR_SIZE, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_depth(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_depth, true);
		tl_value_set(self, { e_value_CAM_DOF_DEPTH, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fade_size(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fade_size, true);
		tl_value_set(self, { e_value_CAM_DOF_FADE_SIZE, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fringe(ScopeAny self, VarType enable)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fringe, false);
		tl_value_set(self, { e_value_CAM_DOF_FRINGE, enable, false });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fringe_angle(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fringe_angle, true);
		tl_value_set(self, { e_value_CAM_DOF_FRINGE_ANGLE_RED + global::axis_edit, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fringe_blue(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fringe_blue, true);
		tl_value_set(self, { e_value_CAM_DOF_FRINGE_BLUE, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fringe_green(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fringe_green, true);
		tl_value_set(self, { e_value_CAM_DOF_FRINGE_GREEN, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_fringe_red(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_fringe_red, true);
		tl_value_set(self, { e_value_CAM_DOF_FRINGE_RED, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_gain(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_gain, true);
		tl_value_set(self, { e_value_CAM_DOF_GAIN, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_range(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_range, true);
		tl_value_set(self, { e_value_CAM_DOF_RANGE, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_dof_threshold(ScopeAny self, RealType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_dof_threshold, true);
		tl_value_set(self, { e_value_CAM_DOF_THRESHOLD, val / 100.0, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_exposure(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_exposure, true);
		tl_value_set(self, { e_value_CAM_EXPOSURE, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_fov(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_fov, true);
		tl_value_set(self, { e_value_CAM_FOV, val, add });
		tl_value_set_done();
	}
	
	void action_tl_frame_cam_gamma(ScopeAny self, VarType val, VarType add)
	{
		tl_value_set_start(self, ID_action_tl_frame_cam_gamma, true);
		tl_value_set(self, { e_value_CAM_GAMMA, val, add });
		tl_value_set_done();
	}
	
}
