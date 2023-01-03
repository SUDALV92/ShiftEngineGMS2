// Bounce off of block instances. Specific block objects may be passed as a target of bouncing.
// This script needs to be called every step for the bouncing effect.
function instance_bounce_block( blockObject = oBlock ) 
{
	with( blockObject ) {
	    solid = true;
	}
	move_bounce_solid( true );
	with( blockObject ) {
	    solid = false;
	}
}