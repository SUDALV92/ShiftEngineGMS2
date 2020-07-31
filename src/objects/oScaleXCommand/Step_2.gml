if( !instance_exists( TargetId ) || TargetId.ShiftInternal_XScaleChangeCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var scale = script_execute( Smoother, StartScaleX, ScaleDeltaX, Duration, Duration );
    TargetId.image_xscale = scale;
    instance_destroy();
    exit;
}

var scale = script_execute( Smoother, StartScaleX, ScaleDeltaX, Step, Duration );
TargetId.image_xscale = scale;

