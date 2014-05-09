open Keyboard

module Pong =
struct
  type objet_type = Raquette | Balle 

  type param = {
    sizeRaquette:float;
    sizeBalle:float;
    sizeField:float
  }

  type objet = {
    x:float;
    y:float;
    taille:float;
    vitesseX:float;
    vitesseY:float;
    t : objet_type
  }

  let initObjet x y taille vx vy t =
    {x=x; y=y; taille=taille; vitesseX=vx; vitesseY=vy; t=t}
 
  type terrain = {
    score:int;
    largeur:float;
    hauteur:float
  }

  let translate t o dx dy =
  match o.t with
  |Raquette -> 
    let vx = if o.x >= (t.largeur -. o.taille /. 2.)
	     || o.x <= (o.taille /. 2. )then 0. else o.vitesseX
    in
    {o with x = max 0. (min (t.largeur -. o.taille) (o.x +. dx));
	    vitesseX = vx}
  | _ -> 
    {o with x = max 0. (min (t.largeur -. o.taille /. 2.) (o.x +. dx));
            y = max 0. (min (t.hauteur -. o.taille /. 2.) (o.y +. dy))}

  let bougeObj t o =
    translate t o o.vitesseX o.vitesseY

  let pongSound () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "pong.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 25.;
        Audio.Sound.play sound

  let rebond balle raq = 
    pongSound ();
    {balle with 
      vitesseY = balle.vitesseY *. -1.;
      vitesseX = (min 8. (balle.vitesseX +. (0.25 *. raq.vitesseX)))}
    (* la raquette donne un petit effet à la balle*)
    
  let moveIa t b rb =
    if b.vitesseY > 0. then bougeObj t {rb with vitesseX=0.}
    else if (rb.x -. 4. +. rb.taille/.2.) > b.x then
      bougeObj t {rb with vitesseX=(-1.4)}
    else
      bougeObj t {rb with vitesseX=(1.4)}

  type ingame_state = {b:objet; rA:objet; rB:objet; field:terrain}

  type state = 
	  Menu of Mjmenu.t 
	| Ingame of ingame_state
	| Pause of Mjmenu.t * ingame_state

  let init fen = 
    print_string "initialisation "; print_newline();
    Menu (Mjmenu.makeMenu fen ["START";"EXIT"])

  let init_ingame p = 
     Random.self_init();
     let x = 2.5 -. (Random.float 5.) in
	{
	  b     = initObjet 200. 200. p.sizeBalle x 2. Balle;
	  rA    = initObjet 200. 390. p.sizeRaquette 0. 0. Raquette;
	  rB    = initObjet 200. 10. p.sizeRaquette 0. 0. Raquette;
	  field = {score=0;largeur=p.sizeField; hauteur=p.sizeField}
	}

  let isOver s = false

  let recordCondition etat = 
    match etat with
    | Ingame _ -> true
    | _ -> false

  let backInTimeCondition etat = Keyboard.is_key_pressed KeyCode.B

  let addVitesseXObj obj vit =	
    match obj.vitesseX *. vit <= 0. with
    | true -> {obj with vitesseX = vit}
    | false ->  {obj with vitesseX = obj.vitesseX +. vit}

  let addVitesseYObj obj vit =	
    {obj with vitesseX = obj.vitesseY +. vit}

  let setVitesseRaqA s vit =
    let newV = 
      if (s.rA.vitesseX +. vit < 0. ) then
        max (0. -. 8.) (s.rA.vitesseX +. vit)
      else
        min 8. ( s.rA.vitesseX +. vit)
    in
    let newRa = {s.rA with vitesseX = newV} in
     {s with rA = newRa}

  let stopRaqA s =
    let newRa = {s.rA with vitesseX = 0.} in
    {s with rA = newRa}

  let entre p a b c d =
    (fst p) < b && (fst p) > a && (snd p) > c && (snd p) < d

  let changeStateWithEvent state fen = 
    match state with
    | Pause (m,s) ->
	if (Mjmenu.isClickedItem (Mjmenu.getItem m 0) fen) 
	|| Keyboard.is_key_pressed KeyCode.Space then
          Ingame (s)
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 1) fen) then
           begin Mjwindow.close fen; state end
        else state
    | Menu m->
	if (Mjmenu.isClickedItem (Mjmenu.getItem m 0) fen)
        || Keyboard.is_key_pressed KeyCode.Space then
          Ingame (init_ingame {sizeRaquette=100.;sizeBalle=10.;sizeField=400.})
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 1) fen) then
           begin Mjwindow.close fen; state end
        else state
    | Ingame current_state -> 
        begin
	  if Keyboard.is_key_pressed KeyCode.P then
            Pause (Mjmenu.makeMenu fen ["CONTINUE";"EXIT"],current_state)
          else if Keyboard.is_key_pressed KeyCode.Left then
            Ingame (setVitesseRaqA current_state (-10.))
          else if Keyboard.is_key_pressed KeyCode.Right then
            Ingame (setVitesseRaqA current_state (10.))
          else
            Ingame (stopRaqA current_state)
        end

  let dessinBalle f obj alphaComp =
    let col = (Color.set_alpha_component Color.yellow alphaComp) in
      Mjwindow.fillCircle f obj.x obj.y obj.taille col
    

  let dessinRaquette f obj alphaComp =
    let col = (Color.set_alpha_component Color.cyan alphaComp) in
      Mjwindow.strokeRect f obj.x obj.y 120. 1. col

  let draw fen etat alphaComp = 
    dessinRaquette fen etat.rA alphaComp;
    dessinRaquette fen etat.rB alphaComp;
    dessinBalle fen etat.b alphaComp

  let drawState fen state = 
    match state with
    | Ingame etat ->
        begin 
          draw fen etat 1.;
          let score = string_of_int (etat.field.score) in  
          let textScore = Text.create_text score 380. 15. 15 in
          Mjwindow.writeText fen textScore Color.white
        end
    | Menu m -> Mjmenu.display_menu fen m
    | Pause (m,s) -> draw fen s 0.4; Mjmenu.display_menu fen m

  let drawGhosts fen s = 
    match s with
    | Menu _ | Pause _ -> ()
    | Ingame etat -> dessinBalle fen etat.b 0.4  (*pas besoin de dessiner les raquette*)

  let print_state s = ()

  let checkBalleOnRaquette s = 
    if (s.b.y -. s.b.taille/.2.) <= s.rB.y then
      begin
        if (s.b.x -. s.b.taille/.2.) < s.rB.x +. s.rB.taille
        && (s.b.x -. s.b.taille/.2.) > s.rB.x then
          {s with b = rebond s.b s.rB}
        else
          {s with b = (initObjet 200. 200. 10. 4. 2. Balle);
    	          field = {s.field with score = s.field.score + 20}}
      end
    else if (s.b.y +. s.b.taille/.2.) >= s.rA.y then
      if (s.b.x -. s.b.taille/.2.) < s.rA.x +. s.rA.taille
      && (s.b.x -. s.b.taille/.2.) > s.rA.x then
        {s with 
	  b = rebond s.b s.rA;
	  field = {s.field with score = s.field.score + 1}}
      else {s with b = initObjet 200. 200. 10. 4. 2. Balle}
    else
      s

  let checkBalleInField s =
    if s.b.x +. s.b.taille > s.field.largeur 
    || s.b.x -. s.b.taille < 0. then begin
      pongSound ();
      let newB = {s.b with vitesseX = s.b.vitesseX *. (-1.)}
      in checkBalleOnRaquette {s with b = newB}
    end else 
      checkBalleOnRaquette s

  let tick state = 
    match state with
    | Menu _ | Pause _ -> state
    | Ingame s -> 
        let newS = {
          b     = bougeObj s.field s.b; 
          rA    = bougeObj s.field s.rA;
          rB    = moveIa s.field s.b s.rB;
          field = s.field
        } in
        Ingame (checkBalleInField newS)
end

let _ =
  let gameLoop fen current = 
    Pong.drawState fen current;
    let newState = Pong.changeStateWithEvent current fen in
    Pong.tick newState

  and fen = Mjwindow.create_window 400. 400. "Pong" 60 Color.black
  in Mjwindow.display_tm fen 
			 gameLoop 
			 (Pong.init fen)
			 true




