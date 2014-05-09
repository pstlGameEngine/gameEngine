type rw = Target of OcsfmlGraphics.render_window

let set_title rw title =
  match rw with
  |Target t -> t#set_title title

let draw rw drawable =
  match rw with
  |Target t -> t#draw drawable

let rw_getwidth rw = 
  match rw with
  |Target t -> t#get_width

let rw_getheight rw = 
  match rw with
  |Target t -> t#get_height

let rw_clear rw col = 
  match rw with
  |Target t -> t#clear ~color:col ()

let isOpen rw = 
  match rw with
  |Target t -> t#is_open

let rw_display rw =
  match rw with 
  |Target t -> t#display

let rw_close rw =
  match rw with 
  |Target t -> t#close

let rw_getRelativePosition rw =
  match rw with 
  |Target t -> OcsfmlWindow.Mouse.get_relative_position t

let rw_setRelativePosition rw pos =
  match rw with 
  |Target t -> OcsfmlWindow.Mouse.set_relative_position pos t

let toSfmlColor pstlcolor = 
  (OcsfmlGraphics.Color.rgba 
	(Color.red_comp pstlcolor) 
	(Color.green_comp pstlcolor) 
	(Color.blue_comp pstlcolor) 
	(int_of_float (Color.alpha_comp pstlcolor *. 255.)))

type t = {fen:rw;
	 background:OcsfmlGraphics.Color.t;
	 font:OcsfmlGraphics.font;
	 ressources:Loader.cache}

let getwidth t = 
  rw_getwidth t.fen

let getheight t = 
  rw_getheight t.fen

let getRenderWindow fen = 
  fen.fen

let redrawBackground fen =
	()
	
let getRelativePosition fen = 
  rw_getRelativePosition fen.fen

let setRelativePosition fen pos = 
  rw_setRelativePosition fen.fen pos

let explicit_load fen images =
  List.iter 
    (fun pic ->
       let fn = Image.get_filename pic in 
         let tex = new OcsfmlGraphics.texture (`File fn) in 
         Loader.addToCache fen.ressources fn (Loader.Im tex))
    images

let setTitle f t = set_title f.fen t

let fillRect fen a b c d col =
  let r = new OcsfmlGraphics.rectangle_shape ~size:(c,d)
			      ~fill_color: (toSfmlColor col)
		              ~outline_color: (toSfmlColor col)
			      ~position:(a,b) () in
  draw fen.fen r

let strokeRect fen a b c d col =
  let r = new OcsfmlGraphics.rectangle_shape ~size:(c,d)
			      ~fill_color:(OcsfmlGraphics.Color.rgba 255 255 255 0)
		              ~outline_color: (toSfmlColor col)
			      ~outline_thickness:1.
			      ~position:(a,b) () in
  draw fen.fen r

let fillCircle fen x y radius col =
  let circle = new OcsfmlGraphics.circle_shape ~radius:(radius/.2.)
 				~outline_color:(toSfmlColor col)
				~fill_color:(toSfmlColor col)
 				~outline_thickness:1.
 				~position:(x-.radius/.2., y-.radius/.2.) () in
  draw fen.fen circle

let strokeCircle fen x y radius col =
    let circle = new OcsfmlGraphics.circle_shape ~radius:(radius/.2.)
 				~outline_color:(toSfmlColor col)
				~fill_color:(OcsfmlGraphics.Color.rgba 255 255 255 0)
 				~outline_thickness:1.
 				~position:(x-.radius/.2., y-.radius/.2.) () in
    draw fen.fen circle
  
let writeText fen texte col =
  let text = new OcsfmlGraphics.text ~string: (Text.get_content texte)
		      ~position:((Text.get_posx texte), (Text.get_posy texte))
		      ~color: (toSfmlColor col)
		      ~font: fen.font 
                      ~character_size: (Text.get_size texte) () 
  in
  draw fen.fen text

let drawImage fen pic posX posY sizeX sizeY alpha =
  try 
    let t = Loader.find fen.ressources (Image.get_filename pic) in  
    match t with 
    | Loader.Im tex ->let dim = tex#get_size in 
    let scaleX = sizeX /. (float_of_int (fst dim)) 
    and scaleY = sizeY /. (float_of_int (snd dim)) in
    let sprite = new OcsfmlGraphics.sprite ~texture:tex
			  ~position:(posX,posY) 
			  ~color:(OcsfmlGraphics.Color.rgba 
					255 
					255
					255
					(int_of_float (alpha*.255.)))
			  ~scale:(scaleX, scaleY) () in
    draw fen.fen sprite
  with
    | _ -> 
    let tex = new OcsfmlGraphics.texture (`File (Image.get_filename pic)) in
    Loader.addToCache fen.ressources (Image.get_filename pic) (Loader.Im tex); 
    let dim = tex#get_size in 
    let scaleX = sizeX /. (float_of_int (fst dim)) 
    and scaleY = sizeY /. (float_of_int (snd dim)) in
    let sprite = new OcsfmlGraphics.sprite ~texture:tex
			  ~position:(posX,posY) 
			  ~color:(OcsfmlGraphics.Color.rgba
					255
					255
					255
					(int_of_float (alpha*.255.)))
			  ~scale:(scaleX, scaleY) () in
    draw fen.fen sprite

let drawGif fen gif posX posY sizeX sizeY alpha =
   drawImage fen (Gif.getCurrent_image gif) posX posY sizeX sizeY alpha;
   Gif.getNext gif


let clear fen =
  rw_clear fen.fen fen.background
	
let rec display fenetre frame b = 
  if isOpen fenetre.fen then begin
    if b then clear fenetre;
    frame fenetre;
    rw_display fenetre.fen;
    display fenetre frame b
end

let rec display_tm fenetre frame opt b = 
  if isOpen fenetre.fen then begin
    if b then (
		clear fenetre;
    let res = frame fenetre opt in
    rw_display fenetre.fen;
    display_tm fenetre frame res b
		)else (
    	frame fenetre opt;
			rw_display fenetre.fen;
		);
  end

let create_window x y title framerate bg =
  let w = new OcsfmlGraphics.render_window (OcsfmlWindow.VideoMode.create 
					      ~w:(int_of_float x) 
                                              ~h:(int_of_float y) ()) title 
  in 
    w#set_framerate_limit framerate;
    {fen = Target w;
     background=(OcsfmlGraphics.Color.rgba 
			(Color.red_comp bg) 
			(Color.green_comp bg) 
			(Color.blue_comp bg) 
			(int_of_float (Color.alpha_comp bg *. 255.)));
     font = new OcsfmlGraphics.font (`File "arial.ttf");
     ressources=Loader.initCache 10}

let close fen =
  rw_close fen.fen;
  fen.font#destroy


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
    
  let set_position (x,y) = OcsfmlWindow.Mouse.set_position (x,y) 
   
  let get_relative_position mjwin = 
    getRelativePosition mjwin
  let set_relative_position mjwin pos = 
    setRelativePosition mjwin pos
    
end

let mouse_state =  Hashtbl.create 0
let mouse_pos =  Hashtbl.create 0


