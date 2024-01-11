/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2023.12.26 01:25:00 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	BoolType json_load_object(BoolType root)
	{
		IntType map = ds_map_create();
		if (global::json_type_map != null_)
			ds_map_add_map((IntType)(global::json_type_map), map, ds_map_create());
		while (json_load_char())
		{
			if (global::json_char == e_json_char_CURLY_END)
				break;
			if (!json_load_string())
				break;
			VarType name = global::json_value;
			if (global::json_char != e_json_char_COLON)
			{
				global::json_error = /*"Expected \":\""*/ STR(1247);
				break;
			}
			if (!json_load_char())
				break;
			if (!json_load_value())
				break;
			switch ((IntType)global::json_value_type)
			{
				case e_json_type_OBJECT:
				{
					ds_map_add_map(map, name, (IntType)(global::json_value));
					break;
				}
				case e_json_type_ARRAY:
				{
					ds_map_add_list(map, name, (IntType)(global::json_value));
					break;
				}
				default:
					DsMap(map)[name] = global::json_value;
			}
			
			if (global::json_type_map != null_)
				ds_map_add(DsMap(global::json_type_map).Value(map), name, global::json_value_type);
			if (global::json_char == e_json_char_CURLY_END)
				break;
			if (global::json_char != e_json_char_COMMA)
			{
				global::json_error = /*"Expected \",\""*/ STR(1243);
				break;
			}
		}
		
		if (!root)
			json_load_char();
		if (global::json_error != /*""*/ STR(0))
		{
			ds_map_destroy(map);
			return false;
		}
		global::json_value = map;
		global::json_value_type = e_json_type_OBJECT;
		return true;
	}
	
	BoolType json_load_string()
	{
		StringType str = /*""*/ STR(0);
		while (true)
		{
			if (buffer_is_eof())
			{
				global::json_error = /*"Unexpected end of file"*/ STR(1244);
				return false;
			}
			global::json_char = buffer_read_byte();
			global::json_column++;
			if (global::json_char == e_json_char_QUOTE)
				break;
			if (global::json_char == e_json_char_RETURN || global::json_char == e_json_char_NEW_LINE)
			{
				global::json_error = /*"Unexpected linebreak in string"*/ STR(1248);
				return false;
			}
			if (global::json_char == e_json_char_BACKSLASH)
			{
				if (buffer_is_eof())
				{
					global::json_error = /*"Unexpected end of file"*/ STR(1244);
					return false;
				}
				global::json_char = buffer_read_byte();
				global::json_column++;
				if (global::json_char == e_json_char_QUOTE)
					str += /*"\""*/ STR(1155);
				else
					if (global::json_char == e_json_char_BACKSLASH)
						str += /*"\\"*/ STR(177);
					else
						if (global::json_char == e_json_char_N)
							str += /*"\n"*/ STR(710);
						else
							if (global::json_char == e_json_char_T)
								str += /*"\t"*/ STR(1054);
							else
								if (global::json_char == e_json_char_U)
								{
									StringType hex = /*""*/ STR(0);
									for (IntType _it = 0, _it_max = IntType(4); _it < _it_max; _it++)
									{
										if (buffer_is_eof())
										{
											global::json_error = /*"Unexpected end of file"*/ STR(1244);
											return false;
										}
										global::json_char = buffer_read_byte();
										global::json_column++;
										hex += chr(global::json_char);
									}
									str += chr((IntType)(hex_to_dec(hex)));
								}
								else
									str += chr(global::json_char);
							
						
					
				
				
			}
			else
				str += chr(global::json_char);
			
		}
		
		if (!json_load_char())
			return false;
		global::json_value = str;
		global::json_value_type = e_json_type_STRING;
		return true;
	}
	
	BoolType json_load_value()
	{
		if (global::json_char == e_json_char_CURLY_BEGIN)
			return json_load_object(false);
		else
			if (global::json_char == e_json_char_SQUARE_BEGIN)
				return json_load_array();
			else
				if (global::json_char == e_json_char_QUOTE)
					return json_load_string();
				else
					if ((global::json_char >= e_json_char_NUM_0 && global::json_char <= e_json_char_NUM_9) || global::json_char == e_json_char_MINUS)
						return json_load_number();
					else
						return json_load_word();
				
			
		
		
		return false;
	}
	
	BoolType json_load_word()
	{
		if (global::json_char == e_json_char_T)
		{
			for (IntType _it = 0, _it_max = IntType(4); _it < _it_max; _it++)
				if (!json_load_char())
					return false;
			global::json_value = true;
			global::json_value_type = e_json_type_BOOL;
		}
		else
			if (global::json_char == e_json_char_F)
			{
				for (IntType _it = 0, _it_max = IntType(5); _it < _it_max; _it++)
					if (!json_load_char())
						return false;
				global::json_value = false;
				global::json_value_type = e_json_type_BOOL;
			}
			else
				if (global::json_char == e_json_char_N)
				{
					for (IntType _it = 0, _it_max = IntType(4); _it < _it_max; _it++)
						if (!json_load_char())
							return false;
					global::json_value = null_;
					global::json_value_type = e_json_type_NULL_;
				}
				else
				{
					global::json_error = /*"Unrecognized word"*/ STR(1249);
					return false;
				}
			
		
		
		return true;
	}
	
	void json_save_array(VarType arr, IntType size)
	{
		buffer_write_byte(e_json_char_SQUARE_BEGIN);
		buffer_write_byte(e_json_char_SPACE);
		for (IntType i = IntType(0); i < size; i++)
		{
			if (i > IntType(0))
			{
				buffer_write_byte(e_json_char_COMMA);
				buffer_write_byte(e_json_char_SPACE);
			}
			json_save_value(arr.Value(i));
		}
		buffer_write_byte(e_json_char_SPACE);
		buffer_write_byte(e_json_char_SQUARE_END);
	}
	
	void json_save_array_done()
	{
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		global::json_indent--;
		json_save_indent();
		buffer_write_byte(e_json_char_SQUARE_END);
		global::json_add_comma = true;
	}
	
	void json_save_array_start(VarArgs argument)
	{
		IntType argument_count = argument.Size();
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		if (argument_count > IntType(0))
		{
			buffer_write_byte(e_json_char_QUOTE);
			buffer_write_string(argument[IntType(0)]);
			buffer_write_byte(e_json_char_QUOTE);
			buffer_write_byte(e_json_char_COLON);
			buffer_write_byte(e_json_char_SPACE);
		}
		buffer_write_byte(e_json_char_SQUARE_BEGIN);
		global::json_indent++;
		global::json_add_comma = false;
	}
	
	void json_save_array_value(VarType val)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		json_save_value(val);
		global::json_add_comma = true;
	}
	
	void json_save_done()
	{
		buffer_resize(global::buffer_current, buffer_tell(global::buffer_current));
		buffer_save_lib(global::buffer_current, global::json_filename);
		buffer_delete(global::buffer_current);
	}
	
	void json_save_indent()
	{
		for (IntType _it = 0, _it_max = global::json_indent; _it < _it_max; _it++)
			buffer_write_byte(e_json_char_TAB);
	}
	
	void json_save_object_done()
	{
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		global::json_indent--;
		json_save_indent();
		buffer_write_byte(e_json_char_CURLY_END);
		global::json_add_comma = true;
	}
	
	void json_save_object_start(VarArgs argument)
	{
		IntType argument_count = argument.Size();
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		if (!global::json_empty)
		{
			buffer_write_byte(e_json_char_RETURN);
			buffer_write_byte(e_json_char_NEW_LINE);
		}
		else
			global::json_empty = false;
		
		json_save_indent();
		if (argument_count > IntType(0))
		{
			buffer_write_byte(e_json_char_QUOTE);
			buffer_write_string(argument[IntType(0)]);
			buffer_write_byte(e_json_char_QUOTE);
			buffer_write_byte(e_json_char_COLON);
			buffer_write_byte(e_json_char_SPACE);
		}
		buffer_write_byte(e_json_char_CURLY_BEGIN);
		global::json_indent++;
		global::json_add_comma = false;
	}
	
	void json_save_start(VarType fn)
	{
		global::json_filename = fn;
		global::json_indent = IntType(0);
		global::json_empty = true;
		global::json_add_comma = false;
		global::buffer_current = buffer_create(IntType(8), buffer_grow, IntType(1));
	}
	
	void json_save_value(VarType val)
	{
		if (is_real(val) || is_int32(val) || is_int64(val))
			buffer_write_string(string_decimals(val));
		else
			if (is_array(val))
				json_save_array(val, array_length(VarType::CreateRef(val)));
			else
				if (is_bool(val))
					buffer_write_string(string(val));
				else
				{
					buffer_write_byte(e_json_char_QUOTE);
					buffer_write_string(val);
					buffer_write_byte(e_json_char_QUOTE);
				}
			
		
		
	}
	
	void json_save_var(VarType name, VarType val)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		json_save_value(val);
		global::json_add_comma = true;
	}
	
	void json_save_var_bool(VarType name, VarType val)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		buffer_write_string((val > 0) ? /*"true"*/ STR(776) : /*"false"*/ STR(777));
		global::json_add_comma = true;
	}
	
	void json_save_var_color(VarType name, VarType val)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		json_save_value(/*"#"*/ STR(859) + color_to_hex(val));
		global::json_add_comma = true;
	}
	
	void json_save_var_nullable(StringType name, VarType val)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		if (val == null_)
			json_save_value(/*"null"*/ STR(1250));
		else
			json_save_value(val);
		
		global::json_add_comma = true;
	}
	
	void json_save_var_point2D(StringType name, VarType value)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		if (value == null_)
			json_save_value(/*"null"*/ STR(1250));
		else
			json_save_value(point2D(value.Value(X_), value.Value(Y_)));
		
		global::json_add_comma = true;
	}
	
	void json_save_var_point3D(StringType name, VarType value)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		if (value == null_)
			json_save_value(/*"null"*/ STR(1250));
		else
			json_save_value(point3D(value.Value(X_), value.Value(Z_), value.Value(Y_)));
		
		global::json_add_comma = true;
	}
	
	void json_save_var_save_id(StringType name, VarType obj)
	{
		if (global::json_add_comma)
			buffer_write_byte(e_json_char_COMMA);
		buffer_write_byte(e_json_char_RETURN);
		buffer_write_byte(e_json_char_NEW_LINE);
		json_save_indent();
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_string(name);
		buffer_write_byte(e_json_char_QUOTE);
		buffer_write_byte(e_json_char_COLON);
		buffer_write_byte(e_json_char_SPACE);
		if (obj == null_)
			json_save_value(/*"null"*/ STR(1250));
		else
		{
			json_save_value(save_id_get(obj));
			idBool(obj, save) = true;
		}
		
		global::json_add_comma = true;
	}
	
	void json_save_var_state_vars(StringType name, VarType vars)
	{
		json_save_object_start({ name });
		for (IntType i = IntType(0); i < array_length(VarType::CreateRef(vars)); i += IntType(2))
			json_save_var(vars.Value(i), vars.Value(i + IntType(1)));
		json_save_object_done();
	}
	
	void json_startup()
	{
	}
	
	void keybinds_reset_default(ScopeAny self)
	{
		for (IntType i = IntType(0); i < e_keybind_amount; i++)
			keybind_restore(self, i, true);
		keybinds_update_match();
		settings_save(self);
	}
	
	void keybinds_update_match()
	{
		withAll (obj_keybind, noone)
		{
			self->match_error = false;
			withAll (obj_keybind, self->id)
			{
				if (self->id == self.otherId)
					continue;
				if (array_equals(VarType::CreateRef(self->keybind), VarType::CreateRef(ObjType(obj_keybind, self.otherId)->keybind)) && (self->navigation == ObjType(obj_keybind, self.otherId)->navigation))
				{
					ObjType(obj_keybind, self.otherId)->match_error = true;
					break;
				}
			}
			
		}
		
	}
	
	BoolType keybind_check(VarType keybindobj, StringType checkscript)
	{
		VarType keybind;
		BoolType scriptres, charcheck;
		keybind = idVar(keybindobj, keybind);
		switch (StringType(checkscript).id)
		{
			case 703: // keyboard_check
			{
				scriptres = keyboard_check((IntType)(keybind.Value(e_keybind_key_CHAR)));
				break;
			}
			case 705: // keyboard_check_pressed
			{
				scriptres = keyboard_check_pressed((IntType)(keybind.Value(e_keybind_key_CHAR)));
				break;
			}
			case 704: // keyboard_check_released
			{
				scriptres = keyboard_check_released((IntType)(keybind.Value(e_keybind_key_CHAR)));
				break;
			}
		}
		
		charcheck = (keybind.Value(e_keybind_key_CHAR) == null_ || scriptres);
		if (checkscript == /*"keyboard_check"*/ STR(703))
		{
			idBool(keybindobj, check_ctrl) = (keyboard_check(vk_control) == keybind.Value(e_keybind_key_CTRL)) || (idBool(keybindobj, navigation) && !(keybind.Value(e_keybind_key_CTRL) > 0));
			idBool(keybindobj, check_shift) = (keyboard_check(vk_shift) == keybind.Value(e_keybind_key_SHIFT)) || (idBool(keybindobj, navigation) && !(keybind.Value(e_keybind_key_SHIFT) > 0));
			idBool(keybindobj, check_alt) = (keyboard_check(vk_alt) == keybind.Value(e_keybind_key_ALT)) || (idBool(keybindobj, navigation) && !(keybind.Value(e_keybind_key_ALT) > 0));
		}
		return (charcheck && idBool(keybindobj, check_ctrl) && idBool(keybindobj, check_shift) && idBool(keybindobj, check_alt));
	}
	
	void keybind_event_create(Scope<obj_keybind> self)
	{
		self->name = /*""*/ STR(0);
		self->keybind_id = null_;
		self->keybind = null_;
		self->keybind_default = null_;
		self->pressed = false;
		self->active = false;
		self->released = false;
		self->check_ctrl = false;
		self->check_shift = false;
		self->check_alt = false;
		self->match_error = false;
	}
	
	VarType keybind_new(VarType char_, BoolType ctrl, BoolType shift, BoolType alt)
	{
		if (is_string(char_))
			char_ = ord(char_);
		return ArrType::From({ char_, ctrl, shift, alt });
	}
	
	void keybind_register(StringType name, IntType keybindID, VarType keybind, BoolType navigation)
	{
		IntType obj = (new obj_keybind)->id;
		ObjType(obj_keybind, obj)->name = name;
		ObjType(obj_keybind, obj)->keybind_id = keybindID;
		ObjType(obj_keybind, obj)->keybind_default = keybind;
		ObjType(obj_keybind, obj)->keybind = keybind;
		ObjType(obj_keybind, obj)->navigation = navigation;
		global::keybinds[keybindID] = obj;
	}
	
	void keybind_restore(ScopeAny self, IntType keybindID, BoolType group)
	{
		VarType obj = global::keybinds.Value(keybindID);
		idVar(obj, keybind) = idVar(obj, keybind_default);
		if (!group)
		{
			keybinds_update_match();
			settings_save(self);
		}
	}
	
	void keybind_set(ScopeAny self, IntType keybindID, VarType keybind)
	{
		VarType obj = global::keybinds.Value(keybindID);
		idVar(obj, keybind) = keybind;
		keybinds_update_match();
		settings_save(self);
	}
	
	RealType keyframes_save(ScopeAny self)
	{
		BoolType ismodel;
		VarType tllast;
		ismodel = false;
		tllast = null_;
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0))
				continue;
			if (tllast != null_ && self->timeline != tllast)
				ismodel = true;
			tllast = self->timeline;
		}
		
		VarType name;
		if (ismodel && idVar(global::tl_edit, part_of) != null_)
			name = idVar(idVar(global::tl_edit, part_of), display_name);
		else
			name = idVar(global::tl_edit, display_name);
		
		VarType fn = file_dialog_save_keyframes(name);
		if (fn == /*""*/ STR(0))
			return IntType(0);
		fn = filename_new_ext(fn, /*".miframes"*/ STR(37));
		log({ /*"Saving keyframes"*/ STR(1265), fn });
		global::save_folder = filename_dir(fn);
		global::load_folder = sStr(project_folder);
		log({ /*"load_folder"*/ STR(745), global::load_folder });
		log({ /*"save_folder"*/ STR(744), global::save_folder });
		project_save_start(fn, false);
		VarType firstpos, lastpos;
		firstpos = null_;
		lastpos = null_;
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0))
				continue;
			tl_keyframe_save(self->id);
			if (firstpos == null_ || self->position < firstpos)
				firstpos = self->position;
			lastpos = max({ self->position, lastpos });
		}
		
		json_save_var_bool(/*"is_model"*/ STR(40), ismodel);
		json_save_var(/*"tempo"*/ STR(41), sVar(project_tempo));
		json_save_var(/*"length"*/ STR(43), lastpos - firstpos);
		json_save_array_start({ /*"keyframes"*/ STR(42) });
		withAll (obj_keyframe, self->id)
		{
			if (!(self->selected > 0))
				continue;
			json_save_object_start();
			json_save_var(/*"position"*/ STR(44), self->position - firstpos);
			if (ismodel && idVar(self->timeline, part_of) != null_)
				json_save_var(/*"part_name"*/ STR(45), idVar(self->timeline, model_part_name));
			keyframe_update_item_name(self);
			project_save_values(/*"values"*/ STR(46), self->value, idArr(self->timeline, value_default));
			json_save_object_done();
		}
		
		json_save_array_done();
		project_save_objects(self);
		project_save_done();
		log({ /*"Keyframes saved"*/ STR(1266) });
		return 0.0;
	}
	
	void keyframe_event_destroy(Scope<obj_keyframe> self)
	{
		ds_list_delete_value(idInt(self->timeline, keyframe_list), self->id);
		if (self->value.Value(e_value_SOUND_OBJ) != null_)
			idInt(self->value.Value(e_value_SOUND_OBJ), count)--;
	}
	
	RealType keyframe_update_item_name(Scope<obj_keyframe> self)
	{
		if (idVar(self->timeline, type) != e_tl_type_ITEM)
			return IntType(0);
		VarType slot = self->value.Value(e_value_ITEM_SLOT);
		if (self->value.Value(e_value_TEXTURE_OBJ) != null_)
		{
			VarType tex = self->value.Value(e_value_TEXTURE_OBJ);
			if (idVar(tex, type) == e_res_type_PACK && slot < ds_list_size((IntType)(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list)))
				self->value[e_value_ITEM_NAME] = DsList(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list).Value(slot);
			else
				self->value[e_value_ITEM_NAME] = /*""*/ STR(0);
			
		}
		else
			if (idVar(idVar(idVar(self->timeline, temp), item_tex), type) == e_res_type_PACK && slot < ds_list_size((IntType)(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list)))
			{
				self->value[e_value_ITEM_NAME] = DsList(ObjType(obj_minecraft_assets, global::mc_assets)->item_texture_list).Value(slot);
			}
			else
				self->value[e_value_ITEM_NAME] = /*""*/ STR(0);
		
		
		return 0.0;
	}
	
	BoolType key_valid(VarType key)
	{
		StringType keystr;
		key = string_upper(key);
		keystr = /*"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"*/ STR(1267);
		if (string_length(key) != IntType(8))
			return false;
		for (IntType c = IntType(0); c < IntType(8); c += IntType(2))
		{
			IntType pos1, pos2;
			pos1 = string_pos(string_char_at(key, c + IntType(1)), keystr);
			pos2 = string_pos(string_char_at(key, (IntType)(IntType(8) - c)), keystr);
			if (pos1 == IntType(0) || pos2 == IntType(0))
				return false;
			if (pos1 != string_length(keystr) + IntType(1) - pos2)
				return false;
		}
		return true;
	}
	
	void langauge_new(StringType fn)
	{
		IntType obj = (new obj_language)->id;
		withOne (obj_language, obj, noone)
		{
			self->filename = filename_name(fn);
			self->name = text_get({ /*"filelanguage"*/ STR(1268) });
			self->locale = text_exists(/*"filelocale"*/ STR(1269)) ? string(text_get({ /*"filelocale"*/ STR(1269) })) : /*""*/ STR(0);
		}
		
	}
	
	RealType languages_load()
	{
		StringType fn = languages_file;
		if (!file_exists_lib(fn))
			return IntType(0);
		log({ /*"Loading languages"*/ STR(1270), fn });
		VarType map = json_load({ fn });
		if (!ds_map_valid(map))
			return IntType(0);
		global::load_format = DsMap(map).Value(/*"format"*/ STR(92));
		log({ /*"load_format"*/ STR(1271), global::load_format });
		VarType list, obj;
		list = DsMap(map).Value(/*"languages"*/ STR(1272));
		for (IntType i = IntType(0); i < ds_list_size((IntType)(list)); i++)
		{
			map = DsList(list).Value(i);
			VarType name, locale, fn;
			name = value_get_string(DsMap(map).Value(/*"name"*/ STR(819)), /*""*/ STR(0));
			locale = value_get_string(DsMap(map).Value(/*"locale"*/ STR(1273)), /*""*/ STR(0));
			fn = value_get_string(DsMap(map).Value(/*"filename"*/ STR(1274)), /*""*/ STR(0));
			language_remove(fn);
			IntType obj = (new obj_language)->id;
			ObjType(obj_language, obj)->name = name;
			ObjType(obj_language, obj)->locale = locale;
			ObjType(obj_language, obj)->filename = fn;
		}
		ds_list_destroy((IntType)(list));
		return 0.0;
	}
	
	void languages_save()
	{
		log({ /*"Saving languages"*/ STR(1275), languages_file });
		json_save_start(languages_file);
		json_save_object_start();
		json_save_var(/*"format"*/ STR(92), settings_format);
		json_save_array_start({ /*"languages"*/ STR(1272) });
		withAll (obj_language, noone)
		{
			json_save_object_start();
			json_save_var(/*"name"*/ STR(819), json_string_encode(self->name));
			json_save_var(/*"locale"*/ STR(1273), self->locale);
			json_save_var(/*"filename"*/ STR(1274), self->filename);
			json_save_object_done();
		}
		
		json_save_array_done();
		json_save_object_done();
		json_save_done();
		debug({ /*"Saved languges"*/ STR(1276) });
	}
	
	RealType language_add(ScopeAny self)
	{
		StringType fn = file_dialog_open_language();
		if (fn == /*""*/ STR(0))
			return IntType(0);
		if (file_exists_lib(languages_directory + filename_name(fn)))
			if (!question(/*"This file already exists the language file directory. Do you want to replace the file?"*/ STR(1277)))
				return IntType(0);
		file_copy_lib(fn, languages_directory + filename_name(fn));
		action_setting_language_load(self, languages_directory + filename_name(fn));
		language_remove(filename_name(fn));
		langauge_new(fn);
		languages_save();
		return 0.0;
	}
	
	RealType language_load(VarType fn, IntType map, BoolType reload)
	{
		log({ /*"Loading language file"*/ STR(1278), fn });
		ds_map_clear(map);
		if (filename_ext(fn) == /*".milanguage"*/ STR(1279))
		{
			StringType convfn = file_directory + /*"conv.tmp"*/ STR(1280);
			json_file_convert_unicode(fn, convfn);
			if (!file_exists_lib(convfn))
			{
				StringType msg = /*"An error occurred while reading the language file:\nCould not convert."*/ STR(1281);
				log({ msg });
				window_set_caption(/*"Error"*/ STR(1282));
				show_message(msg);
				window_set_caption(/*""*/ STR(0));
				return IntType(0);
			}
			IntType jsonmap = json_load({ convfn });
			if (ds_map_valid(jsonmap))
			{
				language_load_map(/*""*/ STR(0), jsonmap, map);
				ds_map_destroy(jsonmap);
			}
			else
			{
				StringType msg = /*"An error occured while reading the language file:\n"*/ STR(1283) + global::json_error + /*" on line "*/ STR(1241) + string(global::json_line) + /*", column "*/ STR(1242) + string(global::json_column);
				log({ msg });
				window_set_caption(/*"Error"*/ STR(1282));
				show_message(msg);
				window_set_caption(/*""*/ STR(0));
				return IntType(0);
			}
			
		}
		else
			language_load_legacy(fn, map);
		
		if (!reload && map != global::language_english_map)
		{
			IntType missingkeyslist;
			VarType key;
			missingkeyslist = ds_list_create();
			key = ds_map_find_first(global::language_english_map);
			while (!is_undefined(key))
			{
				if (is_undefined(DsMap(map).Value(key)))
					ds_list_add({ missingkeyslist, key });
				key = ds_map_find_next(global::language_english_map, key);
			}
			
			if (ds_list_size(missingkeyslist) > IntType(0))
			{
				ds_list_sort(missingkeyslist, true);
				VarType msg = /*"The following texts are missing in the translation and will display as English:\n"*/ STR(1284);
				for (IntType i = IntType(0); i < ds_list_size(missingkeyslist); i++)
					msg += DsList(missingkeyslist).Value(i) + /*": "*/ STR(1055) + string_replace_all(DsMap(global::language_english_map).Value(DsList(missingkeyslist).Value(i)), /*"\n"*/ STR(710), /*"\\n"*/ STR(1260)) + /*"\n"*/ STR(710);
				log({ msg });
				window_set_caption(/*"Error"*/ STR(1282));
				show_message(/*"Some texts are missing in the translation and will display as English. See the log for details:\n"*/ STR(1285) + log_file);
				window_set_caption(/*"Mine-imator"*/ STR(23));
			}
		}
		return 0.0;
	}
	
	RealType language_load_legacy(VarType fn, IntType map)
	{
		if (!file_exists_lib(fn))
			return IntType(0);
		file_copy_lib(fn, temp_file);
		IntType f = file_text_open_read(temp_file);
		while (!file_text_eof(f))
		{
			StringType line;
			IntType commapos;
			line = file_text_read_string(f);
			commapos = string_pos(/*":"*/ STR(788), line);
			if (commapos > IntType(0))
			{
				StringType key, val;
				key = string_copy(line, IntType(1), (IntType)(commapos - IntType(1)));
				val = string_delete(line, IntType(1), commapos + IntType(1));
				DsMap(map)[key] = val;
			}
			file_text_readln(f);
		}
		
		file_text_close(f);
		return 0.0;
	}
	
	RealType language_load_map(StringType pre, VarType smap, IntType dmap)
	{
		VarType key;
		if (!ds_map_valid(smap))
			return IntType(0);
		key = ds_map_find_first((IntType)(smap));
		while (!is_undefined(key))
		{
			if (string_contains(key, /*"/"*/ STR(20)))
				language_load_map(pre + string_replace(key, /*"/"*/ STR(20), /*""*/ STR(0)), DsMap(smap).Value(key), dmap);
			else
				DsMap(dmap)[pre + key] = DsMap(smap).Value(key);
			
			key = ds_map_find_next((IntType)(smap), key);
		}
		
		return 0.0;
	}
	
	void language_remove(VarType fn)
	{
		StringType filename = filename_name(fn);
		withAll (obj_language, noone)
		{
			if (ObjType(obj_language, self->id)->filename == filename)
			{
				instance_destroy(ScopeAny(self));
				break;
			}
		}
		
	}
	
	BoolType legacy_startup()
	{
		log({ /*"Loading legacy file"*/ STR(1286) });
		IntType map = json_load({ legacy_file });
		if (!ds_map_valid(map))
		{
			log({ /*"Error loading legacy.midata"*/ STR(1287) });
			return false;
		}
		global::legacy_model_id_05_map = DsMap(map).Value(/*"legacy_model_id_05"*/ STR(1288));
		global::legacy_model_id_06_map = DsMap(map).Value(/*"legacy_model_id_06"*/ STR(1289));
		global::legacy_model_id_100_demo_map = DsMap(map).Value(/*"legacy_model_id_100_demo"*/ STR(1290));
		ds_map_merge(global::legacy_model_id_05_map, DsMap(map).Value(/*"legacy_model_id"*/ STR(1291)));
		ds_map_merge(global::legacy_model_id_06_map, DsMap(map).Value(/*"legacy_model_id"*/ STR(1291)));
		ds_map_merge(global::legacy_model_id_100_demo_map, DsMap(map).Value(/*"legacy_model_id"*/ STR(1291)));
		global::legacy_model_part_map = DsMap(map).Value(/*"legacy_model_part"*/ STR(1292));
		global::legacy_model_name_map = DsMap(map).Value(/*"legacy_model_name"*/ STR(1293));
		global::legacy_block_set[IntType(255)] = false;
		global::legacy_block_id = DsMap(map).Value(/*"legacy_block_id"*/ STR(1294));
		global::legacy_block_texture_name_map = DsMap(map).Value(/*"legacy_block_texture_name"*/ STR(1295));
		global::legacy_block_05_texture_list = DsMap(map).Value(/*"legacy_block_05_textures"*/ STR(1296));
		global::legacy_block_07_demo_texture_list = DsMap(map).Value(/*"legacy_block_07_demo_textures"*/ STR(1297));
		global::legacy_block_100_texture_list = DsMap(map).Value(/*"legacy_block_100_textures"*/ STR(1298));
		for (IntType i = IntType(0); i < IntType(256); i++)
		{
			for (IntType d = IntType(0); d < IntType(16); d++)
			{
				global::legacy_block_obj[i][d] = null_;
				global::legacy_block_state_id[i][d] = IntType(0);
				global::legacy_block_mc_id[i][d] = /*""*/ STR(0);
			}
		}
		global::legacy_item_texture_name_map = DsMap(map).Value(/*"legacy_item_texture_name"*/ STR(1299));
		global::legacy_biomes_map = DsMap(map).Value(/*"legacy_biomes"*/ STR(1300));
		global::legacy_biomes_ids_map = ds_int_map_create();
		VarType key = ds_map_find_first((IntType)(DsMap(map).Value(/*"legacy_biome_ids"*/ STR(1301))));
		while (!is_undefined(key))
		{
			DsMap(global::legacy_biomes_ids_map)[string_get_real(key)] = ds_map_find_value((IntType)(DsMap(map).Value(/*"legacy_biome_ids"*/ STR(1301))), key);
			key = ds_map_find_next((IntType)(DsMap(map).Value(/*"legacy_biome_ids"*/ STR(1301))), key);
		}
		
		global::biomes_ids_map = ds_int_map_create();
		key = ds_map_find_first((IntType)(DsMap(map).Value(/*"biome_ids"*/ STR(1302))));
		while (!is_undefined(key))
		{
			DsMap(global::biomes_ids_map)[string_get_real(key)] = ds_map_find_value((IntType)(DsMap(map).Value(/*"biome_ids"*/ STR(1302))), key);
			key = ds_map_find_next((IntType)(DsMap(map).Value(/*"biome_ids"*/ STR(1302))), key);
		}
		
		global::legacy_model_names_map = DsMap(map).Value(/*"legacy_model_names"*/ STR(1303));
		global::legacy_model_states_map = DsMap(map).Value(/*"legacy_model_states"*/ STR(1304));
		global::legacy_model_state_values_map = DsMap(map).Value(/*"legacy_model_state_values"*/ STR(1305));
		global::legacy_block_names_map = DsMap(map).Value(/*"legacy_block_names"*/ STR(1306));
		global::legacy_particles_map = DsMap(map).Value(/*"legacy_particles"*/ STR(1307));
		return true;
	}
	
	RealType lengthdir_z(VarType length, VarType dir)
	{
		return -lengthdir_y(length, dir);
	}
	
	BoolType lib_startup()
	{
		global::file_copy_temp = false;
		if (is_cpp())
			return true;
		log({ /*"External library init"*/ STR(1308) });
		StringType libpath, pathfile, pathmovie, pathwindow;
		libpath = /*"Data/Libraries/"*/ STR(1309);
		pathfile = libpath + /*"file.dll"*/ STR(1310);
		pathmovie = libpath + /*"movie.dll"*/ STR(1311);
		pathwindow = libpath + /*"window.dll"*/ STR(1312);
		if (!file_exists(pathfile))
			return missing_file(pathfile);
		if (!file_exists(pathmovie))
			return missing_file(pathmovie);
		if (!file_exists(pathwindow))
			return missing_file(pathwindow);
		log({ /*"External library"*/ STR(1313), pathwindow });
		global::lib_window_maximize = external_define({ pathwindow, /*"window_maximize"*/ STR(1314), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_window_set_focus = external_define({ pathwindow, /*"window_set_focus"*/ STR(1315), dll_cdecl, ty_real, IntType(1), ty_string });
		log({ /*"External library"*/ STR(1313), pathfile });
		global::file_copy_temp = true;
		global::lib_open_url = external_define({ pathfile, /*"open_url"*/ STR(1316), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_execute = external_define({ pathfile, /*"execute"*/ STR(1143), dll_cdecl, ty_real, IntType(3), ty_string, ty_string, ty_real });
		global::lib_unzip = external_define({ pathfile, /*"unzip"*/ STR(1317), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_gzunzip = external_define({ pathfile, /*"gzunzip"*/ STR(1318), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_file_rename = external_define({ pathfile, /*"file_rename"*/ STR(1319), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_file_copy = external_define({ pathfile, /*"file_copy"*/ STR(1320), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_file_delete = external_define({ pathfile, /*"file_delete"*/ STR(1321), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_file_exists = external_define({ pathfile, /*"file_exists"*/ STR(1322), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_directory_create = external_define({ pathfile, /*"directory_create"*/ STR(1323), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_directory_delete = external_define({ pathfile, /*"directory_delete"*/ STR(1324), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_directory_exists = external_define({ pathfile, /*"directory_exists"*/ STR(1325), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_json_file_convert_unicode = external_define({ pathfile, /*"json_file_convert_unicode"*/ STR(1326), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		log({ /*"External library"*/ STR(1313), pathmovie });
		global::lib_movie_init = external_define({ pathmovie, /*"movie_init"*/ STR(1327), dll_cdecl, ty_real, IntType(0) });
		global::lib_movie_set = external_define({ pathmovie, /*"movie_set"*/ STR(1328), dll_cdecl, ty_real, IntType(5), ty_real, ty_real, ty_real, ty_real, ty_real });
		global::lib_movie_start = external_define({ pathmovie, /*"movie_start"*/ STR(1329), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_movie_audio_file_decode = external_define({ pathmovie, /*"movie_audio_file_decode"*/ STR(1330), dll_cdecl, ty_real, IntType(2), ty_string, ty_string });
		global::lib_movie_audio_file_add = external_define({ pathmovie, /*"movie_audio_file_add"*/ STR(1331), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_movie_audio_sound_add = external_define({ pathmovie, /*"movie_audio_sound_add"*/ STR(1332), dll_cdecl, ty_real, IntType(6), ty_real, ty_real, ty_real, ty_real, ty_real, ty_real });
		global::lib_movie_frame = external_define({ pathmovie, /*"movie_frame"*/ STR(1333), dll_cdecl, ty_real, IntType(1), ty_string });
		global::lib_movie_done = external_define({ pathmovie, /*"movie_done"*/ STR(1334), dll_cdecl, ty_real, IntType(0) });
		log({ /*"External library"*/ STR(1313), /*"movie init"*/ STR(1335) });
		lib_movie_init();
		math_lib_startup(pathwindow);
		return true;
	}
	
}
