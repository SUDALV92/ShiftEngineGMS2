var currentAlpha = TailAlpha * image_alpha;
var currentScaleX = TailScale * image_xscale;
var currentScaleY = TailScale * image_yscale;
var alphaDelta = image_alpha / ( TrailCount + 1 );
var scaleDeltaX = image_xscale / ( TrailCount + 1 );
var scaleDeltaY = image_yscale / ( TrailCount + 1 );
var currentIndex = PrevPositionsIndex + MaxTrailCount - TrailCount;
if( currentIndex >= MaxTrailCount ) {
    currentIndex -= MaxTrailCount;
}
for( var i = 0; i < TrailCount; i++ ) {
    draw_sprite_ext( sprite_index, image_index, PrevPositionsX[currentIndex], PrevPositionsY[currentIndex], currentScaleX, currentScaleY, PrevImageAngles[currentIndex], image_blend, currentAlpha );
    currentScaleX = min( image_xscale, currentScaleX + scaleDeltaX );
    currentScaleY = min( image_yscale, currentScaleY + scaleDeltaY );
    currentAlpha = min( image_alpha, currentAlpha + alphaDelta );
    currentIndex++;
    if( currentIndex >= MaxTrailCount ) {
        currentIndex = 0;
    }
}

