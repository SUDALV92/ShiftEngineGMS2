if( button_check_pressed( global.MenuSelectKeyBind ) ) {
    with( oMainMenu ) {
        visible = true;
        alarm[0] = 1;
        image_alpha = 0;
        instance_change_alpha( id, 1, 10 );
    }
    instance_destroy();
}

