(** the audio module *)


module SoundBuffer :
sig
(** the soundbuffer module *)

 type t
 val destroy : t -> unit
 val create_sound_buffer : string -> t 
end

module Sound : 
sig
(** the sound module *)
  type t
  val destroy : t -> unit
  val create_from_sound_buffer : SoundBuffer.t -> t
  val play : t -> unit
  val pause : t -> unit
  val stop : t -> unit

  (**sets the volume of a sound to the specified value: a float between 0. and 100.*)
  val set_volume : t -> float -> unit
end

module Music : 
sig 
  (** the music module *)
  type m

  val destroy : m -> unit

  (**function of creation of a music:
     create_music url b, returns the music at the specified url, with a loop value equal to b (if true, the music will start all over again, false, it will be played once) *)
  val create_music : string -> bool -> m
  val play : m -> unit
  val pause : m -> unit
  val stop : m -> unit
  val set_loop : m -> bool -> unit
  val get_loop : m -> bool

  (**sets the volume of a music to the specified value: a float between 0. and 100.*)
  val set_volume : m -> float -> unit
end
