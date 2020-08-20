if( !instance_exists( TargetId ) || TargetId.ShiftInternal_AlphaChangeCommand != id ) {
    instance_destroy();
    exit;
}

Step++;
if( Step >= Duration ) {
    TargetId.image_alpha = script_execute( Smoother, StartAlpha, DeltaAlpha, Duration, Duration );
    instance_destroy();
    exit;
}

TargetId.image_alpha = script_execute( Smoother, StartAlpha, DeltaAlpha, Step, Duration );

