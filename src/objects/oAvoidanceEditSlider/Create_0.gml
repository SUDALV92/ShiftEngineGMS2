EditSliderY = 48;

var editMargin = 64;
var cam = view_get_camera(0);
EditSliderLeft = editMargin;
EditSliderRight = camera_get_view_width(cam) - editMargin;
EditSliderLength = EditSliderRight - EditSliderLeft;

ActiveTickPos = -1;

