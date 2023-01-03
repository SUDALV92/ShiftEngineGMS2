function draw_text_scaled_outline( textX, textY, scaleX, scaleY, textStr, textColor = c_white, outlineColor = c_black)
{
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
