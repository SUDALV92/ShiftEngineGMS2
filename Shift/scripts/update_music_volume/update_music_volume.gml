function update_music_volume() {
	if( global.CurrentBGM != noone ) {
	    var vol = audio_sound_get_gain( global.CurrentBGM ) * global.MusicVolume * global.MasterVolume;
	    if( global.MusicMuted ) {
	        vol = 0;
	    }
	    audio_sound_gain( global.InstanceBGM, vol, 0 );    
	}



}
