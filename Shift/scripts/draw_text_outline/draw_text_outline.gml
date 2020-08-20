/// @description  draw_text_outline( textX, textY, textStr, opt_textColor, opt_outlineColor )
/// @param  textX
/// @param  textY
/// @param  textStr
/// @param  opt_textColor
/// @param  opt_outlineColor 
function draw_text_outline() {
	var textX = argument[0];
	var textY = argument[1];
	var textStr = argument[2];

	var textColor = c_white;
	if( argument_count > 3 ) {
	    textColor = argument[3];
	} 
	var outlineColor = c_black;
	if( argument_count > 4 ) {
	    outlineColor = argument[4];
	}

	//draw the text outline
	draw_set_color( outlineColor );
	draw_text( textX - 1, textY + 1,string_hash_to_newline(textStr) );
	draw_text( textX - 1, textY, string_hash_to_newline(textStr) );
	draw_text( textX - 1, textY - 1, string_hash_to_newline(textStr) );
	draw_text( textX + 1, textY + 1, string_hash_to_newline(textStr) );
	draw_text( textX + 1, textY, string_hash_to_newline(textStr) );
	draw_text( textX + 1, textY - 1, string_hash_to_newline(textStr) );
	draw_text( textX, textY + 1, string_hash_to_newline(textStr) );
	draw_text( textX, textY - 1, string_hash_to_newline(textStr) );

	//draw the text itself
	draw_set_color( textColor );
	draw_text( textX, textY, string_hash_to_newline(textStr) );
	draw_set_color( c_white );



}
