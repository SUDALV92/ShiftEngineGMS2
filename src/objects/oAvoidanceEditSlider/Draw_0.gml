var avoidance = global.ActiveAvoidance;
var step = avoidance.Step;

var relPos = step / avoidance.Duration;
relPos = clamp( relPos, 0, 1 );
var pxOffset = relPos * EditSliderLength;

var sliderBarX = EditSliderLeft + pxOffset;
var sliderBarY = EditSliderY;
var sliderBarWidth = 4;
var sliderBarHeight = 20;
var tickLineHeight = 40;

var sliderLineRadius = 2;
var sliderLeftLineWidth = pxOffset - EditSliderLeft;
var sliderLeftLineHeight = 2;

draw_set_colour( c_white );
draw_rectangle( sliderBarX, EditSliderY - sliderLineRadius, EditSliderRight, EditSliderY + sliderLineRadius, false );
draw_set_colour( c_lime );
draw_rectangle( EditSliderLeft, EditSliderY - sliderLineRadius, sliderBarX, EditSliderY + sliderLineRadius, false );
draw_set_colour( c_white );
draw_rectangle( sliderBarX - sliderBarWidth / 2, sliderBarY + sliderBarHeight / 2, sliderBarX + sliderBarWidth / 2, sliderBarY - sliderBarHeight / 2, false );

// Timing ticks.
var timingsList = oAvoidancePersistentData.TimingsList;
var count = ds_list_size( timingsList );
for( var i = 0; i < count; i++ ) {
    var tickStep = timingsList[|i];
    var tickColor = c_white;
    if( i == ActiveTickPos ) {
        tickColor = c_yellow;
    } else if( step > tickStep ) {
        tickColor = c_lime;
    }
    var tickRelPos = tickStep / avoidance.Duration;
    tickRelPos = clamp( tickRelPos, 0, 1 );
    var tickPxPos = EditSliderLeft + tickRelPos * EditSliderLength;
    draw_set_color( tickColor );
    draw_rectangle( tickPxPos, EditSliderY - tickLineHeight / 2, tickPxPos, EditSliderY + tickLineHeight / 2, false );
}

draw_set_colour( c_white );

