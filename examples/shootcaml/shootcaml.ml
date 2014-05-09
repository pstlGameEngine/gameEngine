open Keyboard
(************* Dimention de la fenetre de jeux ****************)
let window_width = 600. 
let window_height = 600. 

(************* Variable de fonctions ****************)
let boolMissil = ref false 
let life = ref 10 (* max life 10 toujours *)
let alive = ref true 
let start = ref false 
let score = ref 0 
let isPause = ref false 
let spawnPoint = ref (300.,500.)
let spawnPointBad = ref (0.,0.)
let shipSize = (30., 30.)
let bulletList = ref []
let badBulletList = ref [] 
let badShipList = ref [] 

(************* Creation de la fenetre de jeux ****************)
let fen = Mjwindow.create_window window_width window_height "ShootCaml" 60 Color.black 
(************* Definition de text du jeux ****************)
let textScore = Text.create_text "0" 0. 560. 30 
let textLife =  Text.create_text "0" 480. 560. 30 
let textGameOver = Text.create_text "GAME OVER" 130. 200. 60 
let textPause = Text.create_text "PAUSE" 210. 200. 60
let textRestart = Text.create_text "Pour recommencer appyer sur 'R'" 130. 500. 30
let textStart = Text.create_text "Pour commencer appyer sur 'S'" 130. 500. 30
let texture = Image.create_from_file "ressources/space.png"
let textureShip = Image.create_from_file "ressources/ship.png"
let textureBullet = Image.create_from_file "ressources/bullet.png"
let textureBadShip = Image.create_from_file "ressources/badship.png"
let textureBadBullet = Image.create_from_file "ressources/badbullet.png"

let drawTextScoreLife f = 
  Mjwindow.writeText f textScore Color.red ;
  Mjwindow.writeText f textLife Color.red 
    
let moveShip  p x y =
  let (x1, y1) = !spawnPoint in (* position du ship *)
  let (w, h) = shipSize in (* taille de la texture Ship *)
  match p with
  | 0 -> if  y1 > 0. then spawnPoint := (x1 +. x, y1 +. y)
  | 1 -> if  y1 +. h *. 0.5 < window_height then  spawnPoint := (x1+.x,y1+.y)
  | 2 -> if x1 > 0. then spawnPoint := (x1 +. x, y1 +. y)
  | 3 -> if x1 +. w *. 0.5 < window_width then spawnPoint := (x1 +. x, y1 +. y)
  | 4 -> if y1 > 0. && x1 > 0. then spawnPoint := (x1 +. x, y1 +. y)
  | 5 -> if  y1 +. h *. 0.5 < window_height 
      && x1 +. w *. 0.5 < window_width then spawnPoint := (x1 +. x, y1 +. y)
  | 6 -> if y1 > 0. && x1 +. w *. 0.5< window_width then
      spawnPoint := (x1 +. x, y1 +. y)
  | 7 -> if y1 +. h *. 0.5< window_width && x1 > 0. then
      spawnPoint := (x1 +. x, y1 +. y)
  | _ -> () 

let afficheTouche s = 
  Mjwindow.writeText fen (Text.set_text textLife s) Color.red 
    
let create_bullet () = 
  let (x, y) = !spawnPoint in
  let b = (x +. 10., y-.5.) in 
  bulletList := b::!bulletList

let eventKeyBoard () = 
  if Keyboard.is_key_pressed KeyCode.Up 
    && Keyboard.is_key_pressed KeyCode.Left then 
    moveShip 4 (-1.) (-1.)
  else if Keyboard.is_key_pressed KeyCode.Up 
      && Keyboard.is_key_pressed KeyCode.Right then 
    moveShip 6 (1.) (-1.)
  else if Keyboard.is_key_pressed KeyCode.Down 
      && Keyboard.is_key_pressed KeyCode.Right then 
    moveShip 5 (1.) (1.)
  else if Keyboard.is_key_pressed KeyCode.Down
      && Keyboard.is_key_pressed KeyCode.Left then 
    moveShip 7 (-1.) (1.)
  else if Keyboard.is_key_pressed KeyCode.Up then
    moveShip 0 (0.) (-1.)
  else if Keyboard.is_key_pressed KeyCode.Down then 
    moveShip 1 (0.) (1.)
  else if Keyboard.is_key_pressed KeyCode.Left then
    moveShip 2 (-1.) (0.)
  else if Keyboard.is_key_pressed KeyCode.Right then
    moveShip 3 (1.) (0.)
  else if Keyboard.is_key_pressed KeyCode.Escape then 
    Mjwindow.close fen
      
let eventSpace () =
  if Keyboard.is_key_pressed KeyCode.Space && not !boolMissil then (
    create_bullet ();
    boolMissil := true;
  ) else if !boolMissil && not (Keyboard.is_key_pressed KeyCode.Space) then
      boolMissil := false

(**************** Pause Game ***************)
let pauseGame () =
  if !isPause then (
    isPause := false;
  ) else (
    isPause := true;
  )
  
(************* Restart Game ****************)
let restartGame () =
  if not !alive then(
    life := 10; 
    alive := true; 
    score := 0;
    isPause := false;
    badBulletList := [] ;
    badShipList := [];
    bulletList := []; 
    spawnPoint := (300.,500.);
  )     
   
let eventPRS () = 
  if Keyboard.is_key_pressed KeyCode.P then 
    pauseGame()
  else if Keyboard.is_key_pressed KeyCode.R then
    restartGame()
  else if Keyboard.is_key_pressed KeyCode.S then 
    start := true

(************************ Affichage **************************)
let cpt = ref 0 
  
let afficheNewFrame () = 
  Mjwindow.writeText fen (Text.set_text textScore (string_of_int !cpt)) Color.red 
    
let drawBullet () = 
  List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBullet x
    y 10. 10. 1.) !bulletList

let drawBadBullet () = 
   List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBadBullet x
    y 10. 10. 1.) !badBulletList
    
let drawBadShip () = 
   List.iter (fun (x,y) -> Mjwindow.drawImage fen textureBadShip x
    y 30. 30. 1.) !badShipList
     
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
      
let gestMissil () =
  bulletList := deplaceMissil !bulletList []; 
  bulletList := suprMissil !bulletList 

(************* Gestion des Ennemis  ****************)
let createBadShip () =
  badShipList := !spawnPointBad::!badShipList
    
let createBadBullet s = 
  let n = Random.int 200 in 
  if n = 3 then (
    let (x, y) = s in 
    let (w, h) = shipSize in 
    badBulletList:= (x+.10.,y +. h *. 0.5)::!badBulletList;
  )
    
let addBadShip () =
  let n = Random.int 100 in
  if n = 3 then
    createBadShip()

let getRandomHeight () =
  Random.float window_height

let getRandomWidth () = 
  Random.float window_width

let move (x,y) l = 
  match !score/5 mod 7 with 
  | 0 -> spawnPointBad := (0., getRandomHeight()); (x +. 0.3,y)::l
  | 1 -> spawnPointBad := (0., getRandomHeight()); (x +. 0.3,y +. 0.3)::l
  | 2 -> spawnPointBad := (window_width, getRandomHeight()); 
    (x +. (-0.3),y)::l
  | 3 -> spawnPointBad := (window_width, getRandomHeight());
    (x +. (-0.3), y +.0.3)::l
  | 4 -> spawnPointBad := (getRandomWidth(), window_height);
    (x, y +. (-0.3))::l
  | 5 -> spawnPointBad := (getRandomWidth(), window_height);
    (x +. 0.3, y +. -0.3)::l
  | 6 -> spawnPointBad := (getRandomWidth(), 0.); (x, y +. 0.3)::l
  | 7 -> spawnPointBad := (getRandomWidth(), 0.); (x +. (-0.3),y +. -0.3)::l
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

let gestBadShip () =
  addBadShip ();
  badShipList := moveBadShip !badShipList [];
  badShipList := suprBadShip !badShipList

(***************Gestion des attaques ennemis**************)
let rec deplaceBadMissil l finalList =
  match l with
  | [] -> finalList
  | (x, y)::z -> deplaceBadMissil z ((x, y +. 0.5)::finalList)

let rec suprBadMissil l = 
  match l with 
    [] ->[] 
  | t ::r -> if snd t > window_height then
      suprBadMissil r 
    else t :: (suprBadMissil r)
      
let attack () = 
  List.iter (fun x -> createBadBullet x) !badShipList
    
let gestBadMissil () =
  attack();
  badBulletList := deplaceBadMissil !badBulletList []; 
  badBulletList := suprBadMissil !badBulletList
    
(************* Gestion des Collisions ****************)
let rec traiterCollisionBadBullet s bullets finalBulletList=
  match bullets with 
  |[] -> false;
  | xBullet::yBullet -> 
    let (w, h) = shipSize in 
    if snd xBullet >= snd s
      && snd xBullet <= snd s +. h *. 0.5
      && fst xBullet <= fst s +. w *. 0.5
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
      score := !score + 1;
      collisionBadVSMissil y;
    )
    else
      x::collisionBadVSMissil y

let rec traiterCollisionBullet s bullets =
  match bullets, !life with 
  | [], _-> []
  | _, 0 -> alive := false; (*gameOverSound#play; *)bullets
  | xBullet::yBullet, _ -> 
    let (w, h) = shipSize in 
    if snd xBullet >= snd s 
      && snd xBullet <= snd s +. h *. 0.5
      && fst xBullet <= fst s +. w *. 0.5
      && fst xBullet >= fst s then (
	life := !life - 1;
	traiterCollisionBullet s yBullet;
      )
    else
      xBullet::(traiterCollisionBullet s yBullet)

let gestCollision () =
  badShipList := collisionBadVSMissil !badShipList;
  if !alive then 
    badBulletList := traiterCollisionBullet !spawnPoint !badBulletList
      
(************** Display Mode ******************)
let displayAlive () = 
  Mjwindow.drawImage fen textureShip (fst !spawnPoint)
    (snd !spawnPoint) 30. 30. 1.;
  drawBullet();
  drawBadBullet();
  drawBadShip(); 
  Mjwindow.writeText fen (Text.set_text textLife ("Life : "^(string_of_int !life))) Color.red ;
  Mjwindow.writeText fen (Text.set_text textScore ("Score : "^(string_of_int !score))) Color.red ;
  if not !start then
    Mjwindow.writeText fen textStart Color.red ;
  if !isPause then
    Mjwindow.writeText fen textPause Color.red 
      
let displayDead () =
  Mjwindow.writeText fen textGameOver Color.red ;
  Mjwindow.writeText fen textRestart Color.red ;
  Mjwindow.writeText fen (Text.set_text textLife ("Life : "^(string_of_int !life))) Color.red ;
  Mjwindow.writeText fen (Text.set_text textScore ("Score : "^(string_of_int !score))) Color.red 

(************** Gestion Update tour ***************)
let update () =
  if not !isPause && !start then(
    eventKeyBoard();
    eventSpace();
    gestMissil ();
    gestBadShip ();
    gestBadMissil ();
    gestCollision ();
  )
    
let _ =
  let newFrame f =
    cpt := !cpt + 1;
    eventPRS();
    update();
    Mjwindow.drawImage f texture 0. 0. 600. 600. 1.;
    if !alive then(
      update () ;
      displayAlive ();
    ) 
    else (
      displayDead();
    )
  in
  Random.self_init();
  Mjwindow.display fen newFrame true
(*true pour dire qu'on efface entre chaque frame, false le cas contraire*)
