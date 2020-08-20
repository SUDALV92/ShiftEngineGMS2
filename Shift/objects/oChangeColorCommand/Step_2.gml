if( !instance_exists( TargetId ) || TargetId.ShiftInternal_ColorChangeCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var blendFactor = script_execute( Smoother, 0, 1, Duration, Duration );
    TargetId.image_blend = merge_colour( StartColor, EndColor, blendFactor );
    instance_destroy();
    exit;
}

var blendFactor = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.image_blend = merge_colour( StartColor, EndColor, blendFactor );

