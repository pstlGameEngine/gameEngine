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

    (** Hashtable des etats des touches du clavier 111 touches Max*)
  let keycode_state = Hashtbl.create 111
    
    (** Initialitation du hashtable
	0 -> keyUp
	1 -> keyDown
    *)
  let init_keycode_state () = 
    Hashtbl.add keycode_state A false;
    Hashtbl.add keycode_state B false;
    Hashtbl.add keycode_state C false;
    Hashtbl.add keycode_state D false;
    Hashtbl.add keycode_state E false;
    Hashtbl.add keycode_state F false;
    Hashtbl.add keycode_state G false;
    Hashtbl.add keycode_state H false;
    Hashtbl.add keycode_state I false;
    Hashtbl.add keycode_state J false;
    Hashtbl.add keycode_state K false;
    Hashtbl.add keycode_state L false;
    Hashtbl.add keycode_state M false;
    Hashtbl.add keycode_state N false;
    Hashtbl.add keycode_state O false;
    Hashtbl.add keycode_state P false;
    Hashtbl.add keycode_state Q false;
    Hashtbl.add keycode_state R false;
    Hashtbl.add keycode_state S false;
    Hashtbl.add keycode_state T false;
    Hashtbl.add keycode_state U false;
    Hashtbl.add keycode_state V false;
    Hashtbl.add keycode_state W false;
    Hashtbl.add keycode_state X false;
    Hashtbl.add keycode_state Y false;
    Hashtbl.add keycode_state Z false;
    Hashtbl.add keycode_state Space false;
    Hashtbl.add keycode_state Escape false;
    Hashtbl.add keycode_state Return false;
    Hashtbl.add keycode_state Up false;
    Hashtbl.add keycode_state Down false;
    Hashtbl.add keycode_state Left false;
    Hashtbl.add keycode_state Right false

    (** Association des KeyCode a un ASCII *)
  let get_KeyCode key =
    match key with
    | 65 -> A
    | 66 -> B
    | 67 -> C
    | 68 -> D
    | 69 -> E
    | 70 -> F
    | 71 -> G
    | 72 -> H
    | 73 -> I
    | 74 -> J
    | 75 -> K
    | 76 -> L
    | 77 -> M
    | 78 -> N
    | 79 -> O
    | 80 -> P
    | 81 -> Q
    | 82 -> R
    | 83 -> S
    | 84 -> T
    | 85 -> U
    | 86 -> V
    | 87 -> W
    | 88 -> X
    | 89 -> Y
    | 90 -> Z
    | 32 -> Space
    | 27 -> Escape
    |  9 -> Return
    | 37 -> Left
    | 38 -> Up
    | 39 -> Right
    | 40 -> Down
    | _  -> Unknown
      
    (** Enregistre dans un tableau tout les events keyboard *)
  let rec_down_keyboard_evt () =
    Dom_html.window##onkeydown <-
      Dom_html.handler 
      (fun evt -> 
	let ev =  get_KeyCode evt##keyCode in
	begin 
	match ev with 
	| A -> Hashtbl.replace keycode_state A true
	| B -> Hashtbl.replace keycode_state B true
	| C -> Hashtbl.replace keycode_state C true
	| D -> Hashtbl.replace keycode_state D true
	| E -> Hashtbl.replace keycode_state E true
	| F -> Hashtbl.replace keycode_state F true
	| G -> Hashtbl.replace keycode_state G true
	| H -> Hashtbl.replace keycode_state H true
	| I -> Hashtbl.replace keycode_state I true
	| J -> Hashtbl.replace keycode_state J true
	| K -> Hashtbl.replace keycode_state K true
	| L -> Hashtbl.replace keycode_state L true
	| M -> Hashtbl.replace keycode_state M true
	| N -> Hashtbl.replace keycode_state N true
	| O -> Hashtbl.replace keycode_state O true
	| P -> Hashtbl.replace keycode_state P true
	| Q -> Hashtbl.replace keycode_state Q true
	| R -> Hashtbl.replace keycode_state R true
	| S -> Hashtbl.replace keycode_state S true
	| T -> Hashtbl.replace keycode_state T true
	| U -> Hashtbl.replace keycode_state U true
	| V -> Hashtbl.replace keycode_state V true
	| W -> Hashtbl.replace keycode_state W true
	| X -> Hashtbl.replace keycode_state X true
	| Y -> Hashtbl.replace keycode_state Y true
	| Z -> Hashtbl.replace keycode_state Z true
	| Space	 -> Hashtbl.replace keycode_state Space true
	| Escape -> Hashtbl.replace keycode_state Escape true
	| Return -> Hashtbl.replace keycode_state Return true
	| Up	 -> Hashtbl.replace keycode_state Up true
	| Down	 -> Hashtbl.replace keycode_state Down true
	| Left	 -> Hashtbl.replace keycode_state Left true
	| Right	 -> Hashtbl.replace keycode_state Right true
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
	| A -> Hashtbl.replace keycode_state A false
	| B -> Hashtbl.replace keycode_state B false
	| C -> Hashtbl.replace keycode_state C false
	| D -> Hashtbl.replace keycode_state D false
	| E -> Hashtbl.replace keycode_state E false
	| F -> Hashtbl.replace keycode_state F false
	| G -> Hashtbl.replace keycode_state G false
	| H -> Hashtbl.replace keycode_state H false
	| I -> Hashtbl.replace keycode_state I false
	| J -> Hashtbl.replace keycode_state J false
	| K -> Hashtbl.replace keycode_state K false
	| L -> Hashtbl.replace keycode_state L false
	| M -> Hashtbl.replace keycode_state M false
	| N -> Hashtbl.replace keycode_state N false
	| O -> Hashtbl.replace keycode_state O false
	| P -> Hashtbl.replace keycode_state P false
	| Q -> Hashtbl.replace keycode_state Q false
	| R -> Hashtbl.replace keycode_state R false
	| S -> Hashtbl.replace keycode_state S false
	| T -> Hashtbl.replace keycode_state T false
	| U -> Hashtbl.replace keycode_state U false
	| V -> Hashtbl.replace keycode_state V false
	| W -> Hashtbl.replace keycode_state W false
	| X -> Hashtbl.replace keycode_state X false
	| Y -> Hashtbl.replace keycode_state Y false
	| Z -> Hashtbl.replace keycode_state Z false
	| Space	-> Hashtbl.replace keycode_state Space false
	| Escape -> Hashtbl.replace keycode_state Escape false
	| Return -> Hashtbl.replace keycode_state Return false
	| Up	-> Hashtbl.replace keycode_state Up false
	| Down	-> Hashtbl.replace keycode_state Down false
	| Left	-> Hashtbl.replace keycode_state Left false
	| Right	-> Hashtbl.replace keycode_state Right false
	| _ -> ();
	end;
	  Js._true;
      )

  let is_key_pressed key = (Hashtbl.find keycode_state key)

  let update () =
    rec_down_keyboard_evt ();
    rec_up_keyboard_evt ();
