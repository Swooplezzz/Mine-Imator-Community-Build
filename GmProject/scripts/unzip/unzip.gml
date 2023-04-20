/// unzip(filename, [directory])
/// @arg filename
/// @arg [directory]

function unzip()
{
	var fn, dir;
	fn = argument[0]
	dir = unzip_directory
	if (argument_count > 1)
		dir = argument[1]
	
	var ret = directory_delete_lib(dir);
	directory_create_lib(dir)
	
	log("Unzipping", fn, dir)
	var num = external_call(lib_unzip, fn, dir)
	log(string(num) + " files were extracted")
	return num
}
