open CSS.Color
module BColor : Mjcolor.BindingColor =
struct
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

  let rgba red green blue alpha =
    let c = RGBA (red,green,blue,alpha) in
    Js.string (string_of_t c)
end
