for( var i = 0; i < Shift_EntityCount; i++ ) {
    if( instance_exists( Shift_Entities[i] ) ) {
        alarm[0] = 75;
        exit;
    }
}

// No entities with this circle exist, destroy the circle instance.
instance_destroy();

