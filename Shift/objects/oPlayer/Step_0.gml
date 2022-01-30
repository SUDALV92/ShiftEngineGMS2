/// @description  Movement

var prevAnimationState = AnimationState;

var h = 0; // Default (player not moving)

// Checking input.
if( global.LrAnywhere ) {
    L = button_check_direct( global.LeftKeyBind );
    R = button_check_direct( global.RightKeyBind );
} else {
    L = button_check( global.LeftKeyBind );
    R = button_check( global.RightKeyBind );
}

if( !Frozen ) {
    if( R && L ) {
        // Move to the most recently pressed direction.
        h = -LastMoveDir;
    } else if( R ) {
        LastMoveDir = 1;
        h = 1;
    } else if( L ) {
        LastMoveDir = -1;
        h = -1;
    } else {
        LastMoveDir = 1;
    }
}

// Collision checks.
var floorBlock = instance_place( x, y + GravityDir, oBlock );
var floorConveyor = instance_place( x, y + GravityDir, oConveyor );
var onVineL = floorBlock == noone && place_meeting( x - 1, y, oVineL );
var onVineR = floorBlock == noone && place_meeting( x + 1, y, oVineR );

var inWater1 = place_meeting( x, y, oWater1 );
var inWater2 = place_meeting( x, y, oWater2 );
var inWater3 = place_meeting( x, y, oWater3 );

// Movement.
if( h != 0 ) {
    // Setting the direction the player is facing.
    if( !onVineL && !onVineR ) {
        Dir = h; 
    }
    // Setting speed.
    hspeed = Hscap * h; 
    // Running state.
    AnimationState = 1;
} else {
    // Stop moving.
    hspeed = 0; 
    // Idle sprite.
    AnimationState = 0;
}

if( !OnPlatform ) {
    // Air animation state.
    var fallDir = vspeed * GravityDir;
    if( fallDir < 0 ) {
        // Jumping.
        AnimationState = 2;   
    } else if( floorBlock == noone ) {
        // Falling.
        AnimationState = 3;
    }
} else {
    // Platform Magic.
    if( !place_meeting( x, y + 6 * GravityDir, oPlatform ) ) {
        OnPlatform = false;
    }
}

// Conveyor Magic.
if( floorConveyor != noone ) {
    hspeed += floorConveyor.Cspeed; 
}

// Player controlled movement.
if( !Frozen ) {
    if( global.Debug ) {
        if( global.AdTrick && floorBlock != noone ) {
            if( button_check_pressed( global.NudgeLeftKeyBind ) ) {
                hspeed -= 1;
            } else if( button_check_pressed( global.NudgeRightKeyBind ) ) {
                hspeed += 1;
            }
        }
        if( button_check( global.DragDebugKeyBind ) ) {
            x = mouse_x; 
            xprevious = x;
            y = mouse_y; 
            yprevious = y;
            vspeed = 0;
            HFrameStep = 0;
        }
    }
    if( button_check_pressed( global.JumpKeyBind ) ) {
        var aboveBlock = ( floorBlock != noone );
        var abovePlatform = place_meeting( x, y + GravityDir, oPlatform );
        var touchingWater1 = inWater1 || place_meeting( x, y + GravityDir, oWater1 );
        var touchingWater2 = inWater2 || place_meeting( x, y + GravityDir, oWater2 );
        var touchingWater3 = inWater3 || place_meeting( x, y + GravityDir, oWater3 );
        if( OnPlatform || abovePlatform || aboveBlock || touchingWater1 ) {
            vspeed = -Jump1; // First jump
            CurrentAirJumpCount = MaxAirJumpCount; // Make sure you can air jump afterwards
            HFrameStep = 0;
            play_sound( seJump ); // Jump sound
        } else if( CurrentAirJumpCount != 0 || global.DebugInfiniteJump || touchingWater2 || touchingWater3 ) { 
            if( touchingWater3 ) {
                CurrentAirJumpCount = MaxAirJumpCount;
            } else if( touchingWater2 ) {
                CurrentAirJumpCount = max( 0, CurrentAirJumpCount - 1 );
            } else {
                CurrentAirJumpCount--;
            }
            vspeed = -Jump2; // Air jump height
            HFrameStep = 0;
            AnimationState = 2;
            play_sound( seJump2 ); // Air jump sound
        }
    }
    if( button_check_released( global.JumpKeyBind ) ) {
        if( vspeed * GravityDir < 0 ) {
            // Jump released
            vspeed *= 0.45;
            HFrameStep = 0; 
        }
    }
    if( button_check_pressed( global.ShootKeyBind ) ) {
        if( instance_number( oBullet ) < global.BulletCap ) {
            with( instance_create_depth( x, y - 3, depth, oBullet ) ) { // Create bullet
                Shooter = other.id;
                hspeed = other.Dir * 11; // Set speed (16px/f)
                alarm[0] = 96; // Destroy in 96 frames
                play_sound( seShoot ); // Play sound
            }
        }
    }
    if( global.CanSuicide && button_check_pressed( global.SuicideKeyBind ) ) {
        player_kill();
    }
}

if( onVineL || onVineR ) {
    // Setting (inverse) player direction.
    if( onVineR ) {
        Dir = -1;
    } else {
        Dir = 1;
    }
    // Setting sliding speed
    vspeed = 2 * GravityDir;
    HFrameStep = 0;
    // Sliding sprite.
    AnimationState = 4;
    
    if( ( onVineL && button_check_pressed( global.RightKeyBind ) ) ||
        ( onVineR && button_check_pressed( global.LeftKeyBind ) ) )
    {
        if( button_check( global.JumpKeyBind ) ) {
            // Jumping off from vines.
            // Jumpoff hspeed.
            if( onVineR ) {
                hspeed = -10;
            } else {
                hspeed = 10;
            } 
            // Jumpoff vspeed.
            vspeed = -6 * GravityDir; 
            // Play vine-jump sound.
            play_sound( seJump3 ); 
            // Jumping sprite.
            AnimationState = 2;
        } else {
            // Falling off from vines.
            if( onVineR ) {
                hspeed = -2; 
            } else {
                hspeed = 2;
            }
            AnimationState = 3;
        }
    } else if( global.ShowVineParticles ) {
        var particleX;
        var particleY;
        var particleDir;
        if( onVineL ) {
            particleX = bbox_left;
            particleY = y;
            particleDir = random_range( -90, 60 );
        } else {
            particleX = bbox_right;
            particleY = y;
            particleDir = random_range( 120, 180 );
        }
        var particle = instance_create_depth( particleX, particleY, depth - 1, oVineParticle );
        particle.direction = particleDir;
    }
}

// Water Physics
if( inWater1 || inWater2 || inWater3 ) {
    if( vspeed * GravityDir > 2 ) {
        vspeed = 2 * GravityDir;
        HFrameStep = 0;
    }
}

// Room Edge - Death, Switching or Wrapping
if( global.WrapPlayerX ) {
    while( x > room_width ) {
        x -= room_width;
    }
    while( x < 0 ) {
        x += room_width;
    }
}
if( global.WrapPlayerY ) {
    while( y > room_height ) {
        y -= room_height;
    }
    while( y < 0 ) {
        y += room_height;
    }
}

// Check for screen edge.
if( !global.God && global.KillPlayerOnEdge && ( x > room_width || x < 0 || y > room_height || y < 0 ) ) {
    player_kill();
}

// Calculate key frames for vertical movement.
if( HFrameStep == 0 ) {
    var timeModifier = 120 / 50;
    var spaceModifier = 1250 / 800;
    var adjustedSpeed = vspeed * timeModifier;
    var adjustedGrav = Gravity * spaceModifier;
    VKeyDeltas[1] = adjustedSpeed + adjustedGrav;
    VKeyDeltas[2] = VKeyDeltas[1] + adjustedSpeed + 2 * adjustedGrav;
    VKeyDeltas[3] = VKeyDeltas[2] + adjustedSpeed + 3 * adjustedGrav;
    VKeyDeltas[4] = VKeyDeltas[3] + adjustedSpeed + 4 * adjustedGrav;
    VKeyDeltas[5] = VKeyDeltas[4] + adjustedSpeed + 5 * adjustedGrav;
    PrevVKeyDelta = 0;
}
HFrameStep++;
if( HFrameStep == 12 ) {
    HFrameStep = 0;
    vspeed = VKeyDeltas[5] - PrevVKeyDelta;
} else {
    var framePos = HFrameStep * 5 / 12;
    var keyPos = floor( framePos );
    var fractPos = frac( framePos );
    var newKDelta = lerp( VKeyDeltas[keyPos], VKeyDeltas[keyPos + 1], fractPos );
    vspeed = newKDelta - PrevVKeyDelta;
    PrevVKeyDelta = newKDelta;
}

// Vspeed capping.
if( abs( vspeed ) > Vscap ) {
    vspeed = sign( vspeed ) * Vscap;
}

update_kid_sprite( prevAnimationState );