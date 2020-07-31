if( !instance_exists( TargetId ) || TargetId.ShiftInternal_ScaleChangeCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var scale = script_execute( Smoother, StartScale, ScaleDelta, Duration, Duration );
    TargetId.image_xscale = scale;
    TargetId.image_yscale = scale;
    instance_destroy();
    exit;
}

var scale = script_execute( Smoother, StartScale, ScaleDelta, Step, Duration );
TargetId.image_xscale = scale;
TargetId.image_yscale = scale;

