function tween_back_inout( beginValue, totalDelta, step, duration )
{
	var s = 1.70158 * 1.525;
	var tRatio = step / duration;

	if( tRatio < 0.5 ) {
	    return 2 * tRatio * tRatio * ( ( s + 1 ) * 2 * tRatio - s );
	} else {
	    tRatio -= 1;
	    return 2 * tRatio * tRatio * ( ( s + 1 ) * 2 * tRatio + s + 2 );
	}
}