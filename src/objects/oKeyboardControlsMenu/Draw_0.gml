draw_set_valign( fa_center );
draw_set_font( fMenuDescriptionFont );

var lineHeight = 48;
var menuHeight = lineHeight * ( HighKeyCount + 1 );
var menuVMargin = ( RectHeight - menuHeight ) / 2;
var rLeft = x - RectWidth / 2;
var rRight = rLeft + RectWidth;
var rTop = y - RectHeight / 2;
var rBottom = rTop + RectHeight;

var menuHMargin = ( RectWidth - ColumnCount * ValueOptionLineWidth ) / ( ColumnCount + 1 )
var menuLeft = rLeft + menuHMargin;
var lineWidth = ValueOptionLineWidth + menuHMargin;

draw_set_color( RectColor );
draw_rectangle( rLeft, rBottom, rRight, rTop, false );
draw_set_color( BorderColor );
draw_rectangle( rLeft, rBottom, rRight, rTop, true );
draw_set_color( c_white );

for( var i = 0; i < KeybindCount; i++ ) {
    // Find column and position.
    var columnIndex = 0;
    var columnPos = i;
    for( var j = 0; j < ColumnCount; j++ ) {
        if( columnPos < ColumnKeyCount[j] ) {
            columnIndex = j;
            break;
        }
        columnPos -= ColumnKeyCount[j];
    }
    var optionX = menuLeft + columnIndex * lineWidth;
    var optionY = rTop + menuVMargin + columnPos * lineHeight;
    var fontColor = OptionColor;
    var keyValueStr = get_virtual_key_name( KeyCodes[i] );
    var keyValueWidth = string_width( string_hash_to_newline(keyValueStr) );
    var tickMargin = 20;
    if( i == ActiveOptionPos ) {
        if( IsKeyScanActive ) {
            fontColor = ScannedKeyColor;
        } else {
            fontColor = ActiveOptionColor;
        }
    }
    
    if( i == ActiveOptionPos ) {
        draw_sprite( sMenuTick, TickImageIndex, optionX - tickMargin, optionY );
        draw_sprite( sMenuTick, TickImageIndex, optionX + ValueOptionLineWidth + tickMargin, optionY );
    }
    draw_set_halign( fa_left );
    draw_text_outline( optionX, optionY, KeyNames[i], fontColor );  
    draw_set_halign( fa_right );
    draw_text_outline( optionX + ValueOptionLineWidth, optionY, keyValueStr, fontColor );  
}

// Back option text.
draw_set_font( fMenuOptionFont );
draw_set_halign( fa_center );
draw_set_valign( fa_center );
var optionX = x;
var optionY = rTop + menuVMargin + lineHeight * HighKeyCount + 40;
var fontColor = OptionColor;
if( OptionCount - 1 == ActiveOptionPos ) {
    fontColor = ActiveOptionColor;
    var margin = 20;
    var optionWidth = string_width( string_hash_to_newline("Back") );
    draw_sprite( sMenuTick, TickImageIndex, optionX - optionWidth / 2 - margin, optionY );
    draw_sprite( sMenuTick, TickImageIndex, optionX + optionWidth / 2 + margin, optionY );
}   
draw_text_outline( optionX, optionY, "Back", fontColor );  

draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_color( c_white );

