type t = {images : Image.t list;
	  mutable current_ind : int;
	  nbframetochange : int;
	  mutable nbf_c:int}

let make_gif images nbf =
   {images = images; current_ind = 0; nbframetochange=nbf; nbf_c=0}

let getCurrent_image gif = 
   List.nth gif.images gif.current_ind

(*let getPrevious gif = ()*)

let getNext gif =
  gif.nbf_c <- gif.nbf_c + 1;
  gif.current_ind <- ((gif.nbf_c/gif.nbframetochange) mod (List.length gif.images))

let rec parcours liste dir = 
  try 
    let file = (Unix.readdir dir) in 
      print_string file;  print_newline();
    let image = Image.create_from_file file in
      parcours (liste@[image]) dir
  with 
  | _ -> liste
  
let make_gif_fromDirectory directory =
  let dir = Unix.opendir directory in 
    let listeimage = parcours [] dir in 
      make_gif listeimage
