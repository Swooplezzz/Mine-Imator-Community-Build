/// block_set_bed()

function block_set_bed()
{
	if (block_get_state_id_value(block_current, block_state_id_current, "part") = "head")
		return null
	
	return 0
}
