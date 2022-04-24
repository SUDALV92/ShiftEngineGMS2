/// @description  smoothing_mode_get_default()
function smoothing_mode_get_default() {

	// Returns texture smoothing most applicable to the target monitor.
	return display_get_width() < 1250 || display_get_height() < 950;



}
