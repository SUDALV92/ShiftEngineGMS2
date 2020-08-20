if( !instance_exists( TargetId ) || TargetId.ShiftInternal_MoveYCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    TargetId.y = ystart + DeltaY;
    instance_destroy();
    exit;
}

var tweenPos = script_execute( Smoother, 0, 1, Step, Duration );
TargetId.y = ystart + tweenPos * DeltaY;

