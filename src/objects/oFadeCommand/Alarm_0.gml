/// @description  Destroy any remaining instances.

for( var i = 0; i < FadeCount; i++ ) {
    with( FadeList[i] ) {
        instance_destroy();
    }
}
instance_destroy();

