module BColor : Mjcolor.BindingColor =
struct
  type t = OcsfmlGraphics.Color.t
  let red_comp c = c.OcsfmlGraphics.Color.r
  let green_comp c = c.OcsfmlGraphics.Color.g
  let blue_comp c = c.OcsfmlGraphics.Color.b
  let alpha_comp c = (float_of_int c.OcsfmlGraphics.Color.a)/.255.
  let rgba r g b a = OcsfmlGraphics.Color.rgba r g b (int_of_float (255.*.a))
end
