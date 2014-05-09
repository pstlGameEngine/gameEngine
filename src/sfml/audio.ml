module SoundBuffer = 
struct
  type t = OcsfmlAudio.sound_buffer

  let destroy sb = 
    sb#destroy

  let create_sound_buffer fileName = 
    new OcsfmlAudio.sound_buffer (`File fileName)
end

module Sound = 
struct
  type t = OcsfmlAudio.sound

  let create_from_sound_buffer sound_buffer = 
    let sound = new OcsfmlAudio.sound () in 
    sound#set_buffer sound_buffer;
    sound

  let destroy s = 
    s#destroy

  let play s= 
    s#play

  let pause s= 
    s#pause

  let stop s= 
    s#pause

  let set_volume s vol = 
    s#set_volume vol
end

module Music =
struct
  type m = OcsfmlAudio.music
  let destroy m = 
    m#destroy
      
  let create_music fileName loop = 
    let music = new OcsfmlAudio.music () in
    music#set_loop loop;
    ignore (music#open_from_file fileName);
    music

  let play m = 
    m#play

  let pause m = 
    m#pause

  let stop m = 
    m#stop
  let set_loop m b = 
    m#set_loop b

  let get_loop m = 
    m#get_loop

  let set_volume m volume= 
    m#set_volume volume
end
