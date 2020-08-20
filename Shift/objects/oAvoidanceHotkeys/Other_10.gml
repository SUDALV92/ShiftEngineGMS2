/// @description  Set and remember an avoidance timing
var avoidance = global.ActiveAvoidance;
avoidance_set_step( avoidance.StartTiming );
var file = file_text_open_write( "Debug_AvoidanceTiming" );
file_text_write_real( file, avoidance.MusicId );
file_text_write_real( file, avoidance.StartTiming );
file_text_close( file );

