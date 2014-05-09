open Time
open Keyboard

module ShootCaml =
struct
  (************ Définition obligatoire ***************)
  let head = ref 0
	let tree = ref 0
  type state = {bulletList: (float*float) list; 
		badBulletList: (float*float) list; 
		badShipList: (float*float) list; 
		ship: (float*float); 
		life:int;
		score: int}
    
  let init () = 
    {
      bulletList = [(-10. , -10.)];
      badBulletList = [(-10. , -10.)];
      badShipList = [(-10. , -10.)];
      ship = (300., 500.);
      life = 10;
      score = 0
    }
  (************* Variable de jeu ****************)
  let boolMissil = ref false 
  let shipSize = (30., 30.)
  let alive = ref true
  let spawnPointBad = ref (0.,0.)
  let isPause = ref false 
  let scoreRef = ref 0 
  let lifeRef = ref 10
  let start = ref false
  let window_width = 600. 
  let window_height = 600.
  (************* Definition de text du jeux ****************)
  let textScore = Text.create_text "0" 0. 560. 30 
  let textLife =  Text.create_text "0" 480. 560. 30 
  let textGameOver = Text.create_text "GAME OVER" 130. 200. 60 
  let textPause = Text.create_text "PAUSE" 210. 200. 60
  let textRestart = Text.create_text "Pour recommencer appyer sur 'R'" 130. 500. 30
  let textStart = Text.create_text "Pour commencer ou reprendre le jeu \n appuyer sur 'S' \n\n
 Pour mettre en pause le jeu appuyer sur 'P' \n\n
 Pour revenir dans le temps appuyer sur 'B' " 130. 200. 20
  let texture = Image.create_from_file "ressources/space.png"
  let textureShip = Image.create_from_file "ressources/ship.png"
  let textureBullet = Image.create_from_file "ressources/bullet.png"
  let textureBadShip = Image.create_from_file "ressources/badship.png"
  let textureBadBullet = Image.create_from_file "ressources/badbullet.png"
  let shotBuffer = Audio.SoundBuffer.create_sound_buffer "ressources/shot.wav"
  let shotSound = Audio.Sound.create_from_sound_buffer shotBuffer
  let gameoverBuffer = Audio.SoundBuffer.create_sound_buffer "ressources/game_over.wav"
  let gameoverSound = Audio.Sound.create_from_sound_buffer gameoverBuffer


  (************************ Affichage **************************)   
  let drawBullet fen state = 
    List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBullet x
      y 10. 10. 1.) state.bulletList

  let drawBadBullet fen state = 
    List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBadBullet x
      y 10. 10. 1.) state.badBulletList
      
  let drawBadShip fen state = 
    List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBadShip x
      y 30. 30. 1.) state.badShipList

  (************** Display Mode ******************)
  let displayAlive fen state = 
    Mjwindow.drawImage fen textureShip (fst state.ship) (snd state.ship) 30. 30. 1.;
    drawBullet fen state;
    drawBadBullet fen state;
    drawBadShip fen state; 
    lifeRef := state.life;
    Mjwindow.writeText fen (Text.set_text textLife ("Life : "^(string_of_int state.life))) Color.red ;
    Mjwindow.writeText fen (Text.set_text textScore ("Score : "^(string_of_int !scoreRef))) Color.red 
      
  let displayDead fen state =
    Mjwindow.writeText fen textGameOver Color.red ;
    Mjwindow.writeText fen textRestart Color.red ;
    lifeRef := state.life;
    Mjwindow.writeText fen (Text.set_text textLife ("Life : "^(string_of_int state.life))) Color.red ;
    Mjwindow.writeText fen (Text.set_text textScore ("Score : "^(string_of_int !scoreRef))) Color.red 

  let create_bullet state = 
    let (x, y) = state.ship in
    [(x +. 10., y-.5.)]

  (************** Events  ******************)
  let eventSpace state =
    if Keyboard.is_key_pressed KeyCode.Space && not !boolMissil then (
      Audio.Sound.set_volume shotSound 40.;
      Audio.Sound.play shotSound;
      boolMissil := true;
      create_bullet state;
    ) else if !boolMissil && not (Keyboard.is_key_pressed KeyCode.Space) then(
      boolMissil := false;
      [] (* hack *)
    )else
	[] (* hack *)
	  
  let moveShip  p x y  state =
    let (x1, y1) = state.ship in (* position du ship *)
    let (w, h) = shipSize in (* taille de la texture Ship *)
    match p with
    | 0 when y1 > 0. ->  (x1 +. x, y1 +. y) 
    | 1 when y1 +. h *. 0.5 < window_height -> (x1+.x,y1+.y)
    | 2 when x1 > 0. ->  (x1 +. x, y1 +. y)
    | 3 when x1 +. w *. 0.5 < window_width -> (x1 +. x, y1 +. y)
    | 4 when y1 > 0. && x1 > 0.-> (x1 +. x, y1 +. y)
    | 5 when y1 +. h *. 0.5 < window_height 
	&& x1 +. w *. 0.5 < window_width -> (x1 +. x, y1 +. y)
    | 6 when y1 > 0. && x1 +. w *. 0.5< window_width -> (x1 +. x, y1 +. y)
    | 7 when y1 +. h *. 0.5< window_width && x1 > 0.->  (x1 +. x, y1 +. y)
    | _ -> (x1,y1)
      

  let eventKeyBoard state = 
    if Keyboard.is_key_pressed KeyCode.Up 
      && Keyboard.is_key_pressed KeyCode.Left then 
      moveShip 4 (-1.) (-1.) state
    else if Keyboard.is_key_pressed KeyCode.Up 
	&& Keyboard.is_key_pressed KeyCode.Right then 
      moveShip 6 (1.) (-1.) state
    else if Keyboard.is_key_pressed KeyCode.Down 
	&& Keyboard.is_key_pressed KeyCode.Right then 
      moveShip 5 (1.) (1.) state
    else if Keyboard.is_key_pressed KeyCode.Down
	&& Keyboard.is_key_pressed KeyCode.Left then 
      moveShip 7 (-1.) (1.) state
    else if Keyboard.is_key_pressed KeyCode.Up then
      moveShip 0 (0.) (-1.) state
    else if Keyboard.is_key_pressed KeyCode.Down then 
      moveShip 1 (0.) (1.) state
    else if Keyboard.is_key_pressed KeyCode.Left then
      moveShip 2 (-1.) (0.) state
    else if Keyboard.is_key_pressed KeyCode.Right then
      moveShip 3 (1.) (0.) state 
    else 
      state.ship
  (************* Gestion des Missiles Deja cree ****************)
  let rec deplaceMissil l finalList =
    match l with
    | [] -> finalList
    | (x, y)::z -> deplaceMissil z ((x, y -. 0.5)::finalList)
      
  let rec suprMissil l = 
    match l with 
      [] ->[] 
    | t ::r -> if snd t < 0. then
	suprMissil r 
      else t :: (suprMissil r)
	
  let gestMissil state =
    let  newBulletList = (deplaceMissil state.bulletList []) in
    suprMissil newBulletList
  (************* Gestion des Ennemis  ****************)
  let createBadShip () =
    !spawnPointBad

  let addBadShip () =
    let n = Random.int 100 in
    if n = 3 then
      [createBadShip()]
    else 
      [] (* hack *)
  let getRandomHeight () =
    Random.float window_height

  let getRandomWidth () = 
    Random.float window_width

  let move (x,y) l = 
    match !scoreRef/5 mod 7 with 
    | 0 -> spawnPointBad := (0., getRandomHeight()); (x +. 0.7,y)::l
    | 1 -> spawnPointBad := (0., getRandomHeight()); (x +. 0.7,y +. 0.7)::l
    | 2 -> spawnPointBad := (window_width, getRandomHeight()); 
      (x +. (-0.7),y)::l
    | 3 -> spawnPointBad := (window_width, getRandomHeight());
      (x +. (-0.7), y +.0.7)::l
    | 4 -> spawnPointBad := (getRandomWidth(), window_height);
      (x, y +. (-0.7))::l
    | 5 -> spawnPointBad := (getRandomWidth(), window_height);
      (x +. 0.7, y +. -0.7)::l
    | 6 -> spawnPointBad := (getRandomWidth(), 0.); (x, y +. 0.7)::l
    | 7 -> spawnPointBad := (getRandomWidth(), 0.); (x +. (-0.7),y +. -0.7)::l
    | _ -> l
      
  let rec moveBadShip l finalList =
    match l with 
      [] -> finalList
    | s::z -> moveBadShip z (move s finalList)

  let rec suprBadShip l =
    match l with 
      [] ->[] 
    | t::r -> 
      let (x, y ) = t in 
      if x > window_width || x < 0.
	|| y > window_height || y < 0. then
	suprBadShip r else t :: (suprBadShip r)

  let gestBadShip state =
    let  newBadShipList = (moveBadShip state.badShipList []) in
    suprBadShip newBadShipList

  (***************Gestion des attaques ennemis**************)
  let createBadBullet s= 
    let n = Random.int 100 in 
    if n = 3 then (
      let (x, y) = s in 
      let (w, h) = shipSize in 
      [(x+.10.,y +. h *. 0.5)];
    ) else 
      []
	
  let attack state = 
    let list = ref [] in
    List.iter (fun x -> list := (createBadBullet x) @ !list ) state.badShipList;
    !list

  let rec deplaceBadMissil l finalList =
    match l with
    | [] -> finalList
    | (x, y)::z -> deplaceBadMissil z ((x, y +. 1.)::finalList)

  let rec suprBadMissil l = 
    match l with 
      [] ->[] 
    | t ::r -> if snd t > window_height then
	suprBadMissil r 
      else t :: (suprBadMissil r)
	
  let gestBadMissil state =
    let newBadBulletList = (deplaceBadMissil state.badBulletList []) in
    suprBadMissil newBadBulletList


  (************* Gestion des Collisions ****************)
  let bulletList = ref []
  let badBulletList = ref [] 
  let badShipList = ref []

  let rec traiterCollisionBadBullet s bullets finalBulletList=
    match bullets with 
    |[] -> false;
    | xBullet::yBullet -> 
      let (w, h) = shipSize in 
      if snd xBullet >= snd s
	&& snd xBullet <= snd s +. h
	&& fst xBullet <= fst s +. w
	&& fst xBullet >= fst s then (
	  bulletList := yBullet@finalBulletList;
	  true;
	)
      else
	traiterCollisionBadBullet s yBullet (xBullet::finalBulletList)

  let rec collisionBadVSMissil l =
    match l with
    | [] -> []
    | x::y ->
      if traiterCollisionBadBullet x !bulletList [] then (
	scoreRef:= !scoreRef + 1;
	collisionBadVSMissil y;
      )
      else
	x::collisionBadVSMissil y

  let rec traiterCollisionBullet s bullets =
    match bullets, !lifeRef with 
    | [], _-> []
    | _, 0 -> alive := false; Audio.Sound.play gameoverSound; bullets
    | xBullet::yBullet, _ -> 
      let (w, h) = shipSize in 
      if snd xBullet >= snd s 
	&& snd xBullet <= snd s +. h
	&& fst xBullet <= fst s +. w
	&& fst xBullet >= fst s then (
	  lifeRef := !lifeRef - 1;
	  traiterCollisionBullet s yBullet;
	)
      else
	xBullet::(traiterCollisionBullet s yBullet)

  let gestCollision state =
    bulletList := state.bulletList;
    badShipList := collisionBadVSMissil state.badShipList;
    if !alive then 
      badBulletList := traiterCollisionBullet state.ship state.badBulletList
	
  (************ Définition obligatoire ***************)
  let drawState (fen:Mjwindow.t) state = 
    if !alive then 
      displayAlive fen state
    else
      displayDead fen state

  let onNewFrame fen =   
    Mjwindow.drawImage fen texture 0. 0. 600. 600. 1.;
		if !tree = 1 then
			tree := 0;
    if !head = 0 then (
      if not !start then 
	Mjwindow.writeText fen textStart Color.red ;
      if !isPause then
   	Mjwindow.writeText fen textPause Color.red 
    );
    
    if Keyboard.is_key_pressed KeyCode.P then(
      head := 0;
      isPause := true
    );
    
    if Keyboard.is_key_pressed KeyCode.S then( 
      head := 1;
      start := true;
      isPause := false
    );
    
    if Keyboard.is_key_pressed KeyCode.B then(
      head := 2;
      isPause := false
    );

    if Keyboard.is_key_pressed KeyCode.A then( 
      head := 3;
      start := true;
      isPause := false
    );
    if Keyboard.is_key_pressed KeyCode.R then(
      if not !alive then (
	tree := 1;
	start := true;
	isPause := false;
	alive := true;
	scoreRef := 0
      )
    );
    if Keyboard.is_key_pressed KeyCode.N then(
      head := 4;
      isPause := false
    );

    
    if Keyboard.is_key_pressed KeyCode.Escape then (
      Mjwindow.close fen;
      Audio.Sound.destroy shotSound;
      Audio.Sound.destroy gameoverSound;
    )
	
	
  let tick state = 
    let stateTmp = 
      {
	bulletList = (gestMissil state)@(eventSpace state) ;	
	badBulletList =  (attack state) @ (gestBadMissil state) ;
	badShipList = (gestBadShip state)@(addBadShip()) ;
	ship = eventKeyBoard state;
	life = !lifeRef;
	score = !scoreRef
      }
    in
    gestCollision stateTmp;
    {
      bulletList = !bulletList;     
      badBulletList =  !badBulletList;
      badShipList = !badShipList;
      ship = stateTmp.ship;
      life = !lifeRef;
      score = !scoreRef
    }
      
end 


module StockableShootCaml = TIMELINE(ShootCaml)

let createWindow() = 
  Random.self_init();
  let fen = Mjwindow.create_window 600. 600. "ShootCaml" 100 Color.black  
  in
  fen

let _ = 
  let fen = createWindow() in
  let music = Audio.Music.create_music "ressources/music.wav" true in
  Audio.Music.set_volume music 70.;
  Audio.Music.play music;
  StockableShootCaml.play fen;
  Audio.Music.destroy music;
