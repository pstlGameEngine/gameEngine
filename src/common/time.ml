(** Manage the time ! *)
open Keyboard

module type GAME = 
sig
  (** etat de la partie a sauvgarder *)
  type state
  
  (** Les dessin a faire a chaque frame du state*)
  val drawState : Mjwindow.t -> state -> unit
    
  (** initialisation de state + init du game ? *)
  val init : unit -> state
    
  (** Modification a faire pour chaque tick ( Invariant ) *)
  val tick : state -> state
    
  (** Fonction qui va etre appeler a chaque frame + les dessins a faire*)
  val onNewFrame : Mjwindow.t  -> unit
    
  (** Direction de la tete de lecture 
      0  = pause (not implemented)  
      1 = play 
      2 = back in the time 
      3 = play and draw all state in the same relative time 
      4 = back in the time and draw all state in the same relative time *)
  val head : int ref
    
  (** Manipulation du tree
      0 = Do nothing
      1 = efface tout le tree
      2 = cut les father du tree
      3 = cut les fils du currentNode
      4 = cut les fils du currentNode et tous les node du meme niveau 
			5 = jump to the tree root*)
  val tree : int ref
end

module TIMELINE = functor (G:GAME) ->
struct
  
  type tosave = G.state

  type tree = Nil | Cell of node
  and node = {
    content : tosave;
    mutable father : tree;
    mutable sons : tree list		
  } 

  exception HasNoPrevious of tree
  exception HasNoContent of tree

  let addState tree s =
    let n = {content = s; father = tree; sons = []} in
    let res = Cell n in
    match tree with
    | Nil    -> res
    | Cell c -> c.sons <- (res :: c.sons);
      res

  let beginRecord() =
    addState Nil (G.init())
      
  let racine = (ref (beginRecord()))
    
  let getContent t =
    match t with
    | Cell c -> c.content
    | _      -> raise (HasNoContent t)

  let getSons t = 
    match t with
    | Nil    -> [] 
    | Cell c -> c.sons

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
    G.drawState f (getContent node)

  (** print la hauteur et le contenu de l'arbre appeller la fonction avec h = 0 *)
  let rec print_tree t h= 
    if h = 0 then(
		(*print_newline ();
		  print_string "Nouvelle Arbre"; *)
    );
    match t with
    | Cell c -> (*print_newline ();
		  print_string "Hauteur : "; 
		  print_int h;
		  print_string " , Etat state : ";
		  G.print_state (getContent t); *)
      List.iter (fun e -> print_tree e (h+1)) c.sons
    | Nil -> (* print_string "Fin : " *)()

      
  (** Ajoute et renvois le prochaine état dans l'arbre*)
  let nextState currentNode=
    addState currentNode (G.tick (getContent currentNode))

  (** Dessine et augmenta la hauteur des noeuds *)
  let rec majDrawList l fen =
    let list = ref [] in
    List.iter (fun n -> (*print_string " draw tout ";
			  print_newline (); *)
      drawNode fen n; 
      list := (getSons n)@(!list)) l;
    !list
      
  (** Augmente la hauteur des neouds *)
  let  majNextList l=
    let list = ref [] in
    List.iter (fun n -> (*print_string " avance ";
			  print_newline (); *)
      list := (getSons n)@(!list) ) l;
    !list
      
  (** Diminue la hauteur des noeuds *)
  let rec majPrevList l fen currentNode=
    let list = ref [] in
    List.iter (fun n -> (*print_string " recule ";
			  print_newline ();*)
      if not ( n == currentNode) then
	list := (previous_state n)::!list) l;
    !list		
      
  (** Diminue la hauteur des noeuds en les dessinants*)
  let rec majDrawPrevList l fen currentNode=
    let list = ref [] in
    List.iter (fun n -> (*print_string " recule ";
			  print_newline ();*)
      if not ( n == currentNode) then(
	drawNode fen n; 
	list := (previous_state n)::!list)) l;
    !list											
      
  (** Dessine tout les noeuds , augmente leurs hauteur et cree un nouveau noeud *)
  let drawAllNode currentNode fen nodesLevel =
    drawNode fen currentNode;
    (nextState currentNode,(majDrawList nodesLevel fen)@(getSons currentNode))
      
  (** Fonction executé a chaque frame nodeLevel = node au meme hauteur que current *) 
  let onNewF fen (currentNode,nodeLevel) =
    let currentNode1 = ref currentNode in
    let nodeLevel1 = ref nodeLevel in
    
		(* On fais les modifs necessaire sur la structure *)
    if !G.tree = 0 then (
      ()
    ) else if !G.tree = 1 then (
      currentNode1 := beginRecord();
			racine := !currentNode1
    ) else if !G.tree = 2 then (
      nodeLevel1 := [];
      match currentNode with 
      |Cell c -> c.father  <- Nil ; currentNode1 := currentNode ;racine := !currentNode1
      |Nil -> currentNode1 := currentNode ;racine := !currentNode1;
    ) else if !G.tree = 3 then (
       match currentNode with 
       |Cell c -> c.sons  <- [] ; currentNode1 := currentNode 
       |Nil -> currentNode1 := currentNode 
    ) else if !G.tree = 4 then (
      nodeLevel1 := [];
      List.iter (fun x -> match x with 
      |Cell c -> c.sons  <- [] ; nodeLevel1 := x::!nodeLevel1
      |Nil -> nodeLevel1 := x::!nodeLevel1) nodeLevel;
      match currentNode with 
      |Cell c -> c.sons  <- [] ; currentNode1 := currentNode 
      |Nil -> currentNode1 := currentNode 
    )else if !G.tree = 5 then (
			nodeLevel1 := [];
			currentNode1 := !racine 
		);
    
    
    G.onNewFrame fen;
    match !G.head with
    | 0 -> (!currentNode1,!nodeLevel1)
    | 1 -> drawNode fen !currentNode1;
      ((nextState !currentNode1),(majNextList !nodeLevel1)@(getSons !currentNode1))
    | 2 -> drawNode fen !currentNode1;
      (previous_state !currentNode1,majPrevList !nodeLevel1 fen !currentNode1)
    | 3 -> drawAllNode !currentNode1 fen !nodeLevel1
    | _ -> drawNode fen !currentNode1;
      (previous_state !currentNode1,majDrawPrevList !nodeLevel1 fen !currentNode1)

	
  let play (fen:Mjwindow.t)  =
		racine := beginRecord();
    Mjwindow.display_tm fen onNewF (!racine,[]) true;
    
end
