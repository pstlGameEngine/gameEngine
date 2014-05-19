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
  
module Mouse =
struct

  let init_mouse () = ()

  let get_button button = 
    match button with 
    | MouseButton.LeftButton -> OcsfmlWindow.Event.LeftButton
    | MouseButton.RightButton -> OcsfmlWindow.Event.RightButton
    | MouseButton.MiddleButton -> OcsfmlWindow.Event.MiddleButton
    | MouseButton.XButton1 -> OcsfmlWindow.Event.XButton1
    | MouseButton.XButton2 -> OcsfmlWindow.Event.XButton2
    | _ -> OcsfmlWindow.Event.MouseButtonCount
      
  let is_button_pressed button = OcsfmlWindow.Mouse.is_button_pressed (get_button button)
    
  let get_position = OcsfmlWindow.Mouse.get_position

  let get_client_position () = (-1,-1)

  let set_position (x,y) = OcsfmlWindow.Mouse.set_position (x,y) 
   
  let set_relative_position mjwin pos = ()
    
  let update () = ()
end
