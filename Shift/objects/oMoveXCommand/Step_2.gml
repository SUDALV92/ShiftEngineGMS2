if( !instance_exists( TargetId ) || TargetId.ShiftInternal_MoveXCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    TargetId.x = xstart + DeltaX;
    instance_destroy();
    exit;
}

var tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.x = xstart + tweenPos * DeltaX;

