// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_screen_resolution()
{
	switch( global.ScreenResolution )
	{
		case ScreenResoultion.Default:
		default:
			window_set_size( 1250, 950 );
			break;
		case ScreenResoultion.Legacy:
			window_set_size( 800, 608 );
			break;
	}
}