module SoundBuffer = 
struct
  type t = Embed of string

  let destroy sb = 
    () 

  let create_sound_buffer fileName = 
    Embed fileName
      
end

module Sound = 
struct
  type t =  Sound of string

  let create_from_sound_buffer sound_buffer =
    match sound_buffer with
    |SoundBuffer.Embed nom -> 
        Js.Unsafe.fun_call (Js.Unsafe.variable "create_audio") 
			 [|Js.Unsafe.inject nom|];
        Sound nom

  let destroy s =
    ()

  let stop s= 
    match s with 
    | Sound nom ->
      Js.Unsafe.fun_call (Js.Unsafe.variable "stop_audio") 
			 [|Js.Unsafe.inject nom|]

  let play s = 
    match s with 
    | Sound nom ->
      ignore (Js.Unsafe.fun_call (Js.Unsafe.variable "play_audio") 
			 [|Js.Unsafe.inject nom|])

  let pause s= 
    ()


  let set_volume s vol = 
    let v = vol /. 100. in
    match s with 
    | Sound nom ->
      Js.Unsafe.fun_call (Js.Unsafe.variable "set_volume") 
		         [|Js.Unsafe.inject nom; Js.Unsafe.inject v|];
end

module Music =
struct
  type m = string

  let destroy m = 
    ()
      
  let create_music fileName loop = 
    Js.Unsafe.fun_call (Js.Unsafe.variable "create_music") 
		       [|Js.Unsafe.inject fileName; Js.Unsafe.inject loop|];
    fileName

  let stop m = 
    Js.Unsafe.fun_call (Js.Unsafe.variable "stop_audio") 
		       [|Js.Unsafe.inject m|]

  let play m = 
    Js.Unsafe.fun_call (Js.Unsafe.variable "play_audio") 
		       [|Js.Unsafe.inject m|]

  let pause m =
    ()

  let set_loop m b = 
    ()

  let get_loop m = 
    true

  let set_volume m volume= 
    let v = volume /. 100. in
    Js.Unsafe.fun_call (Js.Unsafe.variable "set_volume") 
		       [|Js.Unsafe.inject m; Js.Unsafe.inject v|];
end
