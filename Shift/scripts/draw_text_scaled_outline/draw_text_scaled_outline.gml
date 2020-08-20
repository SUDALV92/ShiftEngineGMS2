/// @description  draw_text_scaled_outline( textX, textY, scaleX, scaleY, textStr, textColor = c_white, outlineColor = c_black )
/// @param  textX
/// @param  textY
/// @param  scaleX
/// @param  scaleY
/// @param  textStr
/// @param  textColor = c_white
/// @param  outlineColor = c_black 
function draw_text_scaled_outline() {
	var textX = argument[0];
	var textY = argument[1];
	var scaleX = argument[2];
	var scaleY = argument[3];
	var textStr = argument[4];

	var textColor = c_white;
	if( argument_count > 5 ) {
	    textColor = argument[5];
	} 
	var outlineColor = c_black;
	if( argument_count > 6 ) {
	    outlineColor = argument[6];
	}

	//draw the text outline
	draw_set_color( outlineColor );
	draw_text_transformed( textX - 1, textY + 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX - 1, textY, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX - 1, textY - 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX + 1, textY + 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX + 1, textY, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX + 1, textY - 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX, textY + 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_text_transformed( textX, textY - 1, string_hash_to_newline(textStr), scaleX, scaleY, 0 );

	//draw the text itself
	draw_set_color( textColor );
	draw_text_transformed( textX, textY, string_hash_to_newline(textStr), scaleX, scaleY, 0 );
	draw_set_color( c_white );



}
