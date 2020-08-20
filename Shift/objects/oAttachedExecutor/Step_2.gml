if( !instance_exists( OwnerInstance ) ) {
    instance_destroy();
    exit;
}

x = OwnerInstance.x;
y = OwnerInstance.y;
event_inherited();

