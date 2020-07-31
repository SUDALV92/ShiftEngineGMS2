/// @description  Timer
if( global.TimeTicking ) {
    var dt = delta_time / 1000000;
    if( global.TimeWhileDead || instance_exists( oPlayer ) ) {
        TimePrecise += dt;
    }
    if( TimePrecise >= 1.0 ) {
        var secondCount = floor( TimePrecise );
        TimeSeconds += secondCount;
        TimePrecise -= secondCount;
        update_title();
    }
}

