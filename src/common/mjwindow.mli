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
val create_window : float -> float ->  string -> int -> Mjgraphics.Color.t -> t

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
val strokeRect: t ->  float -> float ->  float -> float -> Mjgraphics.Color.t -> unit

(** function that draws a filled rectangle
*** fillRect fen x y width height col, draws on the window 'fen', a filled rectangle with the 'col' color. its bottom-left corner is at the point of coordinates 'x' 'y', its width value is equal to 'w' and its height value is equal to 'h'
*)
val fillRect: t ->  float -> float ->  float -> float -> Mjgraphics.Color.t -> unit

(** function that draws the perimeter of a circle
*** strokeCircle fen x y r col, draws on the window 'fen', the perimeter of the circle with the center at the point of coordinates 'x' 'y', with radius value equal to 'r' and with the 'col' color
*)
val strokeCircle : t -> float -> float -> float -> Mjgraphics.Color.t -> unit

(** function that draws a filled circle
*** fillCircle fen x y r col, draws on the window 'fen', a filled circle with the  the 'col' color. its center is at the point of coordinates 'x' 'y', its radius value is equal to 'r'
*)
val fillCircle : t -> float -> float -> float -> Mjgraphics.Color.t -> unit

val writeText: t -> Text.t -> Mjgraphics.Color.t -> unit

(** function that draws an image
*** drawImage fen im x y w sizeY alpha, draws on the window 'fen', the image 'im' with a transparency value equal to 'alpha' . its bottom-left corner is at the point of coordinates 'x' 'y', its width value is equal to 'w' and its height value is equal to 'h'
*)
val drawImage : t -> Image.t -> float -> float-> float -> float-> float ->unit

val drawGif : t -> Gif.t -> float -> float-> float -> float-> float -> unit

val get_relative_position : t -> int*int

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
