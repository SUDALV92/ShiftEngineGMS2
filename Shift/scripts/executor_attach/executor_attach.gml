// Create a mechanism that calls a given script.
// The executor is attached to a given instance or to all instances of a given object.
// The targetScript is run every executePeriod frames.
// A non-integer can be passed as executePeriod, in this case the execution will be 
// averaged across frames to match the executePeriod as closely as poosible.
// Duration in frames can be specified. By default the executor exists until the executor or its parent are explicitly destroyed.
// The executor instance is returned if it was attached to a single instance. 
// Otherwise undefined is returned.
// An Executor field is created in the owner instance that references the executor instance.
function executor_attach(ownerId, executePeriod, targetScript, executeDuration = undefined )
{
	var resultExecutor = noone;
	with( ownerId ) {
	    var executor = instance_create_depth( x, y, 0, oAttachedExecutor );
	    executor.OwnerInstance = id;
	    executor.Period = executePeriod;
	    executor.CurrentPhase = 1;
	    executor.TargetScript = targetScript;
	    executor.Duration = executeDuration;
	    Executor = executor;
	    if( resultExecutor == noone ) {
	        resultExecutor = executor;
	    } else {
	        resultExecutor = undefined;
	    }
	}
	return resultExecutor;
}
