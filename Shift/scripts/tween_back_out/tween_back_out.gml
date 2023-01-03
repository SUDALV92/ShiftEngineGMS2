function tween_back_out( beginValue, totalDelta, step, duration )
{
	var s = 1.70158;
	var tRatio = step / duration - 1;

	return beginValue + totalDelta * ( 1 + tRatio * tRatio * ( ( s + 1 ) * tRatio + s ) );
}