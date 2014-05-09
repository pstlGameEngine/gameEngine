(** the menu module *)

(** the menu item type *)
type item

val inBounds : item -> int*int -> bool

(**returns true if the mouse position is over the item menu *)
val isMouseOverItem : item -> Mjwindow.t -> bool 

(** return true if the click occurs on the item menu *)
val isClickedItem : item -> Mjwindow.t -> bool 

(** display an item on a window*)
val display_item : Mjwindow.t -> item -> unit

(** the menu type *)
type t 

(** display an menu on a window*)
val display_menu :  Mjwindow.t -> t -> unit

(** return a menu built from a list of words corresponding to each item.
the style of the menu built is standard*)
val makeMenu : Mjwindow.t -> string list -> t

(** getItem menu i returns the item at the index i of the item list*)
val getItem: t -> int -> item
