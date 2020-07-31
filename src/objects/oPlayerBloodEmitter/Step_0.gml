/// @description  Emit blood

repeat( 30 ) {
    with( instance_create_depth(x, y, 0, oPlayerBlood ) ) {
        gravity = ( 0.1 + random( 0.2 ) ) * other.GravityDir;
        direction = random( 360 );
        speed = random( 8 );
    }
}


