function player_direction( source_x, source_y )
{
	if( instance_exists( oPlayer ) )
	{
		return point_direction( source_x, source_y, oPlayer.x, oPlayer.y );
	}
	else
		return random( 360 );
}