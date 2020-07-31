Step++;
if( Duration != undefined && Step >= Duration ) {
    instance_destroy();
    exit;
}

CurrentPhase = min( CurrentPhase, Period );
CurrentPhase--;
var executePeriod = Period;
while( CurrentPhase <= 0 ) {
    CurrentPhase += executePeriod;
    event_user( 0 );
    ExecuteCount++;
}

