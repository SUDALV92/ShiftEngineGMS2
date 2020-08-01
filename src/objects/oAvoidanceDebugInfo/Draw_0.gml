if( global.Debug ) {
    var avoidance = global.ActiveAvoidance;
	var cam = view_get_camera(0);
    var panelX = camera_get_view_x(cam) + camera_get_view_width(cam) - 200;
    var panelY = camera_get_view_y(cam) + 88;
    var lineHeight = 16;
    
    var step = avoidance.Step;
    draw_set_font( fDebugFont );
    draw_set_halign( fa_left );
    draw_set_valign( fa_top );
    draw_text_outline( panelX, panelY, "Frame: " + string( step ), c_white, c_black );
    var secondsCount = floor( step / room_speed mod 60 );
    var secondsStr;
    if( secondsCount < 10 ) {
        secondsStr = "0" + string( secondsCount );
    } else {
        secondsStr = string( secondsCount );
    }
    draw_text_outline( panelX, panelY + lineHeight, "Time: " + string( floor( step / room_speed / 60 ) ) + ":" + string( secondsStr ), c_white, c_black );
    draw_text_outline( panelX, panelY + 2 * lineHeight, "Count: " + string( instance_count ), c_white, c_black );
    
    var volumeX = camera_get_view_x(cam) + 350;
    var volumeY = camera_get_view_y(cam) + 88;
    draw_set_alpha( MusicVolumeAlpha );
    var volumeLevel = round( 100 * avoidance.MusicVolume );
    draw_text_outline( volumeX, volumeY, "Music: " + string( volumeLevel ) + "%", c_lime, c_black );
    draw_set_alpha( 1 );
}

