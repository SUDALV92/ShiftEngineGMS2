if( !instance_exists( TargetId ) || TargetId.ShiftInternal_RotateImageCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var tweenPos = script_execute( Smoother, 0, 1, Duration, Duration );
    TargetId.image_angle = StartDirection + tweenPos * DeltaDirection;
    instance_destroy();
    exit;
}

var tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.image_angle = StartDirection + tweenPos * DeltaDirection;

