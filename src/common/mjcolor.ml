module type BindingColor = 
  sig
  type t
  val red_comp : t -> int
  val green_comp : t -> int
  val blue_comp : t -> int
  val alpha_comp : t -> float
  val rgba : int -> int -> int -> float -> t
end

module Make = functor (C:BindingColor) ->
  struct
  type t = C.t
  let red_comp = C.red_comp
  let green_comp = C.green_comp
  let blue_comp = C.blue_comp
  let alpha_comp = C.alpha_comp
  let rgba = C.rgba

  let rgb a b c = rgba a b c 1.

  let set_alpha_component c a = 
    let r = C.red_comp c and g = C.green_comp c and b = C.blue_comp c
    in rgba r g b a 

  let add c1 c2 = 
    let r1 = C.red_comp c1 and r2 = C.red_comp c2
    and g1 = C.green_comp c1 and g2 = C.green_comp c2
    and b1 = C.blue_comp c1 and b2 = C.blue_comp c2
    and a1 = C.alpha_comp c1 and a2 = C.alpha_comp c2
    in C.rgba (max (r1 + r2) 255)
	      (max (g1 + g2) 255)
              (max (b1 + b2) 255)
	      (max (a1 +. a2) 1.)

  let modulate c1 c2 = 
    let r1 = C.red_comp c1 and r2 = C.red_comp c2
    and g1 = C.green_comp c1 and g2 = C.green_comp c2
    and b1 = C.blue_comp c1 and b2 = C.blue_comp c2
    and a1 = C.alpha_comp c1 and a2 = C.alpha_comp c2
    in C.rgba ((r1 * r2) /255)
	      ((g1 * g2) /255)
	      ((b1 * b2) /255)
	      (a1 *. a2)

  let mix c1 c2 = 
    let r1 = C.red_comp c1 and r2 = C.red_comp c2
    and g1 = C.green_comp c1 and g2 = C.green_comp c2
    and b1 = C.blue_comp c1 and b2 = C.blue_comp c2
    and a1 = C.alpha_comp c1 and a2 = C.alpha_comp c2
    in C.rgba ((r1 + r2) /2 )
	      ((g1 + g2) /2)
	      ((b1 + b2) /2)
	      ((a1 +. a2)/. 2.)
  
  let white =  C.rgba 255 255 255 1. 
  
  let black =  C.rgba 0 0 0 1.
  
  let red =  C.rgba 255 0 0 1.

  let blue =  C.rgba 0 0 255 1.

  let green =  C.rgba 0 255 0 1.

  let magenta =  C.rgba 255 0 255 1.

  let cyan =  C.rgba 0 255 255 1.

  let yellow =  C.rgba 255 255 0 1.

  let pink = C.rgba 255 192 203 1.

  let transparent = C.rgba 255 255 255 0.

end
