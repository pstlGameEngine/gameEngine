open Keyboard

module Orifle =
struct
  
  let score = ref 0

  type time_bar= {mutable current:int ; max:int}

  let tb = {current=0; max=2000}

  let wintime () =
    tb.current <- tb.current + 200

  let indicB = Text.create_text 
			"press 'b' to go back in time" 
		        150.
		        250.
		        20

  let indicP = Text.create_text 
			"press 'p' to pause the game-echap: leave the game" 
		        150.
			310.
		        20

  let indicEchap = Text.create_text 
			"press 'Echap' to leave the game"
			150.
			370.
		        20

  type param = {
    sizeX:float;
    sizeY:float;
    images:Image.t list
  }

  type status = Alive | Dead of int

  type weapon = Gun of int*int*int*int*Image.t 
		(*currentcharge,capacity,fireRate,chauffe,Image*)

  let pistol im =
    Gun (15,15,30,0,im)

  let kalash im =
    Gun (45,45,10,0,im)

  type personne = {
    x:float;
    y:float;
    vitesseX:float;
    gif:Gif.t;
    vivant:status
  }

  type sablier = {
    sx:float;
    sy:float;
    svitesseX:float;
  }

  type bonus = Sab of sablier

  let initSablier x y vx =
    {sx=x; sy=y; svitesseX=vx}

  let bonusSound () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "bonus.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 5.;
        Audio.Sound.play sound

  let bonusBreak () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "glass.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 50.;
        Audio.Sound.play sound

  let initBonus () =
    bonusSound ();
    let ri = Random.int 100 in
      if ri > 40 then
        Sab (initSablier 0. (150. +. (float_of_int ri)) 3.5)
      else
        Sab (initSablier 0. (150. +. (float_of_int ri)) 3.5)

  type trace = Impact of int*float*float

  let initPersonne x y vx gif =
    {x=x; y=y; vitesseX=vx; gif=gif;vivant=Alive}
 
  type terrain = {
    score:int;
    largeur:float;
    hauteur:float
  }

  let translate o dx =
    {o with x = o.x +. dx}

  let bougeBonus b =
    match b with
    | Sab o ->
        Sab {o with sx = o.sx +. o.svitesseX}

  let bougePersonne o =
    translate o o.vitesseX

  type ingame_state = {posX:float;
		       posY:float;
		       gun:weapon;
		       cibles:personne list;
		       bonus: bonus list;
		       traces: trace list;
		       ressources:Image.t list}

  type state = 
	  Menu of Mjmenu.t * Image.t list
	| Ingame of ingame_state
	| Pause of Mjmenu.t * ingame_state
        | Help of Mjmenu.t * state

  let init fen =
    Random.self_init();
    let image = Image.create_from_file "grande_rue.png"
    and gif0 = Image.create_from_file "w-0.png"
    and gif1 = Image.create_from_file "w-1.png"
    and gif2 = Image.create_from_file "w-2.png"
    and gif3 = Image.create_from_file "w-3.png"
    and gif4 = Image.create_from_file "w-4.png"
    and viseur = Image.create_from_file "viseur.png"
    and impact = Image.create_from_file "impact2.png"
    and gun1 = Image.create_from_file "gun2.png"
    and sab = Image.create_from_file "sab.png"
    in 
      let ressources = [image;gif0;gif1;gif2;gif3;gif4;viseur;impact;gun1;sab] in
        Mjwindow.explicit_load fen ressources;
        Menu ((Mjmenu.makeMenu fen ["START";"HELP";"EXIT"]),ressources)

  let init_ingame p = {
    posX=p.sizeX/.2.;
    posY=p.sizeY/.2.;
    gun=Gun (15,15,30,0,(List.nth p.images 8));
    traces=[];
    bonus=[];
    cibles=[];
    ressources=p.images
  }

  let isOver s = false

  let recordCondition etat = 
    match etat with
    | Ingame _ -> true
    | _ -> false


  let backintime () = 
    let res = tb.current > 0 in
      if res then tb.current <- tb.current - 1;
      res

  let backInTimeCondition etat = 
    Keyboard.is_key_pressed KeyCode.B && (backintime ())
    
  let bornerX sizeX x =   
    min (sizeX -. 146.) (max x 146.)
  
  let bornerY sizeY y =
    min (sizeY -. 146.) (max y 146.)

  let isShot f p coord = 
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
     ((bornerX w (fst coord)) > p.x +. 30.)
  && ((bornerX w (fst coord)) < p.x +. 50.)
  && ((bornerY h (snd coord)) > p.y +. 5.)
  && ((bornerY h (snd coord)) < (p.y +. 25.))

  let isShotSab f bonus coord = 
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    match bonus with 
    | Sab s -> let res = ((bornerX w (fst coord)) > s.sx)
  			&& ((bornerX w (fst coord)) < s.sx +. 35.)
  			&& ((bornerY h (snd coord)) > s.sy)
  			&& ((bornerY h (snd coord)) < (s.sy +. 50.)) in 
               if res then begin bonusBreak (); wintime (); res end else false

  let isDead personne =
    match personne.vivant with
    | Dead a -> true
    | _ -> false

  let isOut personne = 
    match personne.vivant with
    | Dead a -> a > 14 || personne.x > 1600.
    | _ -> false

  let isOutSab s= 
    match s with
    | Sab sab -> sab.sx > 1600.

  let kill personne = 
    match personne.vivant with
    | Alive -> {personne with vivant = Dead 1; vitesseX=0.}
    | Dead a -> personne

  let getOld personne = 
    match personne.vivant with
    | Alive -> personne
    | Dead a ->{personne with vivant = Dead (a+1)}

  let float_coord pos = 
    (float_of_int (fst pos)), (float_of_int (snd pos))

  let getPerspectivePos xmouse ymouse sizeX sizeY x y =
    let decalageX = sizeX/.2. -. xmouse 
    and decalageY = sizeY/.2. -. ymouse in
      ((x +. decalageX),(y +. decalageY))

  let decalageX xmouse sizeX x =
    let xm = bornerX sizeX xmouse in
      x +. (sizeX/.2. -. xm)

  let decalageY ymouse sizeY y =
    let ym = bornerY sizeY ymouse in
      y +. (sizeY/.2. -. ym)

  let checkCibles f state pos =
    let w = float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    let newG = match state.gun with
	       | Gun (a,b,c,d,i) -> Gun (a-1,b,c,0,i)
    and newL = List.map (fun e -> if isShot f e (float_coord pos)
				  then kill e
                                  else e) 
			state.cibles
    and newSab = List.filter (fun e -> not (isShotSab f e (float_coord pos))) state.bonus 
    in
      let newT = Impact (0,
			(bornerX w ((fst (float_coord pos))-.10.)),
			(bornerX h ((snd (float_coord pos))-.10.))) in
      {state with gun = newG;
		  bonus = newSab;
		  traces = newT::state.traces;
		  cibles = newL}

  let gunShot () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "gun.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 5.;
        Audio.Sound.play sound

  let gunReload () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "gun_reload.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 15.;
        Audio.Sound.play sound

  let fire state fen =
    match state.gun with
    | Gun (a,b,c,d,i) ->
        if a = 0 then begin
	  gunReload ();
          {state with gun = Gun (b,b,c,-50,i)}
        end else if d > c then begin 
          gunShot ();
          (checkCibles fen state (Mjwindow.Mouse.get_relative_position fen))
        end else
          state 

  let changeStateWithEvent state fen = 
    let w =float_of_int (Mjwindow.getwidth fen) 
    and h = float_of_int (Mjwindow.getheight fen) in
    match state with
    | Pause (m,s) ->
	if (Mjmenu.isClickedItem (Mjmenu.getItem m 0) fen) 
	|| Keyboard.is_key_pressed KeyCode.Space then
          Ingame s
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 1) fen) then
          Help ((Mjmenu.makeMenu fen ["BACK"]),state)
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 2) fen) then
           begin Mjwindow.close fen; state end
        else state
    | Menu (m,r)->
	if (Mjmenu.isClickedItem (Mjmenu.getItem m 0) fen)
        || Keyboard.is_key_pressed KeyCode.Space then
          Ingame (init_ingame {sizeX=w;sizeY=h;images=r})
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 1) fen) then
          Help ((Mjmenu.makeMenu fen ["BACK"]),state)
        else if (Mjmenu.isClickedItem (Mjmenu.getItem m 2) fen) then
           begin Mjwindow.close fen; state end
        else state
    | Ingame current_state ->
        begin
          let pos = (Mjwindow.Mouse.get_relative_position fen)
            in let newS = {current_state with posX = fst (float_coord pos); 
		                              posY = snd (float_coord pos)}
              in
	        if Keyboard.is_key_pressed KeyCode.P then
                  Pause (Mjmenu.makeMenu fen ["CONTINUE";"HELP";"EXIT"],newS)
                else if Mjwindow.Mouse.is_button_pressed Mjwindow.MouseButton.LeftButton then
		  Ingame (fire newS fen)
                else
                  Ingame newS
         end
    | Help (menu,prev) ->
        begin
          if (Mjmenu.isClickedItem (Mjmenu.getItem menu 0) fen) then
            prev
          else
            state
         end


  let explosion f x y a = 
    let rx = (Random.float 20.) -. 10. and ry = (Random.float 10.) -. 20.
    and col = Color.set_alpha_component Color.red (1.-.(float_of_int a)*.0.06)
      in
    Mjwindow.fillCircle f (x+.30.) (y +. 5.) (3. *. (float_of_int a)) col;
    Mjwindow.fillCircle f (x+.30. +. rx) (y +. 5. +. ry) (float_of_int (a/2)) col;
    Mjwindow.fillCircle f (x+.30. +. rx/.2.) (y +. 5. +. ry/.2.) (float_of_int a) col

  let dessinPerso f p etat sX sY alpha b =
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    match p.vivant with
    | Alive -> if b then 
		 Mjwindow.drawGif f
				  p.gif
			          (decalageX etat.posX w p.x)
		        	  (decalageY etat.posY h p.y)
				  80.
				  200.
				  alpha
	       else 
		 Mjwindow.drawImage f
				    (Gif.getCurrent_image p.gif)
				    (decalageX etat.posX w p.x)
		        	    (decalageY etat.posY h p.y)
				    80.
				    200.
				    alpha
    | Dead a -> if b then 
		  Mjwindow.drawGif f
				   p.gif
			           (decalageX etat.posX w p.x)
		        	   (decalageY etat.posY h p.y)
				   80.
				   200.
				   (alpha *. (1.-.((float_of_int a)/.14.)))
		else
		 Mjwindow.drawImage f
				    (Gif.getCurrent_image p.gif)
				    (decalageX etat.posX w p.x)
		        	    (decalageY etat.posY h p.y)
				    80.
				    200.
				    (alpha *. (1.-.((float_of_int a)/.14.)));	
		explosion f 
			  (decalageX etat.posX w p.x)
		          (decalageY etat.posY h p.y)
			  a


  let dessinTrace f trace etat sX sY alpha =
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    match trace with
    | Impact (a,x,y) -> Mjwindow.drawImage 
			f
			(List.nth etat.ressources 7)
			((decalageX etat.posX w x)-.3.)
			(decalageY etat.posY h y)
			20.
			20.
			(alpha *. (1. -. (float_of_int a)/.120.))

  let dessinBonus f b etat sX sY alpha =
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    match b with
    | Sab s -> Mjwindow.drawImage 
			f
			(List.nth etat.ressources 9)
			(decalageX etat.posX w s.sx)
			(decalageY etat.posY h s.sy)
			35.
			50.
			alpha

  let dessinArme f etat alpha =
    let col = Color.set_alpha_component Color.red alpha in
    match etat.gun with
    | Gun (a,b,c,d,i) -> 
      Mjwindow.drawImage f i 10. 30. 35. 30. 1.;
      Mjwindow.strokeRect f 80. 30. ((float_of_int b)*.5.) 20. col;
      if (a=b && d<c) then
        Mjwindow.fillRect  f 80. 30. (((float_of_int ((d+50)*b))/.80.)*.5.)20. col
      else
        Mjwindow.fillRect  f 80. 30. ((float_of_int a)*.5.) 20. col

  let dessinTimebar f etat alpha = 
    let col = Color.set_alpha_component Color.yellow alpha in
      Mjwindow.drawImage f (List.nth etat.ressources 9) 925. 25. 20. 30. 1.;
      Mjwindow.strokeRect f 980. 30. ((float_of_int tb.max)/.10.) 20. col;
      Mjwindow.fillRect  f 980. 30. ((float_of_int tb.current)/.10.) 20. col

  let draw f etat alphaComp b =
    let w =float_of_int (Mjwindow.getwidth f) 
    and h = float_of_int (Mjwindow.getheight f) in
    Mjwindow.drawImage f
		       (List.hd etat.ressources)
		       (decalageX etat.posX w 0.)
		       (decalageY etat.posY h 0.)
		       w
		       h
		       alphaComp;
    List.iter (fun e -> dessinTrace f e etat w h alphaComp) etat.traces;
    List.iter (fun e -> dessinBonus f e etat w h alphaComp) etat.bonus;
    List.iter (fun e -> dessinPerso f e etat w h alphaComp b) etat.cibles;
    Mjwindow.fillRect f 0. 0. w  (h/.2. -. 292./.2.) Color.black;
    Mjwindow.fillRect f 0. (h/.2. +. 292./.2.) w  (h/.2. -. 292./.2.) Color.black;
    Mjwindow.fillRect f 0. 0. ((w-.292.)/.2.) h Color.black;
    Mjwindow.fillRect f (w-.((w-.292.)/.2.)) 0. ((w-.292.)/.2.) h Color.black;
    dessinArme f etat alphaComp;
    dessinTimebar f etat alphaComp;
    Mjwindow.drawImage f (List.nth etat.ressources 6) ((w-.292.)/.2.) (h/.2. -. 292./.2.) 292. 292. alphaComp

  let drawState fen state =
    let w =float_of_int (Mjwindow.getwidth fen) 
    and h = float_of_int (Mjwindow.getheight fen) in
    match state with
    | Ingame etat ->
        begin 
          draw fen etat 1. true
        end
    | Menu (m,_) -> Mjmenu.display_menu fen m
    | Pause (m,s) ->
	draw fen s 1. false;
	let col = Color.set_alpha_component Color.black 0.5 in
	Mjwindow.fillRect fen 0. 0. w h col;
	Mjmenu.display_menu fen m
    | Help (m,s) -> 
      begin
        Mjwindow.writeText fen indicEchap Color.white;
        Mjwindow.writeText fen indicP Color.white;
        Mjwindow.writeText fen indicB Color.white;
	Mjmenu.display_menu fen m
      end

  let drawGhosts fen s = ()

  let print_state s = ()

  let getPeopleGif liste =
    [(List.nth liste 1);
     (List.nth liste 2);
     (List.nth liste 3);
     (List.nth liste 4);
     (List.nth liste 5)]

  let addPeople s = 
    let n = Random.int 1000 and y = (Random.float 20.) -. 10. in
      match n > 980 with
      | true -> let gif = Gif.make_gif (getPeopleGif s.ressources) 5 in
		  let newP = initPersonne 0. (380. -. y) (1.2 +. (y/.20.)) gif in
		  if n = 999 then
                    let newB = initBonus () in
                    {s with bonus = newB::s.bonus;
			    cibles = newP::s.cibles}
                  else {s with cibles = newP::s.cibles}
      | false -> s

  let getOldTraces trace = 
    match trace with 
    | Impact (age,x,y) -> Impact ((age + 1),x,y)

  let tooOld trace = 
    match trace with 
    | Impact (age,_,_) -> age > 120

  let movePeople state =
    let newG = match state.gun with
	       | Gun (a,b,c,d,i) -> Gun (a,b,c,d+1,i)
    and moved = List.map (fun e -> getOld (bougePersonne e)) state.cibles
    and movedSab = List.map (fun e -> bougeBonus e) state.bonus in
      let removeOld = List.filter (fun e -> not (isOut e)) moved
      and removeOldSab = List.filter (fun e -> not (isOutSab e)) movedSab
      and newTraces =  List.map (fun e -> getOldTraces e) state.traces in
      let removeOldTraces = List.filter (fun e -> not (tooOld e)) newTraces in
        (*if state.shot = 15  then gunReload ();*)
        {state with gun = newG;
	            bonus = removeOldSab;
		    traces = removeOldTraces;
		    cibles = removeOld}

  let action state =
    let s = movePeople state in
      addPeople s

  let tick state = 
    match state with
    | Menu _ | Pause _ | Help _ -> state
    | Ingame s -> Ingame (action s)

  let compare state1 state2 =
    match state1,state2 with
    | _ -> 0

end

module StockableRifle = Timebis.TIMELINE(Orifle)

let _ =
  let fen = Mjwindow.create_window 1200. 600. "HEAD SHOT" 60 Color.black
    in 
      StockableRifle.play fen	    
	                 StockableRifle.DrawThenEvent
		         1
