/// @description  Initialization

L = 0;
R = 0;
HFrameStep = 0;

// Instance Variables.
GravityDir = 1;
Gravity = 0.4;
Jump1 = 8.5;
Jump2 = 7;
OnPlatform = false;
Frozen = false;
AirJumpCount = 1;
CurrentAirJumpCount = AirJumpCount;
Hscap = 3;
Vscap = 9;
set_mask();
Dir = 1;
LastMoveDir = 1;

// Animation control variables.
AnimationState = 0;
AnimationStep = 0;
AnimationDir = Dir;

// Custom sprites should be set here
SIdle = sPlayerIdle;
SFall = sPlayerFall;
SJump = sPlayerJump;
SRun = sPlayerRun;
SSlide = sPlayerSlide;

// Intermediate sprites for smooth transitions.
// Set to -1 to not use them.
SQuarterStep = sPlayerQuarterStep;
SFallStart = sPlayerFallStart;

sprite_index = SIdle; // Ensuring it's the right sprite from creation
image_speed = 0.135;

