var t = Avoidance.Step;

if( t % 100 == 0 ) {
    repeat( 100 ) {
        var fruit = instance_create_depth( 400, 304, 0, oAvoidanceFruit );
        fruit.direction = random( 360 );
        fruit.speed = random_range( 4, 6 );
    }
}

