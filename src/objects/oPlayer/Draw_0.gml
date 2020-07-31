/// @description  Drawing Self & Hitbox

var xd = x;
var yd = y;
var alpha;
if( GravityDir == -1 ) {
    yd += 1.0;
}

yd = round( yd ); // crispy GM8-like rounding (mm)

if( global.God ) {
    alpha = 0.7;
} else {
    alpha = 1.0;
}

draw_sprite_ext( sprite_index, image_index, xd, yd, image_xscale * Dir,
    image_yscale * GravityDir, image_angle, image_blend, image_alpha * alpha );

if( global.DrawHitbox ) {
    draw_sprite_ext( mask_index, image_index, x, y, image_xscale,
        image_yscale, image_angle, image_blend, image_alpha * alpha * 0.8 );
}


