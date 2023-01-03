/// @description 
if( IsBouncing )
{
	if( place_meeting( x, y + 1, oBlock ) )
	{
		vspeed = -abs(vspeed);	
	}
	if( place_meeting( x, y - 1, oBlock ) )
	{
		vspeed = abs(vspeed);	
	}
	if( place_meeting( x - 1, y, oBlock ) )
	{
		hspeed = abs(hspeed);	
	}
	if( place_meeting( x + 1, y, oBlock ) )
	{
		hspeed = -abs(hspeed);	
	}
}