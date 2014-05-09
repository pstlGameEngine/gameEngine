open Dom_html
open Text
open Image
open Keyboard

type timer = None | Timer of interval_id

type t = {doc:document Js.t;
          can:canvasElement Js.t;
          cont:canvasRenderingContext2D Js.t;
	  background : Js.js_string Js.t;
          framerate:float;
	  ressources:Loader.cache;
	  mutable interval : timer;
          mutable title:string}

let toJsColor pstlcolor = 
  let c = CSS.Color.RGBA (
    Color.red_comp pstlcolor,
    Color.green_comp pstlcolor,
    Color.blue_comp pstlcolor,
    Color.alpha_comp pstlcolor) in
  Js.string (CSS.Color.string_of_t c)

let setTimer window time = {window with interval = time}

let getRelativePosition fen = (0,0)

let setTitle window t = 
  window.title <- t

let explicit_load fen images = 
  List.iter 
    (fun image -> 
      let im = createImg fen.doc in
      im##src<- Js.string (get_filename image);
      im##onload<-handler 
	(fun _ -> 
	  Loader.addToCache fen.ressources (get_filename image) (Loader.Im im);
	  Js._true  
	)
    )
    images

let getwidth fen = 
  fen.can##width

let getheight fen = 
  fen.can##height

let fillRect fen x1 y1 x2 y2 col =
  fen.cont##globalAlpha <- 1.;
  fen.cont##fillStyle <- (toJsColor col);
  fen.cont##fillRect (x1,y1,x2,y2);
  fen.cont##fillStyle <- fen.background

let strokeRect fen a b c d col =
  fen.cont##globalAlpha <- 1.;
  fen.cont##strokeStyle <- (toJsColor col);
  fen.cont##strokeRect (a,b,c,d);
  fen.cont##strokeStyle <- fen.background

let fillCircle fen x y radius color =
  fen.cont##globalAlpha <- 1.;
  fen.cont##fillStyle <- toJsColor color;
  fen.cont##beginPath();
  fen.cont##arc(x,
		y,
		radius/.2., 0., 3.1416*.2., Js._true); 
  fen.cont##closePath();
  fen.cont##fill()

let strokeCircle fen x y radius color =
  fen.cont##globalAlpha <- 1.;
  fen.cont##beginPath();
  fen.cont##arc(x,
		y,
		radius/.2., 0., 3.1416*.2., Js._true); 
  fen.cont##closePath();
  fen.cont##strokeStyle <- toJsColor color;
  fen.cont##stroke()

let drawImage fen image posX posY sizeX sizeY alpha= 
  let oldAlpha = fen.cont##globalAlpha in
  fen.cont##globalAlpha <- alpha;
  try 
    let ress = Loader.find fen.ressources (get_filename image) in
    match ress with 
    | Loader.Im im -> fen.cont##drawImage_withSize (im, posX, posY, sizeX, sizeY);
    fen.cont##globalAlpha <- oldAlpha
  with
  | _ -> 
    let im = createImg fen.doc in
    im##src<- Js.string (get_filename image);
    im##onload<-handler 
      (fun _ -> Loader.addToCache fen.ressources (get_filename image) (Loader.Im im);
	fen.cont##drawImage_withSize (im, posX, posY, sizeX ,sizeY);
        fen.cont##globalAlpha <- oldAlpha;
	Js._true)     

let drawGif fen gif posX posY sizeX sizeY alpha =
   drawImage fen (Gif.getCurrent_image gif) posX posY sizeX sizeY alpha;
   Gif.getNext gif

let redrawBackground fen = 
  fen.cont##fillStyle <- fen.background;
  fen.cont##fillRect (
    0.,
    0.,
    float_of_int fen.can##width,
    float_of_int fen.can##height)


let clear fen = 
  fen.can##width<-fen.can##width; (*tout effacer. tous les navigateurs?*)
  redrawBackground fen

let writeText fen t col = 
  fen.cont##fillStyle <- toJsColor col;
  let towrite = Js.string (get_content t) in
  fen.cont##font <- Js.string ((string_of_int (get_size t))^"px arial");
  fen.cont##fillText (towrite, (get_posx t), (get_posy t))
 
let getRelativePosition fen = 
  (0,0)

let setRelativePosition fen pos = 
  ()   

(******* Gestion des Events pérphérique *)
(** Souris *)
(** Click *)
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

(** Hashtable des etats de la souris*)
let mouse_state = Hashtbl.create 30
(** Initialitation du hashtable
    0 -> clikUp
    1 -> clickDown
*)
let init_mouse_state () = 
  Hashtbl.add mouse_state MouseButton.LeftButton 0;
  Hashtbl.add mouse_state MouseButton.RightButton 0;
  Hashtbl.add mouse_state MouseButton.MiddleButton 0
    
(** Association des MouseButton a un int *)
let get_MouseButton key =
  match key with
  | 0 -> MouseButton.LeftButton
  | 1 -> MouseButton.MiddleButton
  | _ -> MouseButton.RightButton
    
(** Enregistre dans un tableau tout les events souris *)
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
    
(** Position *)
(** Hashtable de la position de la souris*)
let mouse_pos = Hashtbl.create 10
(** Initialitation du hashtable
    x -> position x de la souris par rapport à l'écran
    y -> position y de la souris par rapport à l'écran
    x_r -> position x_r de la souris par rapport à l'écran
    y_r -> position y_r de la souris par rapport à l'écran	
*)
  
let init_mouse_pos () = 
  Hashtbl.add mouse_pos "x" 0;	
  Hashtbl.add mouse_pos "y" 0;
  Hashtbl.add mouse_pos "x_r" 0;
  Hashtbl.add mouse_pos "y_r" 0
    
(** Enregistre dans un tableau tout les events souris *)
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

module Mouse =
struct
  let is_button_pressed button = 
    (Hashtbl.find mouse_state button) = 1
	
  let get_position () = 
    (Hashtbl.find mouse_pos "x",Hashtbl.find mouse_pos "y")
	
  let get_relative_position mjwin =
    let (a,b) = elementClientPosition mjwin.can in
      ((Hashtbl.find mouse_pos "x_r")-a,(Hashtbl.find mouse_pos "y_r")-b)
      
  let set_position  (x,y) = ()
  let set_relative_position mjwin (x,y) = ()
end


(** Do what the window have to do each frame*)
let todo_frame () =
  (*reset_mouse_evt ();*)
  Keyboard.rec_down_keyboard_evt ();
  Keyboard.rec_up_keyboard_evt ();
  rec_up_mouse_evt ();
  rec_down_mouse_evt ();
  rec_pos_mouse ()

(** Create a window 
x -> width
y -> height
title -> the title
framerate -> the framerate
background -> the color of the background*)
let create_window x y title framerate background =
  let d = window##document in
  let canvas = createCanvas d in
  let context = canvas##getContext (Dom_html._2d_) in
  canvas##width<- (int_of_float x);
  canvas##height<- (int_of_float y);
  context##fillStyle <- toJsColor background;
  context##fillRect (0.,0.,x, y);
  Keyboard.init_keycode_state();
  init_mouse_state();
  init_mouse_state();
  let fr = 1000./.(float_of_int framerate) in
  {doc=d;
   can=canvas;
   cont=context;
   background = toJsColor background;
   framerate=fr;
   ressources=Loader.initCache 10;
   interval = None;
   title=title}
    
let display fen frame b = 

  fen.doc##title <- Js.string fen.title;
  let f _ = 
    ignore (Dom.appendChild fen.doc##body fen.can);
    ignore (fen.interval = 
    	Timer (window##setInterval  
	     (Js.wrap_callback 
	     	(fun _ ->
	           todo_frame ();
	           if b then (clear fen);
  	           frame fen),
                 fen.framerate)));
    Js._true
  in 
  window##onload <- handler f

let display_tm fen frame opt b = 
  fen.doc##title <- Js.string fen.title;
  let optt = ref opt in 
  let f _ = 
    ignore (Dom.appendChild fen.doc##body fen.can);
    ignore (fen.interval = 
    	Timer (window##setInterval  
	     (Js.wrap_callback 
                (fun _ -> 
	           todo_frame (); 
                   if b then (clear fen);
	           optt := frame fen !optt),
                fen.framerate)));
    Js._true
  in 
  window##onload <- handler f
	

let close fen = 
  match fen.interval with
  | Timer i -> window##clearInterval (i)
  | _ -> ();
    Dom.removeChild fen.doc##body fen.can
