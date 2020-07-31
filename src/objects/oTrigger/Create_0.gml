/// @description  Object description

// A trigger is an object that allows you to define custom events on player collision.
// This is a base engine object and it should not be modified.
// Instead you can customize a trigger using creation code or create a 
// custom trigger object with this parent.

// IsActive controls if all custom events happen on player collision.
// By default the trigger starts active and deactivates after the first collision.
// You can customize this behavior by changing the variable at any point.
IsActive = true;

// There are several ways you can use this object.
// They are equally expressive, you can choose the way you use this
// by your personal preference.

// OnTrigger is a script id that gets executed on activation.
// For example, you can write:
// OnTrigger = flip;
// to create a trigger that flips gravity on touch.
// By default nothing is executed.
OnTrigger = -1;

// TriggerEventId is an id of a user-defined event that is called on collision 
// for this trigger and all the linked instances (see below).
// You can create a custom trigger object, set this as its parent 
// and create a user-defined event there.
// By default event 0 is called, if present.
TriggerEventId = 0;

// You can also define a linked object or instance.
// A user-defined event will also trigger for all existing linked instances.
// For example:
// LinkedId = oTrapSpike;
// will call a user-defined event for all instances of oTrapSpike.
// By default no objects are linked.
LinkedId = noone;

// Trigger visibility is controlled by a debug flag.
visible = global.DebugShowTriggers;

