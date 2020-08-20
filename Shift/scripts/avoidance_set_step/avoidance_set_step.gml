/// @description  avoidance_set_step( newStep )
/// @param  newStep 
function avoidance_set_step(argument0) {
	var newStep = argument0;
	with( oAvoidanceEntity ) {
	    instance_destroy();
	}
	with( oExecutor ) {
	    instance_destroy();
	}

	global.ActiveAvoidance.Step = newStep;



}
