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
    (** Hashtable des etats des touches du clavier 111 touches Max*)
  let keycode_state = Hashtbl.create 111
    
    (** Initialitation du hashtable
	0 -> keyUp
	1 -> keyDown
    *)
  let init_keycode_state () = 
    Hashtbl.add keycode_state KeyCode.A 0;
    Hashtbl.add keycode_state KeyCode.B 0;
    Hashtbl.add keycode_state KeyCode.C 0;
    Hashtbl.add keycode_state KeyCode.D 0;
    Hashtbl.add keycode_state KeyCode.E 0;
    Hashtbl.add keycode_state KeyCode.F 0;
    Hashtbl.add keycode_state KeyCode.G 0;
    Hashtbl.add keycode_state KeyCode.H 0;
    Hashtbl.add keycode_state KeyCode.I 0;
    Hashtbl.add keycode_state KeyCode.J 0;
    Hashtbl.add keycode_state KeyCode.K 0;
    Hashtbl.add keycode_state KeyCode.L 0;
    Hashtbl.add keycode_state KeyCode.M 0;
    Hashtbl.add keycode_state KeyCode.N 0;
    Hashtbl.add keycode_state KeyCode.O 0;
    Hashtbl.add keycode_state KeyCode.P 0;
    Hashtbl.add keycode_state KeyCode.Q 0;
    Hashtbl.add keycode_state KeyCode.R 0;
    Hashtbl.add keycode_state KeyCode.S 0;
    Hashtbl.add keycode_state KeyCode.T 0;
    Hashtbl.add keycode_state KeyCode.U 0;
    Hashtbl.add keycode_state KeyCode.V 0;
    Hashtbl.add keycode_state KeyCode.W 0;
    Hashtbl.add keycode_state KeyCode.X 0;
    Hashtbl.add keycode_state KeyCode.Y 0;
    Hashtbl.add keycode_state KeyCode.Z 0;
    Hashtbl.add keycode_state KeyCode.Space 0;
    Hashtbl.add keycode_state KeyCode.Escape 0;
    Hashtbl.add keycode_state KeyCode.Return 0;
    Hashtbl.add keycode_state KeyCode.Up 0;
    Hashtbl.add keycode_state KeyCode.Down 0;
    Hashtbl.add keycode_state KeyCode.Left 0;
    Hashtbl.add keycode_state KeyCode.Right 0

    (** Association des KeyCode a un ASCII *)
  let get_KeyCode key =
    match key with
    | 65 -> KeyCode.A
    | 66 -> KeyCode.B
    | 67 -> KeyCode.C
    | 68 -> KeyCode.D
    | 69 -> KeyCode.E
    | 70 -> KeyCode.F
    | 71 -> KeyCode.G
    | 72 -> KeyCode.H
    | 73 -> KeyCode.I
    | 74 -> KeyCode.J
    | 75 -> KeyCode.K
    | 76 -> KeyCode.L
    | 77 -> KeyCode.M
    | 78 -> KeyCode.N
    | 79 -> KeyCode.O
    | 80 -> KeyCode.P
    | 81 -> KeyCode.Q
    | 82 -> KeyCode.R
    | 83 -> KeyCode.S
    | 84 -> KeyCode.T
    | 85 -> KeyCode.U
    | 86 -> KeyCode.V
    | 87 -> KeyCode.W
    | 88 -> KeyCode.X
    | 89 -> KeyCode.Y
    | 90 -> KeyCode.Z
    | 32 -> KeyCode.Space
    | 27 -> KeyCode.Escape
    |  9 -> KeyCode.Return
    | 37 -> KeyCode.Left
    | 38 -> KeyCode.Up
    | 39 -> KeyCode.Right
    | 40 -> KeyCode.Down
      
    (** Enregistre dans un tableau tout les events keyboard *)
  let rec_down_keyboard_evt () =
    Dom_html.window##onkeydown <-
      Dom_html.handler 
      (fun evt -> 
	let ev =  get_KeyCode evt##keyCode in
	begin 
	match ev with 
	| KeyCode.A -> Hashtbl.replace keycode_state KeyCode.A 1
	| KeyCode.B -> Hashtbl.replace keycode_state KeyCode.B 1
	| KeyCode.C -> Hashtbl.replace keycode_state KeyCode.C 1
	| KeyCode.D -> Hashtbl.replace keycode_state KeyCode.D 1
	| KeyCode.E -> Hashtbl.replace keycode_state KeyCode.E 1
	| KeyCode.F -> Hashtbl.replace keycode_state KeyCode.F 1
	| KeyCode.G -> Hashtbl.replace keycode_state KeyCode.G 1
	| KeyCode.H -> Hashtbl.replace keycode_state KeyCode.H 1
	| KeyCode.I -> Hashtbl.replace keycode_state KeyCode.I 1
	| KeyCode.J -> Hashtbl.replace keycode_state KeyCode.J 1
	| KeyCode.K -> Hashtbl.replace keycode_state KeyCode.K 1
	| KeyCode.L -> Hashtbl.replace keycode_state KeyCode.L 1
	| KeyCode.M -> Hashtbl.replace keycode_state KeyCode.M 1
	| KeyCode.N -> Hashtbl.replace keycode_state KeyCode.N 1
	| KeyCode.O -> Hashtbl.replace keycode_state KeyCode.O 1
	| KeyCode.P -> Hashtbl.replace keycode_state KeyCode.P 1
	| KeyCode.Q -> Hashtbl.replace keycode_state KeyCode.Q 1
	| KeyCode.R -> Hashtbl.replace keycode_state KeyCode.R 1
	| KeyCode.S -> Hashtbl.replace keycode_state KeyCode.S 1
	| KeyCode.T -> Hashtbl.replace keycode_state KeyCode.T 1
	| KeyCode.U -> Hashtbl.replace keycode_state KeyCode.U 1
	| KeyCode.V -> Hashtbl.replace keycode_state KeyCode.V 1
	| KeyCode.W -> Hashtbl.replace keycode_state KeyCode.W 1
	| KeyCode.X -> Hashtbl.replace keycode_state KeyCode.X 1
	| KeyCode.Y -> Hashtbl.replace keycode_state KeyCode.Y 1
	| KeyCode.Z -> Hashtbl.replace keycode_state KeyCode.Z 1
	| KeyCode.Space	 -> Hashtbl.replace keycode_state KeyCode.Space 1
	| KeyCode.Escape -> Hashtbl.replace keycode_state KeyCode.Escape 1
	| KeyCode.Return -> Hashtbl.replace keycode_state KeyCode.Return 1
	| KeyCode.Up	 -> Hashtbl.replace keycode_state KeyCode.Up 1
	| KeyCode.Down	 -> Hashtbl.replace keycode_state KeyCode.Down 1
	| KeyCode.Left	 -> Hashtbl.replace keycode_state KeyCode.Left 1
	| KeyCode.Right	 -> Hashtbl.replace keycode_state KeyCode.Right 1
	| _ -> ();
	end;
	Js._true;
      )
      
    (** Enregistre dans un tableau tout les events keyboard *)
  let rec_up_keyboard_evt () =
    Dom_html.window##onkeyup <- 
      Dom_html.handler 
      (fun evt -> 
	let ev =  get_KeyCode evt##keyCode in
	begin 
	match ev with
	| KeyCode.A -> Hashtbl.replace keycode_state KeyCode.A 0
	| KeyCode.B -> Hashtbl.replace keycode_state KeyCode.B 0
	| KeyCode.C -> Hashtbl.replace keycode_state KeyCode.C 0
	| KeyCode.D -> Hashtbl.replace keycode_state KeyCode.D 0
	| KeyCode.E -> Hashtbl.replace keycode_state KeyCode.E 0
	| KeyCode.F -> Hashtbl.replace keycode_state KeyCode.F 0
	| KeyCode.G -> Hashtbl.replace keycode_state KeyCode.G 0
	| KeyCode.H -> Hashtbl.replace keycode_state KeyCode.H 0
	| KeyCode.I -> Hashtbl.replace keycode_state KeyCode.I 0
	| KeyCode.J -> Hashtbl.replace keycode_state KeyCode.J 0
	| KeyCode.K -> Hashtbl.replace keycode_state KeyCode.K 0
	| KeyCode.L -> Hashtbl.replace keycode_state KeyCode.L 0
	| KeyCode.M -> Hashtbl.replace keycode_state KeyCode.M 0
	| KeyCode.N -> Hashtbl.replace keycode_state KeyCode.N 0
	| KeyCode.O -> Hashtbl.replace keycode_state KeyCode.O 0
	| KeyCode.P -> Hashtbl.replace keycode_state KeyCode.P 0
	| KeyCode.Q -> Hashtbl.replace keycode_state KeyCode.Q 0
	| KeyCode.R -> Hashtbl.replace keycode_state KeyCode.R 0
	| KeyCode.S -> Hashtbl.replace keycode_state KeyCode.S 0
	| KeyCode.T -> Hashtbl.replace keycode_state KeyCode.T 0
	| KeyCode.U -> Hashtbl.replace keycode_state KeyCode.U 0
	| KeyCode.V -> Hashtbl.replace keycode_state KeyCode.V 0
	| KeyCode.W -> Hashtbl.replace keycode_state KeyCode.W 0
	| KeyCode.X -> Hashtbl.replace keycode_state KeyCode.X 0
	| KeyCode.Y -> Hashtbl.replace keycode_state KeyCode.Y 0
	| KeyCode.Z -> Hashtbl.replace keycode_state KeyCode.Z 0
	| KeyCode.Space	-> Hashtbl.replace keycode_state KeyCode.Space 0
	| KeyCode.Escape -> Hashtbl.replace keycode_state KeyCode.Escape 0
	| KeyCode.Return -> Hashtbl.replace keycode_state KeyCode.Return 0
	| KeyCode.Up	-> Hashtbl.replace keycode_state KeyCode.Up 0
	| KeyCode.Down	-> Hashtbl.replace keycode_state KeyCode.Down 0
	| KeyCode.Left	-> Hashtbl.replace keycode_state KeyCode.Left 0
	| KeyCode.Right	-> Hashtbl.replace keycode_state KeyCode.Right 0
	| _ -> ();
	end;
	  Js._true;
      )

  let is_key_pressed key =
    (Hashtbl.find keycode_state key) = 1 
    
end
  
