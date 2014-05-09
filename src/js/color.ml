open CSS.Color

type t = Js.js_string Js.t

let red_comp c = 
  let a = (ml (js_t_of_js_string c)) in
    match a with
    | RGBA (r, _, _, _) -> r
    | _ -> 0

let green_comp c = 
  let a = (ml (js_t_of_js_string c)) in
    match a with
    | RGBA (_, g, _, _) -> g
    | _ -> 0

let blue_comp c =
  let a = (ml (js_t_of_js_string c)) in
    match a with
    | RGBA (_, _, b, _) -> b
    | _ -> 0

let alpha_comp c =
  let a = (ml (js_t_of_js_string c)) in
    match a with
    | RGBA (_, _, _, a) -> a
    | _ -> 0.

let rgb red green blue = 
  let c = RGBA (red,green,blue,1.) in
   Js.string (string_of_t c)

let rgba red green blue alpha =
  let c = RGBA (red,green,blue,alpha) in
  Js.string (string_of_t c)

let add c1 c2 = 
  let a = (ml (js_t_of_js_string c1)) 
  and b = (ml (js_t_of_js_string c2))
  in
  match a,b with
  | (RGBA (r1, g1, b1, a1),RGBA(r2, g2, b2, a2)) -> 
	rgba (max (r1 + r2) 255)
	     (max (g1 + g2) 255)
	     (max (b1 + b2) 255)
	     (max (a1 +. a2) 1.)
  | _ -> c2
  
  
let modulate c1 c2 =
  let a = (ml (js_t_of_js_string c1)) 
  and b = (ml (js_t_of_js_string c2))
  in
  match a,b with
  | (RGBA (r1, g1, b1 , a1),RGBA(r2, g2, b2, a2)) -> 
	rgba ((r1 * r2) /255)
	     ((g1 * g2) /255)
	     ((b1 * b2) /255)
	     (a1 *. a2)
  | _ -> c2

(* return the color between the both colors *)
let mix c1 c2 =
  let a = (ml (js_t_of_js_string c1)) 
  and b = (ml (js_t_of_js_string c2))
  in
  match a,b with
  | (RGBA (r1, g1, b1 , a1),RGBA(r2, g2, b2, a2)) -> 
	rgba ((r1 + r2) /2 )
	     ((g1 + g2) /2)
	     ((b1 + b2) /2)
	     ((a1 +. a2)/. 2.)
  | _ -> c2
  
let white =  rgba 255 255 255 1. 
  
let black =  rgba 0 0 0 1.
  
let red =  rgba 255 0 0 1.

let blue =  rgba 0 0 255 1.

let green =  rgba 0 255 0 1.

let magenta =  rgba 255 0 255 1.

let cyan =  rgba 0 255 255 1.

let yellow =  rgba 255 255 0 1.

let pink = rgba 255 192 203 1.

let transparent = rgba 255 255 255 0.

let set_alpha_component c alpha = 
  let col = (ml (js_t_of_js_string c)) in
  match col with
  | RGBA (r, g, b, _) -> rgba r g b (alpha)
  | _ -> c


