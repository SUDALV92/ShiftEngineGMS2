/// @description  Save
if( !Cooldown && instance_exists( oPlayer ) ) {
    var touchingPlayer = instance_place( x, y, oPlayer );
    var touchingBullet = instance_place( x, y, oBullet );
    var isRelevantPlayerTouching = touchingPlayer != noone && touchingPlayer.GravityDir == Grav;
    
    var bulletContact = !global.SSaves 
        && touchingBullet != noone 
        && instance_exists( touchingBullet.Shooter ) 
        && touchingBullet.Shooter.GravityDir == Grav;
    var playerContact = !global.SSaves 
        && isRelevantPlayerTouching 
        && button_check( global.ShootKeyBind );
    var sSaves = global.SSaves 
        && isRelevantPlayerTouching 
        && button_check( global.SaveKeyBind );
        
    if( bulletContact || playerContact || sSaves ) {
       Cooldown = true;
       alarm[0] = 30;
       image_index = 1;
       image_speed = 0.017;
       save_game(); 
    }
}   


