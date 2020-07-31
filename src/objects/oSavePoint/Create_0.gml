/// @description  Variables
Difficulty = 2; // Difficulty max - Shows up at VeryHard & Below
Grav = image_yscale; // Normal Gravity

image_speed = 0;
Cooldown = false;

if( global.Difficulty > Difficulty ) {
    instance_destroy();
}


