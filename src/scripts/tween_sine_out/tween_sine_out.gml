/// @description  tween_sine_out( beginValue, totalDelta, step, duration );
/// @param  beginValue
/// @param  totalDelta
/// @param  step
/// @param  duration 
var beginValue = argument0;
var totalDelta = argument1;
var step = argument2;
var duration = argument3;

return beginValue + totalDelta * sin( ( pi / 2 ) * step / duration );
