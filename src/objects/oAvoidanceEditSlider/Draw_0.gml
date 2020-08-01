var avoidance = global.ActiveAvoidance;
var step = avoidance.Step;
var cam = view_get_camera(0);

var editSliderY = camera_get_view_y(cam) + SliderVMargin;
var editSliderLeft = camera_get_view_x(cam) + SliderHMargin;
var editSliderRight = camera_get_view_x(cam) + camera_get_view_width(cam) - SliderHMargin;
var editSliderLength = editSliderRight - editSliderLeft;

var relPos = step / avoidance.Duration;
relPos = clamp( relPos, 0, 1 );
var pxOffset = relPos * editSliderLength;

var sliderBarX = editSliderLeft + pxOffset;
var sliderBarY = editSliderY;
var sliderBarWidth = 4;
var sliderBarHeight = 20;
var tickLineHeight = 40;

var sliderLineRadius = 2;
var sliderLeftLineWidth = pxOffset - editSliderLeft;
var sliderLeftLineHeight = 2;

draw_set_colour( c_white );
draw_rectangle( sliderBarX, editSliderY - sliderLineRadius, editSliderRight, editSliderY + sliderLineRadius, false );
draw_set_colour( c_lime );
draw_rectangle( editSliderLeft, editSliderY - sliderLineRadius, sliderBarX, editSliderY + sliderLineRadius, false );
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
    var tickPxPos = editSliderLeft + tickRelPos * editSliderLength;
    draw_set_color( tickColor );
    draw_rectangle( tickPxPos, editSliderY - tickLineHeight / 2, tickPxPos, editSliderY + tickLineHeight / 2, false );
}

draw_set_colour( c_white );