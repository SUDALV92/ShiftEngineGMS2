if( !instance_exists( TargetId ) || TargetId.ShiftInternal_YScaleChangeCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var scale = script_execute( Smoother, StartScaleY, ScaleDeltaY, Duration, Duration );
    TargetId.image_yscale = scale;
    instance_destroy();
    exit;
}

var scale = script_execute( Smoother, StartScaleY, ScaleDeltaY, Step, Duration );
TargetId.image_yscale = scale;

