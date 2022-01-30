/// @description  Debug: Change V-Align

if( !Frozen ) {
    if( global.Debug && button_check_pressed( global.VAlignDebugKeyBind ) ) {
        var vf = floor( y );
        var va = y - vf;
        var newVa = get_integer( "New V-Align:", va );
        if( newVa >= 0 ) {
            y = vf + newVa;
        }
    }
}



#region COLLISION oBlock
if(place_meeting(x,y,oBlock))
{
	// Move back to before the kid was moved.
	x = xprevious;
	y = yprevious;

	var horizontalCollision = ( instance_place( x + hspeed, y, oBlock ) != noone );
	var verticalCollision = ( instance_place( x, y + vspeed, oBlock ) != noone );
	// Snap to blocks horizontally.
	if( horizontalCollision && hspeed != 0 ) {
	    while( instance_place( x + sign( hspeed ), y, oBlock ) == noone ) {
	        x += sign( hspeed );
	    }
	    hspeed = 0;
	}

	// Snap to blocks vertically.
	if( verticalCollision ) {
	    if( vspeed != 0 ) {
	        while( instance_place( x, y + sign( vspeed ), oBlock ) == noone ) {
	            y += sign( vspeed );
	        }
	    }
    
	    var isLanding = ( GravityDir == 1 && vspeed >= 0 ) || ( GravityDir == -1 && vspeed <= 0 );
	    if( isLanding ) {
	        CurrentAirJumpCount = MaxAirJumpCount;
	    }
	    vspeed = 0;
	    HFrameStep = 0;
	}

	// Check if the block is positioned strictly diagonally from the kid. 
	// Stop horizontal movement to avoid collision in that case.
	if( !horizontalCollision && !verticalCollision ) {
	    hspeed = 0;
	}
	x += hspeed;
	y += vspeed;
}
#endregion
#region COLLISION oPlatform
if(place_meeting(x,y,oPlatform))
{
	if( GravityDir == 1 ) {
	    if( y - vspeed / 2 <= other.y ) {
	        y += other.bbox_top - bbox_bottom - 1;
	        vspeed = other.vspeed;
	        HFrameStep = 0;
	        OnPlatform = true;
	        CurrentAirJumpCount = MaxAirJumpCount;
	    }
	} else {
	    if( y - vspeed / 2 >= other.y + 23 ) {
	        y += other.bbox_bottom - bbox_top + 1;
	        vspeed = other.vspeed;
	        HFrameStep = 0;
	        OnPlatform = true;
	        CurrentAirJumpCount = MaxAirJumpCount;
	    }
	}
}
#endregion
#region COLLISION oKiller
if(place_meeting(x,y,oKiller))
{
	/// @description  Death check
	var playerId = id;
	var killer = other.id;
	// Check direct killer commands.
	with( oKillerInstanceActivationCommand ) {
	    if( KillerId == killer ) {
	        if( IsActive ) {
	            with( playerId ) {
	                player_kill();
	            }
	        }
	        exit;
	    }   
	}
	// Check object killer commands.
	var objectId = killer.object_index;
	do {
	    with( oKillerObjectActivationCommand ) {
	        if( KillerId == objectId ) {
	            if( IsActive ) {
	                with( playerId ) {
	                    player_kill();
	                }
	            }
	            exit;
	        }
	    }
	    objectId = object_get_parent( objectId );
	} until( objectId == -100 );

	// No relevant killer commands found, kill the player by default.
	player_kill();
}
#endregion
#region COLLISION oAvoidanceKiller
if(place_meeting(x,y,oAvoidanceKiller))
{
	/// @description  Death check

	var playerId = id;
	var killer = other.id;
	// Check direct killer commands.
	with( oKillerInstanceActivationCommand ) {
	    if( KillerId == killer ) {
	        if( IsActive ) {
	            with( playerId ) {
	                player_kill();
	            }
	        }
	        exit;
	    }   
	}
	// Check object killer commands.
	var objectId = killer.object_index;
	do {
	    with( oKillerObjectActivationCommand ) {
	        if( KillerId == objectId ) {
	            if( IsActive ) {
	                with( playerId ) {
	                    player_kill();
	                }
	            }
	            exit;
	        }
	    }
	    objectId = object_get_parent( objectId );
	} until( objectId == -100 );

	// No relevant killer commands found, kill the player by default.
	player_kill();
}
#endregion