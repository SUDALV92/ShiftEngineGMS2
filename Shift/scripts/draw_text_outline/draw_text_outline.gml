function draw_text_outline( textX, textY, textStr, textColor = c_white, outlineColor = c_black )
{
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
