function tween_back_in( beginValue, totalDelta, step, duration )
{
	var s = 1.70158;
	var tRatio = step / duration;
	return beginValue + totalDelta * tRatio * tRatio * ( ( s + 1 ) * tRatio - s );
}