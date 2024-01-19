/*
	NOTE:
	This file was autogenerated by CppGen, changes may be overwritten and forever lost!
	Modify at your own risk!
	
	[ Generated on 2024.01.19 13:05:30 ]
*/

#include "Scripts.hpp"

namespace CppProject
{
	void draw_tooltip_label(ScopeAny self, VarType text, IntType icon, IntType type)
	{
		VarType color;
		color = ObjType(obj_theme, sInt(setting_theme))->toast_color.Value(type);
		draw_set_font(sInt(font_caption));
		text = string_wrap(text_get({ text }), (sVar(dw) - IntType(32)) + IntType(4));
		sVar(dy) -= 8.0;
		tab_control(self, IntType(24) + string_count(/*"\n"*/ STR(712), text) * IntType(14));
		draw_image({ ID_spr_icons, icon, sVar(dx) + IntType(12), sVar(dy) + (sReal(tab_control_h) / 2.0), IntType(1), IntType(1), color, IntType(1) });
		draw_label(self, { text, sVar(dx) + IntType(32), sVar(dy) + (sReal(tab_control_h) / 2.0), fa_left, fa_middle, global::c_text_secondary, global::a_text_secondary, sInt(font_caption) });
		tab_next(self);
	}
	
	RealType draw_wheel(ScopeAny self, StringType name, VarType xx, VarType yy, VarType color, VarType value, RealType minval, RealType maxval, VarType def, RealType snapval, VarType tbx, IntType script, RealType rad, VarType sprite)
	{
		if (xx + rad < sVar(content_x) || xx - rad > sVar(content_x) + sVar(content_width) || yy + rad < sVar(content_y) || yy - rad > sVar(content_y) + sVar(content_height))
			return IntType(0);
		if (is_undefined(sprite))
			sprite = ID_spr_control_dial;
		RealType modval, labelx, labelw, labeltextw;
		IntType capwid;
		StringType text;
		VarType labely;
		context_menu_area(self, { xx - rad, yy - rad, rad * IntType(2), rad * IntType(2), /*"contextmenuvalue"*/ STR(1101), value, e_context_type_NUMBER, script, def });
		draw_set_font(sInt(font_label));
		modval = mod_fix(value, IntType(360));
		capwid = string_width(text_get({ name }) + /*":"*/ STR(790)) + IntType(5);
		text = string_decimals(value) + ObjType(obj_textbox, tbx)->suffix;
		draw_set_font(sInt(font_digits));
		labelw = rad;
		labeltextw = capwid + string_width(text);
		labelx = xx - (labeltextw / 2.0) + capwid;
		labely = yy + IntType(36);
		draw_image({ sprite, IntType(0), xx, yy, IntType(1), IntType(1), global::c_border, global::a_border });
		gpu_set_tex_filter(true);
		draw_image({ ID_spr_dial_dash, IntType(0), xx, yy, .5, .5, color, IntType(1), value + IntType(45) });
		gpu_set_tex_filter(false);
		if (sVar(window_busy) == name)
		{
			sInt(mouse_cursor) = cr_handpoint;
			RealType angle1, angle2;
			VarType newval;
			angle1 = point_direction(xx, yy, gmlGlobal::mouse_x, gmlGlobal::mouse_y);
			angle2 = point_direction(xx, yy, sVar(mouse_previous_x), sVar(mouse_previous_y));
			sVar(wheel_drag_value) += angle_difference_fix(angle1, angle2) * sReal(dragger_multiplier);
			if (global::_app->setting_unlimited_values > 0)
				newval = snap(sVar(wheel_drag_value), snapval);
			else
				newval = clamp(snap(sVar(wheel_drag_value), snapval), minval, maxval);
			
			script_execute(self, { script, newval - value, true });
			if (!sBool(mouse_left))
			{
				sVar(window_busy) = /*""*/ STR(0);
				app_mouse_clear(self);
			}
		}
		if (app_mouse_box(self, xx - rad, yy - rad, rad * IntType(2), rad * IntType(2)) && sBool(content_mouseon))
		{
			sInt(mouse_cursor) = cr_handpoint;
			if (sBool(mouse_left_pressed))
			{
				RealType newval = clamp(snap(value + angle_difference_fix(point_direction(xx, yy, gmlGlobal::mouse_x, gmlGlobal::mouse_y), value), snapval), minval, maxval);
				script_execute(self, { script, newval - value, true });
				sVar(window_focus) = name;
				sVar(window_busy) = name;
				sVar(wheel_drag_value) = newval;
			}
		}
		return 0.0;
	}
	
	RealType draw_wheel_sky(ScopeAny self, StringType name, VarType xx, VarType yy, VarType value, RealType def, IntType script, IntType tbx, RealType time)
	{
		RealType rad, sunx, suny, moonx, moony;
		BoolType mouseon, sunmouseon, moonmouseon;
		if (sBool(textbox_jump))
			ds_list_add({ sInt(textbox_list), ArrType::From({ tbx, sVar(content_tab), yy, sVar(content_y), sVar(content_height) }) });
		rad = IntType(49);
		if (xx + rad < sVar(content_x) || xx - rad > sVar(content_x) + sVar(content_width) || yy + rad < sVar(content_y) || yy - rad > sVar(content_y) + sVar(content_height))
			return IntType(0);
		mouseon = app_mouse_box(self, xx - rad, yy - rad, rad * IntType(2), rad * IntType(2)) && sBool(content_mouseon);
		context_menu_area(self, { xx - (rad + IntType(10)), yy - (rad + IntType(10)), (rad + IntType(10)) * IntType(2), (rad + IntType(10)) * IntType(2), /*"contextmenuvalue"*/ STR(1101), value, (time > 0) ? e_context_type_TIME : e_context_type_NUMBER, script, def });
		microani_set(name, script, mouseon, (sVar(window_busy) == name && !(sVar(wheel_drag_moon) > 0)), (sVar(window_focus) == string(tbx)), (sVar(window_busy) == name && sVar(wheel_drag_moon) > 0));
		VarType active;
		IntType color;
		RealType alpha;
		active = min({ IntType(1), global::microani_arr.Value(e_microani_PRESS) + global::microani_arr.Value(e_microani_ACTIVE) + global::microani_arr.Value(e_microani_DISABLED) });
		color = merge_color((IntType)(global::c_text_tertiary), (IntType)(global::c_text_secondary), min({ IntType(1), global::microani_arr.Value(e_microani_HOVER) + active }));
		alpha = lerp(global::a_text_tertiary, global::a_text_secondary, min({ IntType(1), global::microani_arr.Value(e_microani_HOVER) + active }));
		draw_image({ ID_spr_circle_96, IntType(0), xx, yy, IntType(1), IntType(1), color, alpha });
		color = merge_color((IntType)(global::c_text_secondary), (IntType)(global::c_text_main), global::microani_arr.Value(e_microani_HOVER));
		color = merge_color(color, (IntType)(global::c_accent), active);
		alpha = lerp(global::a_text_secondary, global::a_text_main, global::microani_arr.Value(e_microani_HOVER));
		alpha = lerp(alpha, 1.0, active);
		draw_label(self, { text_get({ name }), xx, yy - IntType(4), fa_center, fa_bottom, color, alpha, sInt(font_label) });
		color = merge_color((IntType)(global::c_text_secondary), (IntType)(global::c_text_main), global::microani_arr.Value(e_microani_PRESS));
		color = merge_color(color, (IntType)(global::c_accent), global::microani_arr.Value(e_microani_PRESS));
		alpha = lerp(global::a_text_secondary, global::a_text_main, global::microani_arr.Value(e_microani_PRESS));
		alpha = lerp(alpha, 1.0, global::microani_arr.Value(e_microani_PRESS));
		sunx = floor(xx + lengthdir_x(rad, value + 90.0));
		suny = floor(yy + lengthdir_y(rad, value + 90.0));
		sunmouseon = (app_mouse_box(self, sunx - IntType(10), suny - IntType(10), IntType(20), IntType(20)) && sBool(content_mouseon));
		draw_circle_ext(sunx, suny, IntType(14), false, IntType(16), global::c_level_middle, IntType(1));
		draw_image({ ID_spr_icons, icons_SUN, sunx, suny, IntType(1), IntType(1), color, alpha });
		color = merge_color((IntType)(global::c_text_secondary), (IntType)(global::c_text_main), global::microani_arr.Value(e_microani_DISABLED));
		color = merge_color(color, (IntType)(global::c_accent), global::microani_arr.Value(e_microani_DISABLED));
		alpha = lerp(global::a_text_secondary, global::a_text_main, global::microani_arr.Value(e_microani_DISABLED));
		alpha = lerp(alpha, 1.0, global::microani_arr.Value(e_microani_DISABLED));
		moonx = floor(xx + lengthdir_x(rad, value - IntType(90)));
		moony = floor(yy + lengthdir_y(rad, value - IntType(90)));
		moonmouseon = (app_mouse_box(self, moonx - IntType(10), moony - IntType(10), IntType(20), IntType(20)) && sBool(content_mouseon));
		draw_circle_ext(moonx, moony, IntType(14), false, IntType(16), global::c_level_middle, IntType(1));
		draw_image({ ID_spr_icons, icons_MOON, moonx, moony, IntType(1), IntType(1), color, alpha });
		microani_update({ mouseon || sunmouseon || moonmouseon, (sVar(window_busy) == name && !(sVar(wheel_drag_moon) > 0)), (sVar(window_focus) == string(tbx)), (sVar(window_busy) == name && sVar(wheel_drag_moon) > 0) });
		if (sunmouseon || moonmouseon)
		{
			sInt(mouse_cursor) = cr_handpoint;
			if (sBool(mouse_left_pressed))
			{
				sVar(window_focus) = name;
				sVar(window_busy) = name;
				sVar(wheel_drag_moon) = moonmouseon;
				if (!(sVar(wheel_drag_moon) > 0))
				{
					RealType add = angle_difference_fix(point_direction(xx, yy, gmlGlobal::mouse_x, gmlGlobal::mouse_y) - IntType(90), value);
					script_execute(self, { script, add, true });
				}
			}
		}
		if (sVar(window_busy) == name)
		{
			RealType angle1, angle2, add;
			sInt(mouse_cursor) = cr_handpoint;
			angle1 = point_direction(xx, yy, gmlGlobal::mouse_x, gmlGlobal::mouse_y) - IntType(90);
			angle2 = point_direction(xx, yy, sVar(mouse_previous_x), sVar(mouse_previous_y)) - IntType(90);
			add = angle_difference_fix(angle1, angle2);
			script_execute(self, { script, add, true });
			if (!sBool(mouse_left))
			{
				sVar(window_busy) = /*""*/ STR(0);
				app_mouse_clear(self);
			}
		}
		draw_set_font(sInt(font_value));
		VarType label;
		RealType labelw, labelx;
		if (time > 0)
			label = (sVar(window_focus) == string(tbx) ? ObjType(obj_textbox, tbx)->text : rotation_get_time(value));
		else
			label = (sVar(window_focus) == string(tbx) ? ObjType(obj_textbox, tbx)->text : VarType((string(value) + ObjType(obj_textbox, tbx)->suffix)));
		
		labelw = string_width(label);
		labelx = xx - labelw / 2.0;
		if (sVar(window_focus) == string(tbx))
		{
			if (textbox_draw(self, tbx, labelx, yy + IntType(4), labelw, IntType(18)))
			{
				if (time > 0)
					script_execute(self, { script, time_get_rotation(ObjType(obj_textbox, tbx)->text), false });
				else
					script_execute(self, { script, clamp(string_get_real(ObjType(obj_textbox, tbx)->text, IntType(0)), -no_limit, no_limit), false });
				
			}
		}
		else
			draw_label(self, { label, labelx, yy + IntType(4), fa_left, fa_top, global::c_text_main, global::a_text_main, sInt(font_value) });
		
		if (app_mouse_box(self, labelx, yy + IntType(4), labelw, IntType(16)))
		{
			sInt(mouse_cursor) = cr_handpoint;
			if (sBool(mouse_left_pressed))
			{
				if (time > 0)
					ObjType(obj_textbox, tbx)->text = rotation_get_time(value);
				else
					ObjType(obj_textbox, tbx)->text = string(value);
				
				sVar(window_focus) = string(tbx);
			}
		}
		return 0.0;
	}
	
	ArrType ds_list_create_array(VarType list)
	{
		ArrType arr = ArrType();
		for (IntType i = IntType(0); i < ds_list_size((IntType)(list)); i++)
		{
			if (is_array(DsList(list).Value(i)))
				array_add(VarType::CreateRef(arr), array_copy_1d(DsList(list).Value(i)), false);
			else
				array_add(VarType::CreateRef(arr), DsList(list).Value(i), false);
			
		}
		return arr;
	}
	
	void ds_list_delete_value(IntType list, VarType val)
	{
		IntType index = ds_list_find_index(list, val);
		if (index >= IntType(0))
			ds_list_delete(list, index);
	}
	
	void ds_list_merge(IntType list, VarType src)
	{
		for (IntType i = IntType(0); i < ds_list_size((IntType)(src)); i++)
			ds_list_add({ list, DsList(src).Value(i) });
	}
	
	BoolType ds_list_valid(VarType list)
	{
		return (is_real(list) && ds_exists(list, ds_type_list));
	}
	
	VarType ds_map_find_key(IntType map, VarType val)
	{
		VarType key = ds_map_find_first(map);
		while (!is_undefined(key))
		{
			if (DsMap(map).Value(key) == val)
				return key;
			key = ds_map_find_next(map, key);
		}
		
		return VarType();
	}
	
	void ds_map_merge(VarType map, VarType source, BoolType overwrite)
	{
		VarType key = ds_map_find_first((IntType)(source));
		while (!is_undefined(key))
		{
			if (overwrite || is_undefined(DsMap(map).Value(key)))
				DsMap(map)[key] = DsMap(source).Value(key);
			key = ds_map_find_next((IntType)(source), key);
		}
		
	}
	
	BoolType ds_map_valid(VarType map)
	{
		return (is_real(map) && ds_exists(map, ds_type_map));
	}
	
	VarType ease(VarType func, VarType xx)
	{
		RealType xx2, xxm1;
		xx2 = xx * IntType(2);
		xxm1 = xx - IntType(1);
		if (xx <= IntType(0))
			return IntType(0);
		if (xx >= IntType(1))
			return IntType(1);
		switch (StringType(func).id)
		{
			case 577: // linear
			{
				return xx;
			}
			case 578: // instant
			{
				return IntType(0);
			}
			case 580: // easeinquad
			{
				return xx * xx;
			}
			case 581: // easeoutquad
			{
				return -xx * (xx - IntType(2));
			}
			case 582: // easeinoutquad
			{
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * xx2 * xx2;
				return -1.0 / IntType(2) * ((xx2 - IntType(1)) * (xx2 - IntType(3)) - IntType(1));
			}
			case 583: // easeincubic
			{
				return xx * xx * xx;
			}
			case 584: // easeoutcubic
			{
				return ((xxm1) * xxm1 * xxm1 + IntType(1));
			}
			case 585: // easeinoutcubic
			{
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * xx2 * xx2 * xx2;
				return 1.0 / IntType(2) * ((xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) + IntType(2));
			}
			case 586: // easeinquart
			{
				return xx * xx * xx * xx;
			}
			case 587: // easeoutquart
			{
				return -((xxm1) * xxm1 * xxm1 * xxm1 - IntType(1));
			}
			case 588: // easeinoutquart
			{
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * xx2 * xx2 * xx2 * xx2;
				return -1.0 / IntType(2) * ((xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) - IntType(2));
			}
			case 589: // easeinquint
			{
				return xx * xx * xx * xx * xx;
			}
			case 590: // easeoutquint
			{
				return ((xxm1) * xxm1 * xxm1 * xxm1 * xxm1 + IntType(1));
			}
			case 591: // easeinoutquint
			{
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * xx2 * xx2 * xx2 * xx2 * xx2;
				return 1.0 / IntType(2) * ((xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) * (xx2 - IntType(2)) + IntType(2));
			}
			case 592: // easeinsine
			{
				return -cos(xx * (pi_ / 2.0)) + IntType(1);
			}
			case 593: // easeoutsine
			{
				return sin(xx * (pi_ / 2.0));
			}
			case 594: // easeinoutsine
			{
				return -1.0 / IntType(2) * (cos(pi_ * (RealType)xx / 1.0) - IntType(1));
			}
			case 595: // easeinexpo
			{
				return power(2.0, IntType(10) * (xx - IntType(1)));
			}
			case 596: // easeoutexpo
			{
				return -power(2.0, -IntType(10) * xx) + IntType(1);
			}
			case 597: // easeinoutexpo
			{
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * power(2.0, IntType(10) * (xx2 - IntType(1)));
				return 1.0 / IntType(2) * (-power(2.0, -IntType(10) * (xx2 - IntType(1))) + IntType(2));
			}
			case 598: // easeincirc
			{
				return -(sqrt(IntType(1) - xx * xx) - IntType(1));
			}
			case 599: // easeoutcirc
			{
				return sqrt(IntType(1) - (xxm1) * xxm1);
			}
			case 600: // easeinoutcirc
			{
				if (xx2 < IntType(1))
					return -1.0 / IntType(2) * (sqrt(IntType(1) - xx2 * xx2) - IntType(1));
				return 1.0 / IntType(2) * (sqrt(max({ IntType(0), IntType(1) - (xx2 - IntType(2)) * (xx2 - IntType(2)) })) + IntType(1));
			}
			case 601: // easeinelastic
			{
				RealType p = 0.3;
				RealType s = p / (IntType(2) * pi_) * arcsin(1.0);
				return -(power(2.0, IntType(10) * (xx - IntType(1))) * sin(((xx - IntType(1)) * IntType(1) - s) * (IntType(2) * pi_) / p));
			}
			case 602: // easeoutelastic
			{
				RealType p = 0.3;
				RealType s = p / (IntType(2) * pi_) * arcsin(1.0);
				return power(2.0, -IntType(10) * xx) * sin((xx * IntType(1) - s) * (IntType(2) * pi_) / p) + IntType(1);
			}
			case 603: // easeinoutelastic
			{
				RealType p = 0.3 * 1.5;
				RealType s = p / (IntType(2) * pi_) * arcsin(1.0);
				if (xx2 < IntType(1))
					return -0.5 * (power(2.0, IntType(10) * (xx2 - IntType(1))) * sin(((xx2 - IntType(1)) * IntType(1) - s) * (IntType(2) * pi_) / p));
				return power(2.0, -IntType(10) * (xx2 - IntType(1))) * sin(((xx2 - IntType(1)) * IntType(1) - s) * (IntType(2) * pi_) / p) * 0.5 + IntType(1);
			}
			case 604: // easeinback
			{
				RealType s = 1.70158;
				return xx * xx * ((s + IntType(1)) * xx - s);
			}
			case 605: // easeoutback
			{
				RealType s = 1.70158;
				return (xxm1 * xxm1 * ((s + IntType(1)) * xxm1 + s) + IntType(1));
			}
			case 606: // easeinoutback
			{
				RealType s = 1.70158;
				if (xx2 < IntType(1))
					return 1.0 / IntType(2) * (xx2 * xx2 * (((s * (1.525)) + IntType(1)) * xx2 - (s * (1.525))));
				return 1.0 / IntType(2) * ((xx2 - IntType(2)) * (xx2 - IntType(2)) * (((s * (1.525)) + IntType(1)) * (xx2 - IntType(2)) + (s * (1.525))) + IntType(2));
			}
			case 607: // easeinbounce
			{
				xx = IntType(1) - xx;
				if (xx < (1.0 / 2.75))
					return IntType(1) - (7.5625 * xx * xx);
				else
					if (xx < (2.0 / 2.75))
						return IntType(1) - (7.5625 * (xx - (1.5 / 2.75)) * (xx - (1.5 / 2.75)) + 0.75);
					else
						if (xx < (2.5 / 2.75))
							return IntType(1) - (7.5625 * (xx - (2.25 / 2.75)) * (xx - (2.25 / 2.75)) + 0.9375);
						else
							return IntType(1) - (7.5625 * (xx - (2.625 / 2.75)) * (xx - (2.625 / 2.75)) + 0.984375);
					
				
				
			}
			
			case 608: // easeoutbounce
			{
				if (xx < (1.0 / 2.75))
					return (7.5625 * xx * xx);
				else
					if (xx < (2.0 / 2.75))
						return (7.5625 * (xx - (1.5 / 2.75)) * (xx - (1.5 / 2.75)) + 0.75);
					else
						if (xx < (2.5 / 2.75))
							return (7.5625 * (xx - (2.25 / 2.75)) * (xx - (2.25 / 2.75)) + 0.9375);
						else
							return (7.5625 * (xx - (2.625 / 2.75)) * (xx - (2.625 / 2.75)) + 0.984375);
					
				
				
			}
			
			case 609: // easeinoutbounce
			{
				RealType ret;
				if (xx < 1.0 / 2.0)
				{
					xx *= 2.0;
					xx = IntType(1) - xx;
					if (xx < (1.0 / 2.75))
						ret = (7.5625 * xx * xx);
					else
						if (xx < (2.0 / 2.75))
							ret = (7.5625 * (xx - (1.5 / 2.75)) * (xx - (1.5 / 2.75)) + 0.75);
						else
							if (xx < (2.5 / 2.75))
								ret = (7.5625 * (xx - (2.25 / 2.75)) * (xx - (2.25 / 2.75)) + 0.9375);
							else
								ret = (7.5625 * (xx - (2.625 / 2.75)) * (xx - (2.625 / 2.75)) + 0.984375);
						
					
					
					ret = IntType(1) - ret;
					ret *= .5;
				}
				else
				{
					xx = xx * IntType(2) - IntType(1);
					if (xx < (1.0 / 2.75))
						ret = (7.5625 * xx * xx);
					else
						if (xx < (2.0 / 2.75))
							ret = (7.5625 * (xx - (1.5 / 2.75)) * (xx - (1.5 / 2.75)) + 0.75);
						else
							if (xx < (2.5 / 2.75))
								ret = (7.5625 * (xx - (2.25 / 2.75)) * (xx - (2.25 / 2.75)) + 0.9375);
							else
								ret = (7.5625 * (xx - (2.625 / 2.75)) * (xx - (2.625 / 2.75)) + 0.984375);
						
					
					
					ret *= 0.5;
					ret += 0.5;
				}
				
				return ret;
			}
			
		}
		
		return xx;
	}
	
	RealType ease_bezier_curve(ArrType p1, ArrType p2, ArrType p3, ArrType p4, RealType t)
	{
		if (t == IntType(0) || t == IntType(1))
			return t;
		RealType lower, upper, perc, xx, xxprev;
		VecType curve;
		lower = IntType(0);
		upper = IntType(1);
		perc = (upper + lower) / 2.0;
		curve = bezier_curve_cubic(p1, p2, p3, p4, perc);
		xx = curve.Real(X_);
		for (IntType i = IntType(0); i < IntType(10) && (abs(t - xx) >= 0.001); i++)
		{
			if (t > xx)
				lower = perc;
			else
				upper = perc;
			
			perc = (upper + lower) / 2.0;
			curve = bezier_curve_cubic(p1, p2, p3, p4, perc);
			xxprev = xx;
			xx = curve.Real(X_);
		}
		curve = bezier_curve_cubic(p1, p2, p3, p4, perc);
		return curve.Real(Y_);
	}
	
	IntType error(StringType name)
	{
		window_set_caption(text_get({ name + /*"caption"*/ STR(30) }));
		show_message(text_get({ name }));
		window_set_caption(/*""*/ STR(0));
		return null_;
	}
	
	VarType eval(VarType str, VarType def)
	{
		IntType i, values, ops;
		VarType result;
		StringType lastoperator;
		values = ds_stack_create();
		ops = ds_stack_create();
		lastoperator = /*""*/ STR(0);
		for (i = IntType(1); i < string_length(str) + IntType(1); i++)
		{
			StringType char_ = string_char_at(str, i);
			if (char_ == /*" "*/ STR(21))
				continue;
			else
				if (char_ == /*"("*/ STR(1128))
				{
					if (lastoperator == /*"--"*/ STR(1129))
						ds_stack_push({ ops, /*"-("*/ STR(1130) });
					else
						ds_stack_push({ ops, /*"("*/ STR(1128) });
					
					lastoperator = /*""*/ STR(0);
				}
				else
					if (eval_is_digit(char_))
					{
						RealType val, dec, decamount;
						BoolType deccheck;
						val = IntType(0);
						dec = IntType(0);
						deccheck = false;
						decamount = IntType(0);
						while (i < (string_length(str) + IntType(1)) && eval_is_digit(string_char_at(str, i)))
						{
							if (string_char_at(str, i) == /*"."*/ STR(1131))
							{
								deccheck = true;
								i++;
								continue;
							}
							if (deccheck)
							{
								dec = (dec * IntType(10)) + real(string_char_at(str, i));
								decamount++;
							}
							else
								val = (val * IntType(10)) + real(string_char_at(str, i));
							
							i++;
						}
						
						i--;
						if (decamount > IntType(0))
							dec /= power(10.0, decamount);
						if (lastoperator == /*"--"*/ STR(1129))
							ds_stack_push({ values, -(val + dec) });
						else
							ds_stack_push({ values, val + dec });
						
						lastoperator = /*""*/ STR(0);
					}
					else
						if (char_ == /*")"*/ STR(1132))
						{
							while (!ds_stack_empty(ops) && !(ds_stack_top(ops) == /*"("*/ STR(1128) || ds_stack_top(ops) == /*"-("*/ STR(1130)))
							{
								VarType val2, val1, op;
								val2 = ds_stack_top(values);
								ds_stack_pop(values);
								val1 = ds_stack_top(values);
								ds_stack_pop(values);
								op = ds_stack_top(ops);
								ds_stack_pop(ops);
								ds_stack_push({ values, eval_solve(val1, val2, op) });
							}
							
							if (!ds_stack_empty(ops))
							{
								if (ds_stack_top(ops) == /*"-("*/ STR(1130))
								{
									VarType val = -ds_stack_top(values);
									ds_stack_pop(values);
									ds_stack_push({ values, val });
								}
								ds_stack_pop(ops);
							}
							lastoperator = /*""*/ STR(0);
						}
						else
						{
							if (lastoperator != /*""*/ STR(0) && char_ == /*"-"*/ STR(1133))
							{
								lastoperator = /*"--"*/ STR(1129);
								continue;
							}
							while (!ds_stack_empty(ops) && eval_precedence(ds_stack_top(ops)) >= eval_precedence(char_))
							{
								VarType val2, val1, op;
								val2 = ds_stack_top(values);
								ds_stack_pop(values);
								val1 = ds_stack_top(values);
								ds_stack_pop(values);
								op = ds_stack_top(ops);
								ds_stack_pop(ops);
								ds_stack_push({ values, eval_solve(val1, val2, op) });
							}
							
							ds_stack_push({ ops, char_ });
							lastoperator = char_;
						}
					
				
			
			
		}
		while (!ds_stack_empty(ops))
		{
			VarType val2, val1, op;
			val2 = ds_stack_top(values);
			ds_stack_pop(values);
			val1 = ds_stack_top(values);
			ds_stack_pop(values);
			op = ds_stack_top(ops);
			ds_stack_pop(ops);
			ds_stack_push({ values, eval_solve(val1, val2, op) });
		}
		
		result = ds_stack_top(values);
		ds_stack_destroy(values);
		ds_stack_destroy(ops);
		if (result == VarType())
			return def;
		else
			return result;
		
		return VarType();
	}
	
	VarType eval_solve(RealType a, RealType b, StringType op)
	{
		if (a == VarType() && b != VarType() && op == /*"-"*/ STR(1133))
			a = IntType(0);
		if (a == VarType() || b == VarType() || op == VarType())
			return VarType();
		switch (StringType(op).id)
		{
			case 1134: // +
			{
				return a + b;
			}
			case 1133: // -
			{
				return a - b;
			}
			case 1135: // *
			{
				return a * b;
			}
			case 20: // /
			{
				return b != IntType(0) ? a / b : 0.0;
			}
			case 1136: // ^
			{
				return power(a, b);
			}
			case 220: // %
			{
				return (mod(a, b));
			}
		}
		
		return VarType();
	}
	
	BoolType eval_is_digit(StringType char_)
	{
		ArrType digits = ArrType::From({ /*"0"*/ STR(1094), /*"1"*/ STR(1137), /*"2"*/ STR(1138), /*"3"*/ STR(1139), /*"4"*/ STR(1140), /*"5"*/ STR(1141), /*"6"*/ STR(1142), /*"7"*/ STR(1143), /*"8"*/ STR(1144), /*"9"*/ STR(1145), /*"."*/ STR(1131) });
		for (IntType i = IntType(0); i < array_length(VarType::CreateRef(digits)); i++)
			if (char_ == digits.Value(i))
				return true;
		return false;
	}
	
	RealType eval_precedence(StringType op)
	{
		switch (StringType(op).id)
		{
			case 1133: // -
			case 1134: // +
			{
				return IntType(1);
			}
			case 20: // /
			case 1135: // *
			case 220: // %
			{
				return IntType(2);
			}
			case 1136: // ^
			{
				return IntType(3);
			}
		}
		
		return IntType(0);
	}
	
	void execute(VarType file, VarType parameters, VarType wait)
	{
		log({ /*"execute"*/ STR(1146), file, parameters, wait });
		lib_execute(file, parameters, wait);
	}
	
	void export_done_image(ScopeAny self)
	{
		render_free();
		surface_free((IntType)(sVar(export_surface)));
		sVar(export_surface) = null_;
		sStr(window_state) = /*""*/ STR(0);
		global::render_watermark = false;
		global::render_background = true;
		global::render_hidden = false;
		toast_new(self, e_toast_POSITIVE, text_get({ /*"alertexportimage"*/ STR(1147) }));
		toast_add_action(self, /*"alertexportimageview"*/ STR(1148), ID_popup_open_url, sStr(export_filename));
	}
	
	void export_done_movie(ScopeAny self, BoolType cancel)
	{
		VarType fn;
		render_free();
		if (sStr(exportmovie_format) != /*"png"*/ STR(64))
		{
			movie_done();
			buffer_delete(sInt(exportmovie_buffer));
		}
		surface_free((IntType)(sVar(export_surface)));
		sVar(export_surface) = null_;
		sStr(window_state) = /*""*/ STR(0);
		global::render_watermark = false;
		global::render_background = true;
		global::render_hidden = false;
		sVar(timeline_marker) = sVar(exportmovie_marker_previous);
		if (sStr(exportmovie_format) == /*"png"*/ STR(64))
			fn = filename_new_ext(sStr(export_filename), /*""*/ STR(0)) + /*"_1.png"*/ STR(1149);
		else
			fn = sStr(export_filename);
		
		if (!cancel)
		{
			toast_new(self, e_toast_POSITIVE, text_get({ /*"alertexportmovie"*/ STR(1150) }));
			toast_add_action(self, /*"alertexportmovieview"*/ STR(1151), ID_popup_open_url, fn);
		}
	}
	
	RealType export_update(ScopeAny self)
	{
		if (keyboard_check(vk_escape) && sInt(export_escape_time) == IntType(0))
			sInt(export_escape_time) = current_time();
		if (sInt(export_escape_time) > IntType(0) && current_time() - sInt(export_escape_time) > IntType(1000))
		{
			sInt(export_escape_time) = IntType(0);
			if (question(text_get({ /*"questionstoprender"*/ STR(1152) })))
			{
				if (sStr(window_state) == /*"export_movie"*/ STR(53))
					export_done_movie(self, true);
				else
					if (sStr(window_state) == /*"export_image"*/ STR(60))
					{
						surface_save_lib(sVar(export_surface), sStr(export_filename));
						export_done_image(self);
					}
				
				return IntType(0);
			}
		}
		if (sStr(window_state) == /*"export_movie"*/ STR(53))
		{
			if (global::render_samples == -IntType(1))
			{
				sVar(timeline_marker) = sVar(exportmovie_marker_start) + (sReal(exportmovie_frame) / ObjType(obj_popup, sInt(popup_exportmovie))->framespersecond) * sVar(project_tempo);
				if (sVar(timeline_marker) > sVar(exportmovie_marker_end))
				{
					export_done_movie(self);
					return IntType(0);
				}
				app_update_animate(self);
			}
		}
		if (sStr(window_state) == /*"export_image"*/ STR(60))
			app_update_cameras(ObjType(obj_popup, sInt(popup_exportimage))->high_quality, false);
		if (sStr(window_state) == /*"export_movie"*/ STR(53))
		{
			global::render_active = /*"movie"*/ STR(1153);
			global::render_quality = ((sReal(exportmovie_high_quality) > 0) ? e_view_mode_RENDER : e_view_mode_SHADED);
		}
		else
		{
			global::render_active = /*"image"*/ STR(94);
			global::render_quality = ((ObjType(obj_popup, sInt(popup_exportimage))->high_quality > 0) ? e_view_mode_RENDER : e_view_mode_SHADED);
		}
		
		if (sStr(window_state) == /*"export_movie"*/ STR(53) && sStr(exportmovie_format) == /*"png"*/ STR(64))
			render_start({ sVar(export_surface), sInt(timeline_camera) });
		else
			render_start({ sVar(export_surface), sInt(timeline_camera), sVar(project_video_width), sVar(project_video_height) });
		
		if (global::render_quality == e_view_mode_RENDER)
			render_high(self);
		else
		{
			render_low(self);
			global::render_samples_done = true;
		}
		
		sVar(export_surface) = render_done();
		sReal(export_sample)++;
		if (global::render_quality == e_view_mode_RENDER && global::render_samples == global::_app->project_render_samples)
			global::render_samples_done = true;
		if (!global::render_samples_done)
			return IntType(1);
		global::render_active = null_;
		global::render_samples = -IntType(1);
		if (sStr(window_state) == /*"export_movie"*/ STR(53))
		{
			if (sStr(exportmovie_format) == /*"png"*/ STR(64))
			{
				RealType totalframes = ceil(((sVar(exportmovie_marker_end) - sVar(exportmovie_marker_start)) / sVar(project_tempo)) * ObjType(obj_popup, sInt(popup_exportmovie))->framespersecond);
				IntType totallen = string_length(string(totalframes));
				StringType numstr = string(sReal(exportmovie_frame) + IntType(1));
				numstr = string_repeat(/*"0"*/ STR(1094), (IntType)((totallen - string_length(numstr)))) + numstr;
				surface_save_lib(sVar(export_surface), filename_new_ext(sStr(export_filename), /*""*/ STR(0)) + /*"_"*/ STR(1154) + numstr + /*".png"*/ STR(10));
			}
			else
			{
				if (!is_cpp())
				{
					buffer_get_surface(sInt(exportmovie_buffer), (IntType)(sVar(export_surface)), IntType(0));
					buffer_save(sInt(exportmovie_buffer), temp_file);
				}
				VarType err = movie_frame(temp_file);
				if (err < IntType(0))
				{
					export_done_movie(self);
					log({ /*"Error when adding frame, error code"*/ STR(1155), err });
					error(/*"errorexportmovie"*/ STR(72));
					return IntType(0);
				}
			}
			
			sReal(exportmovie_frame)++;
			global::current_step += round(60.0 / ObjType(obj_popup, sInt(popup_exportmovie))->framespersecond);
		}
		if (sStr(window_state) == /*"export_image"*/ STR(60))
		{
			surface_save_lib(sVar(export_surface), sStr(export_filename));
			export_done_image(self);
		}
		return IntType(1);
	}
	
	StringType filename_get_unique(StringType fn)
	{
		IntType num;
		StringType newfn, path, ext;
		VarType noext;
		num = IntType(2);
		newfn = fn;
		path = filename_dir(fn) + /*"/"*/ STR(20);
		noext = filename_new_ext(filename_name(fn), /*""*/ STR(0));
		ext = filename_ext(filename_name(fn));
		while (file_exists_lib(newfn))
			newfn = path + noext + /*" ("*/ STR(1156) + string(num++) + /*")"*/ STR(1132) + ext;
		
		return newfn;
	}
	
	VarType filename_get_valid(VarType fn)
	{
		fn = string_replace_all(fn, /*"/"*/ STR(20), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"\\"*/ STR(1077), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*":"*/ STR(790), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"*"*/ STR(1135), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"?"*/ STR(1157), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"\""*/ STR(1158), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"<"*/ STR(1159), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*">"*/ STR(1160), /*"_"*/ STR(1154));
		fn = string_replace_all(fn, /*"|"*/ STR(886), /*"_"*/ STR(1154));
		while (string_char_at(fn, string_length(fn)) == /*" "*/ STR(21))
			fn = string_copy(fn, IntType(1), (IntType)(string_length(fn) - IntType(1)));
		
		return fn;
	}
	
	VarType filename_new_ext(VarType fn, StringType newext)
	{
		IntType p;
		for (p = string_length(fn); p >= IntType(0); p--)
		{
			StringType c = string_char_at(fn, p);
			if (p == IntType(0) || c == /*"\\"*/ STR(1077) || c == /*"/"*/ STR(20))
				return fn + newext;
			if (c == /*"."*/ STR(1131))
				break;
		}
		return string_copy(fn, IntType(1), (IntType)(p - IntType(1))) + newext;
	}
	
	RealType file_copy_lib(VarType src, VarType dest)
	{
		if (src == dest)
			return IntType(0);
		return lib_file_copy(src, dest);
	}
	
	VarType file_delete_lib(StringType fn)
	{
		return lib_file_delete(fn);
	}
	
	StringType file_dialog_open(VarType filter, StringType filename, StringType directory, VarType title)
	{
		return string(get_open_filename_ext(filter, filename, directory, title));
	}
	
	StringType file_dialog_open_asset()
	{
		return file_dialog_open_multiple(text_get({ /*"filedialogopenasset"*/ STR(1161) }) + /*"|"*/ STR(886) + asset_exts, /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenassetcaption"*/ STR(1162) }));
	}
	
	StringType file_dialog_open_font()
	{
		return file_dialog_open(text_get({ /*"filedialogopenfont"*/ STR(1163) }) + /*" (*.ttf)|*.ttf"*/ STR(1164), /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenfontcaption"*/ STR(1165) }));
	}
	
	StringType file_dialog_open_image()
	{
		return file_dialog_open(text_get({ /*"filedialogopenimage"*/ STR(1166) }) + /*" (*.png; *.jpg; *.dat)|*.png;*.jpg;*.jpeg;*.dat;"*/ STR(1167), /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenimagecaption"*/ STR(1168) }));
	}
	
	StringType file_dialog_open_image_pack()
	{
		return file_dialog_open(text_get({ /*"filedialogopenimageorpack"*/ STR(1169) }) + /*" (*.png; *.jpg; *.zip)|*.png;*.jpg;*.jpeg;*.zip"*/ STR(1170), /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenimageorpackcaption"*/ STR(1171) }));
	}
	
	StringType file_dialog_open_language()
	{
		return file_dialog_open(text_get({ /*"filedialogopenlanguage"*/ STR(1172) }) + /*" (*.milanguage;*.txt)|*.milanguage;*.txt"*/ STR(1173), /*""*/ STR(0), languages_directory, text_get({ /*"filedialogopenlanguagecaption"*/ STR(1174) }));
	}
	
	StringType file_dialog_open_model()
	{
		return file_dialog_open(text_get({ /*"filedialogopenmodel"*/ STR(1175) }) + /*" (*.mimodel;*.json;*.zip)|*.mimodel;*.json;*.zip"*/ STR(1176), /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenmodelcaption"*/ STR(1177) }));
	}
	
	StringType file_dialog_open_multiple(VarType filter, StringType filename, StringType directory, VarType title)
	{
		return string(get_open_filename_ext(filter, filename, directory, title));
	}
	
	StringType file_dialog_open_pack()
	{
		return file_dialog_open(text_get({ /*"filedialogopenpack"*/ STR(1178) }) + /*" (*.zip)|*.zip"*/ STR(1179), /*""*/ STR(0), /*""*/ STR(0), text_get({ /*"filedialogopenpackcaption"*/ STR(1180) }));
	}
	
	StringType file_dialog_open_particles()
	{
		return file_dialog_open(text_get({ /*"filedialogopenparticles"*/ STR(1181) }) + /*" (*.miparticles; *.zip; *.particles)|*miparticles;*.zip;*.particles;"*/ STR(1182), /*""*/ STR(0), particles_directory, text_get({ /*"filedialogopenparticlecaption"*/ STR(1183) }));
	}
	
}
