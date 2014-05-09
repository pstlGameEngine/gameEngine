type t = OcsfmlGraphics.Color.t

let red_comp c = c.OcsfmlGraphics.Color.r
let green_comp c = c.OcsfmlGraphics.Color.g
let blue_comp c = c.OcsfmlGraphics.Color.b
let alpha_comp c = (float_of_int c.OcsfmlGraphics.Color.a)/.255.
  
let rgb = OcsfmlGraphics.Color.rgb
  
let rgba r g b a = 
  OcsfmlGraphics.Color.rgba r g b (int_of_float (255.*.a))

let add = OcsfmlGraphics.Color.add
  
let modulate = OcsfmlGraphics.Color.modulate

(* return the color between the both colors *)
let mix c1 c2 = rgba ((red_comp c1) +(red_comp c2)/2)
		     ((green_comp c1) +(green_comp c2)/2)
		     ((blue_comp c1) +(blue_comp c2)/2)
		     ((alpha_comp c1) +. (alpha_comp c2)/.2.)
  
let white =  OcsfmlGraphics.Color.white
  
let black =  OcsfmlGraphics.Color.black
  
let red =  OcsfmlGraphics.Color.red

let blue =  OcsfmlGraphics.Color.blue

let green =  OcsfmlGraphics.Color.green

let magenta =  OcsfmlGraphics.Color.magenta

let cyan =  OcsfmlGraphics.Color.cyan

let yellow =  OcsfmlGraphics.Color.yellow

let pink = rgba 255 192 203 1.

let transparent = rgba 255 255 255 0.

let set_alpha_component c alpha =
  {c with OcsfmlGraphics.Color.a = (int_of_float (255.*.alpha))}
