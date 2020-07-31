/// @description  Platform Magic

if( GravityDir == 1 ) {
    if( y - vspeed / 2 <= other.y ) {
        y += other.bbox_top - bbox_bottom - 1;
        vspeed = other.vspeed;
        HFrameStep = 0;
        OnPlatform = true;
        CurrentAirJumpCount = AirJumpCount;
    }
} else {
    if( y - vspeed / 2 >= other.y + 23 ) {
        y += other.bbox_bottom - bbox_top + 1;
        vspeed = other.vspeed;
        HFrameStep = 0;
        OnPlatform = true;
        CurrentAirJumpCount = AirJumpCount;
    }
}


