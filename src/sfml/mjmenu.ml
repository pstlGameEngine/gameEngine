type item = {text : Text.t; bounds:int*int*int*int}

let inBounds item pos =
  match item.bounds with
  | (a,b,c,d) ->
       (fst pos) < a+c && (fst pos) > a 
    && (snd pos) > b && (snd pos) < b+d

let isMouseOverItem item fen = 
  inBounds item (Mjwindow.Mouse.get_relative_position fen)

let isClickedItem item fen =
  Mjwindow.Mouse.is_button_pressed Mjwindow.MouseButton.LeftButton 
  && (isMouseOverItem item fen)

type t = {items : item list}

let display_item fen item =
  let col = 
    if isMouseOverItem item fen then
      Color.red
    else
      Color.white
  in
  Mjwindow.writeText fen item.text col

let display_menu fen menu =
  List.iter (fun item -> (display_item fen item)) menu.items

let makeItem fen nb_item index text = 
  let h = (Mjwindow.getheight fen) 
  and w = float_of_int (Mjwindow.getwidth fen) in
    let a = (int_of_float w) / 4 
    and high =(int_of_float ((0.2 *. (float_of_int h))/.(float_of_int nb_item)))
    and b = (float_of_int h)*.0.1 +. (float_of_int index) *. (0.8 *. (float_of_int h)) /. (float_of_int nb_item)
    in let largeur = int_of_float (0.9 *. (float_of_int (String.length text)) *. (float_of_int (high)))
      in let t = Text.create_text 
		       text 
		       (float_of_int a) 
		       b
		       high
        in 
  {text=t; bounds=(a,(int_of_float b),largeur, high)}

let rec makeMenu_aux fen alreadyMade toMake pos nb_total= 
  match toMake with 
  | h::t -> 
	let it = makeItem fen nb_total pos h in
          makeMenu_aux fen (alreadyMade@[it]) t (pos+1) nb_total
  | [] -> alreadyMade

let getClickedTexts fen menu = 
  List.filter (fun it -> isClickedItem it fen) menu.items

let getItem menu index = List.nth menu.items index

let makeMenu fen liste =
  print_string "menu "; print_newline();
  let its = makeMenu_aux fen [] liste 0 (List.length liste) in
    print_string "menu fait "; print_newline();
    {items=its}
