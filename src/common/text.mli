type t
val create_text : string -> float -> float -> int -> t
val get_size : t -> int
val get_content : t -> string
val get_posx : t -> float
val get_posy : t -> float
val set_text : t -> string -> t
