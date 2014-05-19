(** All type of MouseButton *)
module MouseButton :
sig
  type t =
    LeftButton
  | RightButton
  | MiddleButton
  | XButton1
  | XButton2
  | MouseButtonCount
end

module Mouse :
sig
  val init_mouse : unit -> unit

  val update : unit -> unit

   (** Check if a Mouse Button is pressed. 
			@param t Type MouseButton to check.
      @return True if the Mouse Button is pressed, false otherwise *)
  val is_button_pressed : MouseButton.t -> bool
	
	(** Gives the posion of the mouse relative to the screen.
			@param unit unit.
      @return the position of the mouse relative to the screen (a couple of integer x, y)  *)
  val get_position : unit -> int * int

  val get_client_position : unit -> int * int
	
	(** Change the position of the mouse relative to the screen , only for sfml.
			@param int*int Takes as a parameter an integer pair. 
      @return void.  *)
  val set_position : int * int -> unit
	
end

