// Flips player gravity.
function player_flip()
{
	with( oPlayer )
	{
	    GravityDir = -GravityDir;
	    if( global.GiveAirJumpsOnFlip ) {
	        CurrentAirJumpCount = MaxAirJumpCount;
	    }
	    vspeed = 0;
	    Jump1 = abs( Jump1 ) * GravityDir;
	    Jump2 = abs( Jump2 ) * GravityDir;
	    Gravity = abs( Gravity ) * GravityDir;
	    HFrameStep = 0;
	    set_mask();
    
	    // Prevent getting stuck on flip, move out of blocks
	    while( instance_place( x, y, oBlock ) != noone ) {
	        y += GravityDir;
	    }
	}
}
