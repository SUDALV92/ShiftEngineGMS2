/// @description  avoidance_set_step( newStep )
/// @param  newStep 
var newStep = argument0;
with( oAvoidanceEntity ) {
    instance_destroy();
}
with( oExecutor ) {
    instance_destroy();
}

global.ActiveAvoidance.Step = newStep;
