if( !instance_exists( TargetId ) || TargetId.ShiftInternal_ChangeDirectionCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    var tweenPos = script_execute( Smoother, 0, 1, Duration, Duration );
    TargetId.direction = StartDirection + tweenPos * DeltaDirection;
    instance_destroy();
    exit;
}

var tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.direction = StartDirection + tweenPos * DeltaDirection;

