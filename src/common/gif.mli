(** the gif module *)

type t
(** the gif type *)

(** make_gif l n, returns a gif built with the image list l, that will 
switch image every n frame*)
val make_gif : Image.t list -> int -> t
   
val getCurrent_image : t -> Image.t

(*val getPrevious gif = ()*)

val getNext :  t -> unit

(*val make_gif_fromDirectory : string -> t*)
