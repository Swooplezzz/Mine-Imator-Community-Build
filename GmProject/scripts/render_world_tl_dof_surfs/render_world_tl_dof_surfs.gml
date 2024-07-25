// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function render_world_tl_dof_surfs(){
if (setting_overlay_view_shapes)
{
	// Shapes
	with (obj_timeline)
	{
		with (app)
		{

			var tl = other.id;
			if (tl.hide || !tl.value_inherit[e_value.VISIBLE])
				continue
	
			if (tl.type = e_tl_type.CAMERA && tl.selected && setting_overlay_camera_frustum && tl.value[e_value.CAM_DOF]){
				var ratio, sizemath;
	ratio = (tl.value[e_value.CAM_WIDTH] / tl.value[e_value.CAM_HEIGHT]) * tl.value[e_value.CAM_ASPECT]
	sizemath = tan(degtorad(tl.value[e_value.CAM_FOV] * 0.5)) // Multiply this by distance
	
	var dofnear, doffar, dofblurnear, dofblurfar;
	dofnear = min(cam_far, max(cam_near, tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]))
	doffar = min(cam_far, max(cam_near, tl.value[e_value.CAM_DOF_DEPTH] + tl.value[e_value.CAM_DOF_RANGE]))
	dofblurnear = min(cam_far, max(cam_near, (tl.value[e_value.CAM_DOF_DEPTH] - tl.value[e_value.CAM_DOF_RANGE]) - tl.value[e_value.CAM_DOF_FADE_SIZE]))
	
			}
		}
	}
}
}