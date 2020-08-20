/// @description  Emit blood

repeat( 30 ) {
    with( instance_create_depth(x, y, depth, oPlayerBlood ) ) {
        gravity = ( 0.08 + random( 0.15 ) ) * other.GravityDir;
        direction = random( 360 );
        speed = random( 5 );
    }
}


