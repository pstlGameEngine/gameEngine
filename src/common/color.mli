(**The color module*)

type t
(**the color type, using the rgba format where:
r, g and b are int between 0 and 255, and a (alpha component or opacity) is a float between 0 and 1*)

(** rgb a b c returns a color where the red component is equal to a,
the green component is equal to b, the blue component is equal to c 
and the alpha component is equal to 1. (maximum opacity) *)
val rgb : int -> int -> int -> t

(** rgb a b c d returns a color where the red component is equal to a,
the green component is equal to b, the blue component is equal to c 
and the alpha component is equal to d (d between 0. and 1.) *)
val rgba : int -> int -> int -> float -> t

val add : t -> t -> t

val modulate : t -> t -> t

val mix : t -> t -> t

val white : t

val black : t 

val red : t

val blue : t

val green : t

val magenta : t

val cyan : t 

val yellow : t

val pink : t

val transparent : t

(** set_alpha_component col a returns the same color as col with the alpha
component value equal to a*)
val set_alpha_component : t -> float -> t

(** returns the value of the red component (an int between 0 and 255) *)
val red_comp : t -> int

(** returns the value of the green component (an int between 0 and 255) *)
val green_comp : t -> int

(** returns the value of the blue component (an int between 0 and 255) *)
val blue_comp : t -> int

(** returns the value of the alpha component (a float between 0. and 1.) *)
val alpha_comp : t -> float
