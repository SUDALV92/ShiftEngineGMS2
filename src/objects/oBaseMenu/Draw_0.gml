if( !surface_exists( MenuSurface ) ) {
    MenuSurface = surface_create( RectWidth, RectHeight );
    surface_set_target( MenuSurface );
    draw_clear_alpha( c_black, 1 );
} else {
    surface_set_target( MenuSurface );
}

gpu_set_colorwriteenable( true, true, true, false );
draw_set_valign( fa_center );
draw_set_font( fMenuOptionFont );

var lineHeight = 48;
var menuHeight = lineHeight * OptionCount;
var menuMargin = ( RectHeight - menuHeight ) / 2;
draw_set_color( RectColor );
draw_rectangle( 0, RectHeight, RectWidth, 0, false );
draw_set_color( BorderColor );
draw_rectangle( 0, RectHeight, RectWidth, 0, true );
draw_set_color( c_white );

for( var i = 0; i < OptionCount; i++ ) {
    var optionX = RectWidth / 2;
    var optionY = menuMargin + lineHeight / 2 + i * lineHeight;
    var fontColor = OptionColor;
    var tickMargin = 20;
    if( OptionDisabled[i] ) {
        fontColor = DisabledOptionColor;
    } else if( i == ActiveOptionPos ) {
        fontColor = ActiveOptionColor;
    }
    
    if( OptionValues[i] == "" ) {
        if( i == ActiveOptionPos ) {
            var optionWidth = string_width( string_hash_to_newline(MenuOptions[i]) );
            draw_sprite( sMenuTick, TickImageIndex, optionX - optionWidth / 2 - tickMargin, optionY );
            draw_sprite( sMenuTick, TickImageIndex, optionX + optionWidth / 2 + tickMargin, optionY );
        }   
        draw_set_halign( fa_center );
        draw_text_outline( optionX, optionY, MenuOptions[i], fontColor );        
    } else {
        var lineHWidth = ValueOptionLineWidth / 2;
        if( i == ActiveOptionPos ) {
            draw_sprite( sMenuTick, TickImageIndex, optionX - lineHWidth - tickMargin, optionY );
            draw_sprite( sMenuTick, TickImageIndex, optionX + lineHWidth + tickMargin, optionY );
        }
        draw_set_halign( fa_left );
        draw_text_outline( optionX - lineHWidth, optionY, MenuOptions[i], fontColor );  
        draw_set_halign( fa_right );
        draw_text_outline( optionX + lineHWidth, optionY, OptionValues[i], fontColor );  
    }
}

draw_set_halign( fa_left );
draw_set_valign( fa_top );
draw_set_color( c_white );
gpu_set_colorwriteenable( true, true, true, true );

surface_reset_target();
var rLeft = x - RectWidth / 2;
var rTop = y - RectHeight / 2;
draw_surface_ext( MenuSurface, rLeft, rTop, image_xscale, image_yscale, image_angle, image_blend, image_alpha );
draw_set_alpha( 1 );

