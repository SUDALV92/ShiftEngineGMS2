/// @description  Collision

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
        CurrentAirJumpCount = AirJumpCount;
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


