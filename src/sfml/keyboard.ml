  type keycode =
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
  | Unknown

  let toSfml key =
    match key with
      A -> OcsfmlWindow.KeyCode.A
    | B -> OcsfmlWindow.KeyCode.B
    | C -> OcsfmlWindow.KeyCode.C
    | D -> OcsfmlWindow.KeyCode.D
    | E -> OcsfmlWindow.KeyCode.E
    | F -> OcsfmlWindow.KeyCode.F
    | G -> OcsfmlWindow.KeyCode.G
    | H -> OcsfmlWindow.KeyCode.H
    | I -> OcsfmlWindow.KeyCode.I
    | J -> OcsfmlWindow.KeyCode.J
    | K -> OcsfmlWindow.KeyCode.K
    | L -> OcsfmlWindow.KeyCode.L
    | M -> OcsfmlWindow.KeyCode.M
    | N -> OcsfmlWindow.KeyCode.N
    | O -> OcsfmlWindow.KeyCode.O
    | P -> OcsfmlWindow.KeyCode.P
    | Q -> OcsfmlWindow.KeyCode.Q
    | R -> OcsfmlWindow.KeyCode.R
    | S -> OcsfmlWindow.KeyCode.S
    | T -> OcsfmlWindow.KeyCode.T
    | U -> OcsfmlWindow.KeyCode.U
    | V -> OcsfmlWindow.KeyCode.V
    | W -> OcsfmlWindow.KeyCode.W
    | X -> OcsfmlWindow.KeyCode.X
    | Y -> OcsfmlWindow.KeyCode.Y
    | Z -> OcsfmlWindow.KeyCode.Z
    | Space  -> OcsfmlWindow.KeyCode.Space
    | Escape -> OcsfmlWindow.KeyCode.Escape
    | Up     -> OcsfmlWindow.KeyCode.Up
    | Down   -> OcsfmlWindow.KeyCode.Down
    | Left   -> OcsfmlWindow.KeyCode.Left
    | Right  -> OcsfmlWindow.KeyCode.Right
    | Return -> OcsfmlWindow.KeyCode.Return
    | _       -> OcsfmlWindow.KeyCode.Pause

  let keycode_state : (keycode,bool) Hashtbl.t = Hashtbl.create 0
  let init_keycode_state () = ()
  let update () = ()
	
  let is_key_pressed key = 
    match key with
    | Unknown -> false
    | _ -> OcsfmlWindow.Keyboard.is_key_pressed (toSfml key)
