/// tl_value_is_obj(valueid)
/// @arg valueid

function tl_value_is_obj(vid)
{
	return (vid = e_value.TEXT_FONT ||
			vid = e_value.SOUND_OBJ ||
			vid = e_value.PATH_OBJ ||
			vid = e_value.IK_TARGET ||
			vid = e_value.ROT_TARGET ||
			vid = e_value.LOOK_AT_TARGET ||
			vid = e_value.POS_TARGET ||
			vid = e_value.SCALE_TARGET ||
			vid = e_value.BEND_IK_TARGET ||
			vid = e_value.IK_TARGET_ANGLE)
}
