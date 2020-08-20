/// @description  button_check_pressed( keyIndex )
/// @param  keyIndex 
function button_check_pressed(argument0) {
	var keyCode = global.InpuKeyCodes[argument0];
	return keyboard_check_pressed( keyCode );



}
