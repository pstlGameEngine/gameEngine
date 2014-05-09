var sounds = new Object();

//Provides: create_audio
function create_audio(url){
	var audio = document.createElement("audio");
	audio.id = url;
	audio.src = url;
	//audio.currentTime="0";
	sounds[url] = audio;
}

//Provides: create_music
function create_music(url,loop){
	var audio = document.createElement("audio");
	audio.id = url;
	audio.src = url;
	audio.addEventListener(
		'ended', 
		function() {
			this.currentTime = 0;
       			this.play();
    			},
		false
	);
	sounds[url] = audio;
}

//Provides: play_audio
function play_audio(id){
	var audio = sounds[id];
	audio.pause();
	audio.currentTime <- 0;
	sounds[id]=audio;
	sounds[id].play();
}

//Provides: stop_audio
function stop_audio(id){
	if(id in sounds){
		var audio = sounds[id];
		audio.pause();
		audio.currentTime <- 0;
		sounds[id]=audio;
	}
}

//Provides: set_volume
function set_volume(id,vol){
	if(id in sounds){
		var audio = sounds[id];
		audio.volume = vol;
		sounds[id]=audio;
	}
}
