(** window module *)

(** the window type *)
type t

(** getRelativePosition w returns a couple of int representing the relarive position of the mouse in the window w *)
val getRelativePosition : t -> int * int

val setRelativePosition : t -> int * int -> unit

(** create_window a b s fps col creates a window with:
- a with value equal to 'a'
- a height value equal to 'b'
- a title equal to 's'
- a frame Per Second value equal to 'fps' (the number of call to the function display that the motor wont exeed, and try to reach if possible)
- a background color equal to 'col'*)
val create_window : float -> float ->  string -> int -> Color.t -> t

(**Load ressources that can be displayed in the window. Note that the motor does load it if you directly make a call to drawImage without calling explicit_load, but you'll may experience a slowdown while loading *)
val explicit_load : t -> Image.t list -> unit

(**Function that renders what have been drawn on the window so far.
display fen func b, makes call to the 'func' function the number of time specified in the fps field of the window fen, every second
if b is equal to true, the window is cleared between 2 displays.
if b is equal to false, the window is not cleared between 2 displays.
the function func is actually the one that produce the displays, it takes as argument one window and draws on it
*)
val display : t -> (t -> unit) -> bool ->  unit


(**Same as 'display' but the func function takes as argument more than a window:
-the 'a argument allows to specify on more value that can configure the display.
-it returns a value of the same type that will configure the next display
display_tm : t func conf b: makes the first call to func with conf as argument, the next ones will use the result of their predecessor
*)
val display_tm : t -> (t -> 'a -> 'a ) -> 'a -> bool ->  unit

(**Changes the title field of a window*)
val setTitle : t -> string -> unit

(** function that draws the perimeter of a rectangle
*** strokeRect fen x y width height col, draws on the window 'fen', the perimeter of the rectangle with the bottom-left corner at the point of coordinates 'x' 'y', with width value equal to 'w' and height value equal to 'h' with the 'col' color
*)
val strokeRect: t ->  float -> float ->  float -> float -> Color.t -> unit

(** function that draws a filled rectangle
*** fillRect fen x y width height col, draws on the window 'fen', a filled rectangle with the 'col' color. its bottom-left corner is at the point of coordinates 'x' 'y', its width value is equal to 'w' and its height value is equal to 'h'
*)
val fillRect: t ->  float -> float ->  float -> float -> Color.t -> unit

(** function that draws the perimeter of a circle
*** strokeCircle fen x y r col, draws on the window 'fen', the perimeter of the circle with the center at the point of coordinates 'x' 'y', with radius value equal to 'r' and with the 'col' color
*)
val strokeCircle : t -> float -> float -> float -> Color.t -> unit

(** function that draws a filled circle
*** fillCircle fen x y r col, draws on the window 'fen', a filled circle with the  the 'col' color. its center is at the point of coordinates 'x' 'y', its radius value is equal to 'r'
*)
val fillCircle : t -> float -> float -> float -> Color.t -> unit

val writeText: t -> Text.t -> Color.t -> unit

val drawImage : t -> Image.t -> float -> float-> float -> float-> float ->unit

val drawGif : t -> Gif.t -> float -> float-> float -> float-> float -> unit

(**redraw the background of a window *)
val redrawBackground : t -> unit

(** clear the content of the window, and redraw its background*)
val clear : t -> unit

(** close the window*)
val close : t -> unit 

(**returns the height value of a window *)
val getheight : t -> int

(**returns the width value of a window *)
val getwidth : t -> int

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
	(** Check if a Mouse Button is pressed. 
			@param t Type MouseButton to check.
      @return True if the Mouse Button is pressed, false otherwise *)
  val is_button_pressed : MouseButton.t -> bool
	
	(** Gives the posion of the mouse relative to the screen.
			@param unit unit.
      @return the position of the mouse relative to the screen (a couple of integer x, y)  *)
  val get_position : unit -> int * int
	
	(** Gives the posion of the mouse relative to the window.
			@param  t Type MouseButton to check
      @return the position of the mouse relative to the window (a couple of integer x, y) *)
  val get_relative_position : t -> int * int
	
	(** Change the position of the mouse relative to the screen , only for sfml.
			@param int*int Takes as a parameter an integer pair. 
      @return void.  *)
  val set_position : int * int -> unit
	
	(** Change the position of the mouse relative to the window , only for sfml.
			@param t Takes as a parameter an integer pair. 
      @return void. *)
  val set_relative_position : t -> int * int -> unit
end

	(** HashTable of MouseButton event .
	 		@param t Type of MouseButton.
			@param int 0 Button Up , 1 Button down .
			@return HashTable of MouseButton associate to 0 (Button Up) or 1 (Button Down) *)
val mouse_state : (MouseButton.t, int) Hashtbl.t

  (** HashTable of Mouse position .
	 		@param string  "x" or "y" of the mouse or x_r , y_r  relative position of the mouse.
			@param int position of the mouse .
			@return HashTable of x or y associate to this current value *)
val mouse_pos : (string, int) Hashtbl.t 
