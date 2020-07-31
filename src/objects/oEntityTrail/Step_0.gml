if( TrailCount <= 0 ) {
    exit;
}

if( !instance_exists( Owner ) ) {
    if( PrevImageAngles[PrevPositionsIndex] == -1000000 ) {
        instance_destroy();
    } else {
        PrevPositionsX[PrevPositionsIndex] = -1000000;
        PrevPositionsY[PrevPositionsIndex] = -1000000;
        PrevImageAngles[PrevPositionsIndex] = -1000000;
    }
} else {
    PrevPositionsX[PrevPositionsIndex] = Owner.x;
    PrevPositionsY[PrevPositionsIndex] = Owner.y;
    PrevImageAngles[PrevPositionsIndex] = Owner.image_angle;
}

PrevPositionsIndex++;
if( PrevPositionsIndex >= MaxTrailCount ) {
    PrevPositionsIndex = 0;
}

