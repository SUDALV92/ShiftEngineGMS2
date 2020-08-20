for( var i = 0; i < FadeCount; i++ ) {
    var targetId = FadeList[i];
    if( instance_exists( targetId ) ) {
        targetId.image_alpha -= AlphaDelta;
        if( targetId.image_alpha <= 0 ) {
            with( targetId ) {
                instance_destroy();
            }
        }
    }
}

