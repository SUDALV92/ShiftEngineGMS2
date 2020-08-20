/// @description  delete_save_data( slotIndex )
/// @param  slotIndex 
function delete_save_data(argument0) {
	var saveIndex = argument0;

	var fileName = get_save_file_name( saveIndex );
	if( file_exists( fileName ) ) {
	    file_delete( fileName );
	}



}
