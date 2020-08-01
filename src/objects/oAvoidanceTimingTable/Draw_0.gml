var timingsList = oAvoidancePersistentData.TimingsList;
var avoidance = global.ActiveAvoidance;
var step = avoidance.Step;
var cam = view_get_camera(0);
var panelX = camera_get_view_x(cam) + PanelXOffset;
var panelY = camera_get_view_y(cam) + PanelYOffset;

if( TableFreezeTiming != -1 ) {
    step = TableFreezeTiming;
}

var count = ds_list_size( timingsList );
var displayCount = 0;
for( var i = 0; i < count; i++ ) {
    var currentStep = timingsList[|i];
    if( currentStep > step - TimingDisplayDelay ) {
        var timingAlpha;
        var timingColor;
        if( currentStep < step ) {
            var alphaDiff = ( step - currentStep ) / TimingDisplayDelay;
            var colorDiff = ( step - currentStep ) / TimingDisplayDelay;
            timingAlpha = 1 - alphaDiff;    
            timingColor = merge_color( c_lime, c_white, colorDiff );
        } else {
            var timingPosition = clamp( ( currentStep - step ) / 5, 0, 1 );
            timingColor = merge_color( c_lime, c_white, timingPosition );
            timingAlpha = 1;
        }
        var lineY = panelY + displayCount * LineHeight;
        var timingStr = "Step: " + string( currentStep );
        draw_set_alpha( timingAlpha );
        draw_text_outline( panelX, lineY, timingStr, timingColor, c_black );
        displayCount++;
    }
    if( displayCount > MaxLineDisplayCount ) {
        break;
    }
}

draw_set_alpha( 1 );
var mouseLinePos = floor( ( mouse_y - panelY + 5 ) / LineHeight );
var lineLeft = panelX + SelectionRectLeft;
var lineRight = panelX + SelectionRectRight;
var lineTop = panelY + mouseLinePos * LineHeight - 5;
var lineBottom = lineTop + LineHeight;
if( mouse_x >= lineLeft && mouse_x < lineRight + 2 * CrossRectHWidth && mouseLinePos >= 0 && mouseLinePos < displayCount ) {
    draw_set_color( c_white );
    draw_rectangle( lineLeft, lineBottom, lineRight, lineTop, true );
    var crossX = lineRight + CrossRectHWidth;
    var crossY = ( lineBottom + lineTop ) / 2;
    var crossLeft = crossX - CrossRectHWidth;
    var crossRight = crossX + CrossRectHWidth;
    var crossTop = crossY - CrossRectHHeight;
    var crossBottom = crossY + CrossRectHHeight;
    var crossColor;
    if( abs( mouse_x - crossX ) < CrossRectHWidth && abs( mouse_y - crossY ) < CrossRectHHeight ) {
        crossColor = c_yellow;
    } else {
        crossColor = c_white;
    }
    draw_sprite_ext( sUiCross, 0, crossX, crossY, 1, 1, 0, crossColor, 1 );
    draw_set_color( crossColor );
    draw_rectangle( crossLeft, crossBottom, crossRight, crossTop, true );
    draw_set_color( c_white );
    TableFreezeTiming = step;
} else {
    TableFreezeTiming = -1;
}