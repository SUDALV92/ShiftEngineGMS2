/// @description  Keys

check_common_hotkeys();

// Exit game.
if( button_check_pressed( global.ExitKeyBind ) ) {
    game_end();
}
// Restart the room.
if( button_check_pressed( global.RestartKeyBind ) ) {
    restart_game();
}
// Debug hotkeys.
if( global.Debug ) {
    // Godmode.
    if( button_check_pressed( global.GodDebugKeyBind ) ) {
        global.God = !global.God;
    }
    
    // Save state.
    if( button_check_pressed( global.SaveDebugKeyBind ) ) {
        save_game();
        play_sound( seShoot );
    }
    
    // Flip gravity.
    if ( button_check_pressed( global.FlipDebugKeyBind ) ) {
        player_flip();
    }
    
    // Room--.
    if( button_check_pressed( global.PrevRoomDebugKeyBind ) ) {
        if( room_exists( room - 1  ) ) {
            if( room - 1 != rInit ) {
                room_goto( room - 1 );
            }
        }
    // Room++.
    } else if ( button_check_pressed( global.NextRoomDebugKeyBind ) ) {
        if( room_exists( room + 1 ) ) {
            room_goto( room + 1 );
        }
    }
    
    // Reveal/hide hitbox.
    if( button_check_pressed( global.HitboxDebugKeyBind ) ) {
        global.DrawHitbox = !global.DrawHitbox;
    }
    
    // Reveal/hide triggers.
    if( button_check_pressed( global.ShowTriggersDebugKeyBind ) ) {
        global.DebugShowTriggers = !global.DebugShowTriggers;
        with( oTrigger ) {
            visible = global.DebugShowTriggers;
        }
    }
    
    // Debug UI Toggle.
    if( button_check_pressed( global.ToggleUiDebugKeyBind ) ) {
        global.DebugGui = !global.DebugGui;
    }
}

// Set sprite interpolation for the current frame.
gpu_set_texfilter( global.SmoothTextures ); 

