module KeyCode =
struct
  type t =
    A
  | B
  | C
  | D
  | E
  | F
  | G
  | H
  | I
  | J
  | K
  | L
  | M
  | N
  | O
  | P
  | Q
  | R
  | S
  | T
  | U
  | V
  | W
  | X
  | Y
  | Z
  | Num0
  | Num1
  | Num2
  | Num3
  | Num4
  | Num5
  | Num6
  | Num7
  | Num8
  | Num9
  | Escape
  | LControl
  | LShift
  | LAlt
  | LSystem
  | RControl
  | RShift
  | RAlt
  | RSystem
  | Menu
  | LBracket
  | RBracket
  | SemiColon
  | Comma
  | Period
  | Quote
  | Slash
  | BackSlash
  | Tilde
  | Equal
  | Dash
  | Space
  | Return
  | Back
  | Tab
  | PageUp
  | PageDown
  | End
  | Home
  | Insert
  | Delete
  | Add
  | Subtract
  | Multiply
  | Divide
  | Left
  | Right
  | Up
  | Down
  | Numpad0
  | Numpad1
  | Numpad2
  | Numpad3
  | Numpad4
  | Numpad5
  | Numpad6
  | Numpad7
  | Numpad8
  | Numpad9
  | F1
  | F2
  | F3
  | F4
  | F5
  | F6
  | F7
  | F8
  | F9
  | F10
  | F11
  | F12
  | F13
  | F14
  | F15
  | Pause
  | Count
end


module Keyboard = 
struct 
  let get_Code key =
    match key with
      KeyCode.A -> OcsfmlWindow.KeyCode.A
    | KeyCode.B -> OcsfmlWindow.KeyCode.B
    | KeyCode.C -> OcsfmlWindow.KeyCode.C
    | KeyCode.D -> OcsfmlWindow.KeyCode.D
    | KeyCode.E -> OcsfmlWindow.KeyCode.E
    | KeyCode.F -> OcsfmlWindow.KeyCode.F
    | KeyCode.G -> OcsfmlWindow.KeyCode.G
    | KeyCode.H -> OcsfmlWindow.KeyCode.H
    | KeyCode.I -> OcsfmlWindow.KeyCode.I
    | KeyCode.J -> OcsfmlWindow.KeyCode.J
    | KeyCode.K -> OcsfmlWindow.KeyCode.K
    | KeyCode.L -> OcsfmlWindow.KeyCode.L
    | KeyCode.M -> OcsfmlWindow.KeyCode.M
    | KeyCode.N -> OcsfmlWindow.KeyCode.N
    | KeyCode.O -> OcsfmlWindow.KeyCode.O
    | KeyCode.P -> OcsfmlWindow.KeyCode.P
    | KeyCode.Q -> OcsfmlWindow.KeyCode.Q
    | KeyCode.R -> OcsfmlWindow.KeyCode.R
    | KeyCode.S -> OcsfmlWindow.KeyCode.S
    | KeyCode.T -> OcsfmlWindow.KeyCode.T
    | KeyCode.U -> OcsfmlWindow.KeyCode.U
    | KeyCode.V -> OcsfmlWindow.KeyCode.V
    | KeyCode.W -> OcsfmlWindow.KeyCode.W
    | KeyCode.X -> OcsfmlWindow.KeyCode.X
    | KeyCode.Y -> OcsfmlWindow.KeyCode.Y
    | KeyCode.Z -> OcsfmlWindow.KeyCode.Z
    | KeyCode.Space -> OcsfmlWindow.KeyCode.Space
    | KeyCode.Escape -> OcsfmlWindow.KeyCode.Escape
    | KeyCode.Up -> OcsfmlWindow.KeyCode.Up
    | KeyCode.Down -> OcsfmlWindow.KeyCode.Down
    | KeyCode.Left -> OcsfmlWindow.KeyCode.Left
    | KeyCode.Right -> OcsfmlWindow.KeyCode.Right
    | KeyCode.Return -> OcsfmlWindow.KeyCode.Return
    | _ -> OcsfmlWindow.KeyCode.Pause

  let keycode_state = Hashtbl.create 0
  let init_keycode_state () = ()
  let rec_down_keyboard_evt () = ()
  let rec_up_keyboard_evt () = ()
	
  let is_key_pressed key = OcsfmlWindow.Keyboard.is_key_pressed (get_Code key)
end
