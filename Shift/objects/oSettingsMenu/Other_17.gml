/// @description  Toggle texture smoothing.
global.SmoothTextures = !global.SmoothTextures;
gpu_set_texfilter( global.SmoothTextures );
event_user( 15 );

