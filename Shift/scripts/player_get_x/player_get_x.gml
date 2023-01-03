function player_get_x( valueIfNotExistMin = 0, valueIfNotExistMax = 1250 )
{
	if( instance_exists( oPlayer ) )
		return oPlayer.x;
	else
		return irandom_range( valueIfNotExistMin, valueIfNotExistMax );
}