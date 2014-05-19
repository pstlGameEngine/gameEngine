module MouseButton =
struct
  type t =
    LeftButton
  | RightButton
  | MiddleButton
  | XButton1
  | XButton2
  | MouseButtonCount
end

module Mouse = struct

let mouse_state = Hashtbl.create 30

let init_mouse_state () = 
  Hashtbl.add mouse_state MouseButton.LeftButton 0;
  Hashtbl.add mouse_state MouseButton.RightButton 0;
  Hashtbl.add mouse_state MouseButton.MiddleButton 0
    
let get_MouseButton key =
  match key with
  | 0 -> MouseButton.LeftButton
  | 1 -> MouseButton.MiddleButton
  | _ -> MouseButton.RightButton
    
let rec_up_mouse_evt () =
  Dom_html.window##onmousedown <-
    Dom_html.handler 
    (fun evt -> 
      let ev =  get_MouseButton evt##button in
        (match ev with
        | MouseButton.LeftButton -> Hashtbl.replace mouse_state MouseButton.LeftButton 1
        | MouseButton.RightButton -> Hashtbl.replace mouse_state MouseButton.RightButton 1
        | MouseButton.MiddleButton -> Hashtbl.replace mouse_state MouseButton.MiddleButton 1
	| _ -> ());
	Js._true;
    )

let rec_down_mouse_evt () =
  Dom_html.window##onmouseup <-
    Dom_html.handler 
    (fun evt -> 
      let ev =  get_MouseButton evt##button in
        (match ev with
        | MouseButton.LeftButton -> Hashtbl.replace mouse_state MouseButton.LeftButton 0
        | MouseButton.RightButton -> Hashtbl.replace mouse_state MouseButton.RightButton 0
        | MouseButton.MiddleButton -> Hashtbl.replace mouse_state MouseButton.MiddleButton 0
	| _ -> ());
	Js._true;
    )
    
let reset_mouse_evt () =
  Hashtbl.replace mouse_state MouseButton.LeftButton 0;
  Hashtbl.replace mouse_state MouseButton.RightButton 0;
  Hashtbl.replace mouse_state MouseButton.MiddleButton 0
    
let mouse_pos = Hashtbl.create 10
  
let init_mouse_pos () = 
  Hashtbl.add mouse_pos "x" 0;	
  Hashtbl.add mouse_pos "y" 0;
  Hashtbl.add mouse_pos "x_r" 0;
  Hashtbl.add mouse_pos "y_r" 0

let init_mouse () = 
  init_mouse_pos ();
  init_mouse_state ()
    
let rec_pos_mouse () =
  Dom_html.window##onmousemove <- 
    Dom_html.handler 
    (fun evt -> 
      Hashtbl.replace mouse_pos "x" evt##screenX;
      Hashtbl.replace mouse_pos "y" evt##screenY;
      Hashtbl.replace mouse_pos "x_r" evt##clientX;
      Hashtbl.replace mouse_pos "y_r" evt##clientY;
      Js._true
    )

  let is_button_pressed button = 
    (Hashtbl.find mouse_state button) = 1
	
  let get_position () = 
    (Hashtbl.find mouse_pos "x",Hashtbl.find mouse_pos "y")

  let get_client_position () = 
    (Hashtbl.find mouse_pos "x_r",Hashtbl.find mouse_pos "y_r")
	  
  let set_position  (x,y) = ()
  let set_relative_position mjwin (x,y) = ()

  let update () = 
    rec_up_mouse_evt ();
    rec_down_mouse_evt ();
    rec_pos_mouse ()
end
