open Keyboard

(* utils *)

let iota n = let rec loop acc = function 0 -> acc | n -> loop (n::acc) (n - 1) in loop [] n
let (>>) h f = f h


module SuperMegaAwesomeModule : Timebis.GAME =
struct
  (* Types *)
  type player_state = {spr_idx:int; x:float; y:float; is_shooting:bool; score:int; }
      
  type object_kind = Foe | TimeBonus | Explosion
  type moving_object = { kind:object_kind; x:float; y:float; lifespan:int }

  type state = { pstate:player_state; objs:moving_object list }
  type param

  type time_bar= {mutable current:int ; max:int}
    
  let dummy_player_state = 
    { spr_idx=0
    ; x=50.; y=300. -. 20.
    ; is_shooting=false
    ; score=0
    ; }

  let dummy_state =   
    { pstate=dummy_player_state 
    ; objs=[]
    }

  (* Globals *)
  (*** Statics *)
  let map_upper_bound = 100.
  let map_lower_bound = 400.-.80.

  let player_w  = 68.
  let player_h  = 80.

  let foe_w  = 64.
  let foe_h  = 64.

  (* Lower => faster animations *)
  let refresh_sprite_rate = 10

  (*** Mutables *)
  let nb_ticks = ref 0
  let total_nb_ticks = ref 0

  let timebar = {current=200; max=2000}

  (* 100% => every tick *)
  let bonus_spawn_frequency_percent = ref 0.2
  let foe_spawn_frequency_percent = ref 1.

  (* Sounds *)
  let shot_sound () =
    let sound_buffer = Audio.SoundBuffer.create_sound_buffer "res/hobo_laser.wav" in
      let sound = Audio.Sound.create_from_sound_buffer sound_buffer in
        Audio.Sound.set_volume sound 5.;
        Audio.Sound.play sound

  (* Images *)

  (* orig. size 34 * 40 *)
  let walking_sprites = 
    iota 12
    >> List.map (fun n -> "res/walk"^(string_of_int n)^".png")
    >> List.map Image.create_from_file
    >> Array.of_list
  
  (* orig. size 90x40 *)
  let kame_sprites = 
    iota 17
    >> List.map (fun n -> "res/kame"^(string_of_int n)^".png")
    >> List.map Image.create_from_file
    >> Array.of_list

  let background_img =
    Image.create_from_file "res/scrolling_background.png"
  let background_footer_img =
    Image.create_from_file "res/footer.png"

  let explosion_img =
    iota 25
    >> List.map (fun n -> "res/explosion"^(string_of_int n)^".png")
    >> List.map Image.create_from_file
    >> fun l -> Gif.make_gif l (refresh_sprite_rate / 2)

  (* orig. size 64*64 *)
  let cactuar_img =
    iota 2
    >> List.map (fun n -> "res/cactuar"^(string_of_int n)^".png")
    >> List.map Image.create_from_file
    >> fun l -> Gif.make_gif l (refresh_sprite_rate * 10)
  
  let hourglass_img =
    Image.create_from_file "res/hourglass.png"

  let ressources =
    background_img
    (* :: background_footer_img *)
    :: List.concat
      (List.map Array.to_list 
	 [ walking_sprites
	 ; kame_sprites
	 ])

  let init win =
    Random.self_init();
    Mjwindow.explicit_load win 
      ressources;
    dummy_state

  let change_player_pos state x y = {state with pstate={state.pstate with x=x; y=y}}
	
  let isOver s = s.pstate.score > 99

  let create_moving_object kind lifespan y = 
    (* todo replace par des constantes *)
    { kind=kind; y=y; x=600.-.64.-.30. ; lifespan=lifespan }

  let create_random_moving_object kind lifespan =
    (* y is in [100. ; 400-64] *)
    Random.float (300.-.64.) +. 100.
    >> create_moving_object kind lifespan

  let update_state = function { pstate = p; objs = objs } ->
    (* Check collisions between foes/bonus vs player ... *) 
    (* TODO : make small variations on the hitbox *)
    let p_hit_box = (p.x, p.y +. 10., player_w -. 30., player_h -. 20.) in
    let is_overlapping (x, y, w, h) (x', y', w', h') =
      x < x' +. w' && x +. w > x' && y < y' +. h' && y+.h > y'
    in
    let new_score = ref p.score in
    let objs = List.filter 
      (function 
	| {kind=Explosion; lifespan=l; _} -> l > 0
	| {x=x; y=y; kind=k; _ } -> 
	  if is_overlapping p_hit_box (x, y, foe_w, foe_h) then begin
	    if k = Foe then
	      new_score := 0
	    else if k = TimeBonus then
	      timebar.current <- min timebar.max (timebar.current + 200);
	    (* we got hit! *)
	    (* s'passe quoi donc? *)
	    false
	  end
	  else
	    true
      )
      objs
    in

    (* .. and foes vs player's kamehameha *)    
    let objs = 
      if p.is_shooting && p.spr_idx > 9 then
	let px = p.x +. player_w -. 10. in
	let k_hit_box = (px, p.y, 110., player_h) in
	List.map
	  (function 
	    | {x=x; y=y; kind=Foe } as obj -> 
	      if is_overlapping k_hit_box (x, y, foe_w, foe_h) then begin
		new_score := !new_score + 1;
		{ obj with kind = Explosion; lifespan=100 }
	      end else
		obj
	    | x -> x
	  )
	  objs
      else objs in
    { pstate = {p with score = (!new_score)} ; objs = objs }
	

  (* Clock *)
  let tick = function { pstate = {spr_idx = n ; _} as p; objs = objs} -> 
    (* Update frames *)
    let len = if p.is_shooting 
      then Array.length kame_sprites 
      else Array.length walking_sprites
    in
     
    let new_idx = 
      (if !nb_ticks mod refresh_sprite_rate = 0 then (n + 1) else n)
      mod len
    in

    let new_pstate = 
      if p.is_shooting && new_idx = 0 && !nb_ticks > refresh_sprite_rate 
      then {p with is_shooting=false; spr_idx=new_idx}
      else {p with spr_idx=new_idx }
    in

    incr nb_ticks;
    incr total_nb_ticks;

    (* Move objects *)
    let objs = List.map 
      (function 
	| {kind=Explosion; lifespan=l } as obj -> {obj with lifespan=l-1}
	| {x=x; _ } as obj -> {obj with x = x -. 1.})
      objs
    in
    
    (* Spawn new objects *)
    let objs = 
      if Random.float 100. < !bonus_spawn_frequency_percent then 
	create_random_moving_object TimeBonus (-1) :: objs
      else objs
    in
    let objs = 
      if Random.float 100. < !foe_spawn_frequency_percent then 
	create_random_moving_object Foe (-1) :: objs
      else objs
    in

    (* Check collisions *)
    update_state { pstate = new_pstate; objs = objs }

  (* Display f°s  *)
  let draw_background win =
    let x = - (!total_nb_ticks mod 1800) in
    let x' = x + 1200 in
    if x > -1200 && x < 600 then
      Mjwindow.drawImage win background_img
	(float_of_int x) 0.
	1200. 400.
	1.;
    if x' > -1200 && x' < 600 then
      Mjwindow.drawImage win background_img
	(float_of_int x') 0.
	1200. 400.
	1.;
    Mjwindow.drawImage win background_footer_img
      0. 400.
      600. 200.
      1.

  let draw_timebar_and_score win {score=score; _} =
    let text = Text.create_text (string_of_int score) 170. 437. 20 in
    Mjwindow.writeText win text Color.white;    
    (* Mjwindow.writeText win score_text Color.white; *)
    Mjwindow.strokeRect win 240. 445. 100. 8. Color.white;
    let time_left_percent =
      timebar.current / 20
      >> float_of_int
    in
    Mjwindow.fillRect win 240. 445. time_left_percent 8. Color.white

  let draw_player win pstate =
    if pstate.is_shooting then
      Mjwindow.drawImage win
	kame_sprites.(pstate.spr_idx)
	pstate.x pstate.y
	(* 90. 40. *)
	180. 80.
	1.
    else 
      Mjwindow.drawImage win
      walking_sprites.(pstate.spr_idx)
      pstate.x pstate.y
	(* 34. 40. *)
	68. 80.
	1.

  let draw_object win = function 
    | {kind=Foe; x=x; y=y; _} ->
      Mjwindow.drawGif win cactuar_img x y 64. 64. 1.

    | {kind=Explosion; x=x; y=y; _} ->
      Mjwindow.drawGif win explosion_img x y 64. 64. 1.
	
    | {kind=TimeBonus; x=x; y=y; _} -> 
      Mjwindow.drawImage win hourglass_img x y 64. 64. 1.


  let drawState win = function { pstate = p; objs = objs } ->
    draw_background win;
    draw_timebar_and_score win p;
    draw_player win p;
    List.iter (draw_object win) objs

  let recordCondition _ = true
  let drawGhosts _ _ = () (* Mjwindow.t -> state -> unit *)
  let backInTimeCondition {pstate=p; _} = 
    let f () = 
      if timebar.current > 0 then begin
	timebar.current <- timebar.current - 1; 
	true; 
      end 
      else 
	false
    in
    Keyboard.is_key_pressed KeyCode.B && f ()

  let changeStateWithEvent state win = 
    if Keyboard.is_key_pressed KeyCode.Down
      && state.pstate.y < map_lower_bound 
      && not state.pstate.is_shooting then
      change_player_pos state state.pstate.x (state.pstate.y +. 2.)
    else if Keyboard.is_key_pressed KeyCode.Up 
	&& state.pstate.y > map_upper_bound 
	&& not state.pstate.is_shooting then
      change_player_pos state state.pstate.x (state.pstate.y -. 2.)
    else if Keyboard.is_key_pressed KeyCode.Space 
	&& (not state.pstate.is_shooting) then
      begin
        shot_sound ();
	nb_ticks := 1;
	{state with pstate={state.pstate with is_shooting=true; spr_idx=0}}
      end
    else state
      
  (* J'sais pas trop pourquoi mais ok *)
      
  (* demander à ghiles si ça peut virer des états pourraves *)
  let compare = compare
  let print_state _ = () (* debug *)

end

module Prout = Timebis.TIMELINE(SuperMegaAwesomeModule)

let _ =
  let  music () =
    let m = Audio.Music.create_music "res/hobo_music.wav" true in
    Audio.Music.set_volume m 10.;
    Audio.Music.play m
  and fen = 
    Mjwindow.create_window 
      600. 600. 
      "Pouet" 
      60 Color.white
  in
  music ();
  Prout.play 
    fen	    
    Prout.DrawThenEvent
    1
