/// @description  Initialization

L = 0;
R = 0;
HFrameStep = 0;

// Instance Variables.
GravityDir = 1;
Gravity = 0.4;
Jump1 = 5.667;
Jump2 = 4.667;
OnPlatform = false;
Frozen = false;
MaxAirJumpCount = 1;
CurrentAirJumpCount = MaxAirJumpCount;
Hscap = 2;
Vscap = 6;
VKeyDeltas[0] = 0;
PrevVKeyDelta = 0;
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
IdleImageSpeed = 0.084;
MovementImageSpeed = 0.209;
image_speed = IdleImageSpeed;

