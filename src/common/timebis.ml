open Keyboard

module type GAME = 
  sig
    type state
    type param
    val init : Mjwindow.t -> state
    val isOver : state -> bool
    val tick : state -> state
    val print_state : state -> unit  (* for debugging purpose *)
    val changeStateWithEvent : state -> Mjwindow.t -> state
    val compare : state -> state -> int
    val recordCondition : state -> bool
    val backInTimeCondition : state -> bool
    val drawState : Mjwindow.t -> state -> unit
    val drawGhosts : Mjwindow.t -> state -> unit
end

module TIMELINE = functor (G:GAME) ->
  struct
 
    type tosave = G.state

    type order = EventThenDraw | DrawThenEvent

    type tree = Nil | Cell of node
    and node = {
      content : tosave;
      mutable father : tree;
      mutable sons : tree list		
    }

    type timeDirection = Forward | Backward

    exception HasNoPrevious of tree
    exception HasNoContent of tree

    let getContent t =
      match t with
      | Cell c -> c.content
      | _      -> raise (HasNoContent t)

    let compare n1 n2 =
      try 
	let c1 = (getContent n1) in
	  try let c2 = (getContent n2) in
	    G.compare c1 c2
          with
	  | HasNoContent n -> 1
      with 
      | HasNoContent n -> -1

    let rec truncate_sorted_list liste nb =
      if List.length liste > nb then begin
        match liste with 
        | [] -> []
        | h::t -> truncate_sorted_list t nb
      end else
        liste

    let sort_and_truncate liste nb =
      let sorted = List.sort compare liste in
        truncate_sorted_list sorted nb
        
    let addState tree s maxBranch =
      let n = {content = s; father = tree; sons = []} in
        let res = Cell n in
        match tree with
        | Nil    -> res
        | Cell c -> c.sons <- (sort_and_truncate (res :: c.sons) maxBranch);
	            res


    let beginRecord maxBranch fen =
      Nil
      (*addState Nil (G.init fen) maxBranch*)

    let getContent t =
      match t with
      | Cell c -> c.content
      | _      -> raise (HasNoContent t)

    let getSons t = 
      match t with
      | Nil    -> [] 
      | Cell c -> c.sons

    let getBrothers t = 
      match t with 
      | Cell c -> (match c.father with
      		  | Cell f -> f.sons
                  | Nil -> [])
      | _ -> []

    let previous_state t =
      match t with 
      | Cell c -> (match c.father with
      		  | Cell f -> c.father
                  | Nil -> t)
      | _ -> t

    let rec previous_n_state t n =
      if n = 1 then previous_state t
      else previous_n_state (previous_state t) (n-1)

    let drawNode f node = 
      try 
        G.drawState f (getContent node)
      with 
        | _ -> ()

    let drawGhost f node = 
      try 
        (G.drawGhosts f (getContent node))
      with 
        | _ -> ()

    let rec print_tree t = 
      match t with
      | Cell c -> print_newline ();
		  print_newline ();
		  G.print_state (getContent t);
		  List.iter (fun e -> print_tree e) c.sons
      | _      -> print_string "fin"; print_newline ()


    (* renvoi le couple composé d'un etat de jeu (obtenu à partir d'un etat de
    ** jeu initial et des evenement survenus durant le temps) et d'un entier
    ** représentant la direction du temps: 1 pour futur et 0 pour passe *)
    let makeStateFromEvent window state history = 
        if Keyboard.is_key_pressed KeyCode.Escape then
          begin
 	    Mjwindow.close window;
            (state,Forward) (* meme etat *)
	  end
	else if (G.backInTimeCondition state) then (*on renvoi l'etat précedent*)
          ((getContent (previous_state history)),Backward)
        else ((G.changeStateWithEvent state window),Forward)

    (* Si on avance dans le temps, on apelle la fonction tick du jeu,
    ** sinon, on retourne l'etat précedent *)
    let event_loop window state history =
      let ns = makeStateFromEvent window state history in
        match snd ns with 
      	| Forward -> (G.tick (fst ns),Forward)
	| _ -> ((getContent ( previous_state history )),Backward)

    (* retourne le triplet:
	 etat de jeu à dessiner,
	 arbre de temps associé,
	 fantomes de même hauteur*)
    let gameEvent window state history ghosts maxBranch =
      let couple = (event_loop window state history) in
	  match (snd couple) with
	  | Forward -> 
	      if (G.recordCondition (fst couple)) then
                let newH = addState history (fst couple) maxBranch
		and newG = (List.concat (List.map (fun e -> getSons e) ghosts))
		in (fst couple, newH, newG)
              else
	        ((fst couple),history,ghosts)
	  | _ -> (getContent (previous_state history),
		  (previous_state history),
		  (getBrothers history))

    let gameDrawing fen ghosts current_node =
      List.iter (fun e -> drawGhost fen e) ghosts;
      G.drawState fen current_node

    let gameLoop fen (current, history, order, ghosts, maxBranch) = 
      match order with 
      | DrawThenEvent -> 
 	  gameDrawing fen ghosts current;
	  let toDraw_newH_newG = gameEvent fen current history ghosts maxBranch in
	    (match toDraw_newH_newG with
	    | (a,b,c) -> 
               (a,b,order,c,maxBranch))
      | EventThenDraw -> 
	  let toDraw_newH_newG = gameEvent fen current history ghosts maxBranch in
	    (match toDraw_newH_newG with
	    | (a,b,c) -> gameDrawing fen ghosts current;
            		 (a,b,order,c,maxBranch))

    let play fen order maxBranch =
      let racine = (beginRecord maxBranch fen) in
      Mjwindow.display_tm fen
			  gameLoop 
			  ((G.init fen),racine,order,[],maxBranch)
			  true
end
