// Cleanup commands for destroyed instances.
if( !object_exists( KillerId ) && !instance_exists( KillerId ) ) {
    instance_destroy();
}

