/// tab_control(height)
/// @arg height

function tab_control(height = 0)
{
	tab_control_h = height
	
	if (tab_collumns)
	{
		dw = (tab_collumns_width - ((tab_collumns_count - 1) * 8)) / tab_collumns_count
		dx = tab_collumns_start_x + ceil(dw * (tab_collumns_index)) + (8 * tab_collumns_index)
	}
}
