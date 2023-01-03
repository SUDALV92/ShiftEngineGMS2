function player_get_y( valueIfNotExistMin = 0, valueIfNotExistMax = 950 )
{
	if( instance_exists( oPlayer ) )
		return oPlayer.y;
	else
		return irandom_range( valueIfNotExistMin, valueIfNotExistMax );
}