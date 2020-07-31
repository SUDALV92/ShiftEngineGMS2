if( !IsActive ) {
    exit;
}
IsActive = false;
// Call OnTrigger.
if( script_exists( OnTrigger ) ) {
    script_execute( OnTrigger );
}

// Call a custom event.
event_user( TriggerEventId );
// Also call it for all linked instances.
with( LinkedId ) {
    event_user( other.TriggerEventId );
}

