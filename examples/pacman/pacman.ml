(*module type GAME = 
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
end*)

module Pacman =
 struct 
  
  type param = int

  type time_bar= {mutable current:int ; max:int}
  
  type content = Empty | Bonus | Food | Pacman | GhostEmpty | GhostFood 

  type type_case = Wall | Case of content

  type case = {
   x:int;
   y:int;
   t:type_case
  }


  type direction = Left | Right | Up | Down

  type state = {
   pac:int;
   ghosts:int list;
   field:case list;
   sizeX:int;
   sizeY:int;
   time:time_bar;
   score:int
  }

  let isInField s c = (c.x>=0)&&(c.y>=0)&&(c.x<=s.sizeX)&&(c.y<=s.sizeY)

  let getCase s x y =
   List.nth s.field (y*s.sizeX +x)

  let getPacmanX s i = (List.nth s.field i).x 
  let getPacmanY s i = (List.nth s.field i).y

  let getCasePacman s = List.nth s.field (s.pac)

  let getIndex s c = c.y*s.sizeX + c.x

  let replace li index1 newElt1 index2 newElt2 =
   let rec replaceAux l i1 n1 i2 n2 nb =
    match l with    
     [] -> []
     | h::q -> if (i1=nb) then n1::(replaceAux q i1 n1 i2 n2 (nb+1)) 
               else if (i2=nb) then n2::q
               else h::(replaceAux q i1 n1 i2 n2 (nb+1)) 

   in match index1<index2 with
       true -> replaceAux li index1 newElt1 index2 newElt2 0
       | false -> replaceAux li index2 newElt2 index1 newElt1 0

  let updateCase s i1 i2 c1 c2 = 
   replace s.field i1 c1 i2 c2
   
  let getCaseFromDirection s c d =
    match d with 
      Up -> getCase s c.x (c.y+1)
     | Down -> getCase s c.x (c.y-1)
     | Right -> getCase s (c.x+1) c.y 
     | Left -> getCase s (c.x-1) c.y

  let isLegalPos s c = 
   match c.t with 
    Wall -> false
    | _ -> isInField s c

  let isLegalMove s c d =
   isLegalPos s (getCaseFromDirection s c d)

  let eatContent s c =
   match c.t with 
    Wall -> ()
    | Case n ->(match n with
                 Bonus -> s.time.current <- s.time.current + 5
                 | _ -> ())

                 
                
  let movePacman s d =
   let c0 = getCasePacman s in
   let c1 = getCaseFromDirection s c0 d in 
   if (isLegalPos s c1) then
    begin
     eatContent s c1;
     {s with field = (updateCase s (getIndex s c0) (getIndex s c1) 
                                   {c0 with t=Case Empty} 
    				   {c1 with t=Case Pacman});
             pac = getIndex s c1
      }
    end
   else s
   
  let moveGhost s g =
   Random.self_init();
   let ld = List.map (fun e-> getCaseFromDirection s g e) [Up;Down;Right;Left]
    in let lf = List.filter (fun e-> isLegalPos s e) ld 
     in let random = Random.int (List.length lf) 
      in let c1 = List.nth lf random
       in match g.t, c1.t with 
           (Case GhostEmpty), Case Empty -> updateCase s (getIndex s g) (getIndex s c1) 
                                   {g with t=Case Empty} 
    				   {c1 with t=Case GhostEmpty}
           | Case GhostFood, Case Empty -> updateCase s (getIndex s g) (getIndex s c1) 
                                   {g with t=Case Food} 
    				   {c1 with t=Case GhostEmpty}
           | Case GhostEmpty, Case Food -> updateCase s (getIndex s g) (getIndex s c1) 
                                   {g with t=Case Empty} 
    				   {c1 with t=Case GhostFood}
           | Case GhostFood, Case Food -> updateCase s (getIndex s g) (getIndex s c1) 
                                   {g with t=Case Food} 
    				   {c1 with t=Case GhostFood}
           
  
   
(*
 let moveAllGhost s = 
   let newG = List.map (fun e -> moveGhost s e) s.ghost in
    *) 

  let isOver s = false

  let tick s = s

  let print_state s = ()

  let compare s1 s2 =
        if s1.score > s2.score then 1
        else if s1.score < s2.score then -1
        else 0

  let changeStateWithEvent s fen = s

  let recordCondition s = false

  let backInTimeCondition s = false

  let drawGhosts fen s = ()

  (* retourne un couple de float*)
  let scale s fen x y = 
   let h = (Mjwindow.getheight fen) and w = (Mjwindow.getwidth fen) in
    let posX = (float_of_int x) *. (float_of_int w) /. (float_of_int s.sizeX)
    and posY = (float_of_int y) *. (float_of_int h) /. (float_of_int s.sizeY) in
     (posX,posY)

  let drawPacman fen s = 
   let c = getCasePacman s in
    let couple = scale s fen c.x c.y in
    Mjwindow.fillCircle fen (fst couple) (snd couple) 10. Color.yellow

  let drawState fen s = 
    drawPacman fen s
              
   let init fen = 
    let field = [ 
	{y=0;x=0;t=Wall};	 {y=0;x=1;t=Wall};	   {y=0;x=2;t=Case Food};  {y=0;x=3; t=Case Food};      {y=0;x=4;t=Case Food}; 
        {y=1;x=0;t=Case Food};   {y=1;x=1;t=Wall};	   {y=1;x=2;t=Case Food};  {y=1;x=3;t=Case Food};       {y=1;x=4;t=Case Food}; 
        {y=2;x=0;t=Case Food};   {y=2;x=1;t=Wall};	   {y=2;x=2;t=Case Food};  {y=2;x=3;t=Case Food};       {y=2;x=4;t=Case Bonus}; 
        {y=3;x=0;t=Wall};        {y=3;x=1;t=Case Pacman};  {y=3;x=2;t=Case Food};  {y=3;x=3;t=Case GhostFood};  {y=3;x=4;t=Case GhostFood}; 
        {y=4;x=0;t=Case Bonus};  {y=4;x=1;t=Case Food};    {y=4;x=2;t=Case Food};  {y=4;x=3;t=Case Food};       {y=4;x=4;t=Case Bonus}
    ] in
      let pac      = 16 
      and ghosts   = [18;19] 
      and sizeX    = 5 
      and sizeY    = 5 
      and time_bar = {current=0;max=50}
      and score    = 0 in
      {
	pac=pac;
	ghosts=ghosts;
	field=field;
	sizeX=sizeX;
	sizeY=sizeY;
	time=time_bar;
	score=score
      }
 end  
