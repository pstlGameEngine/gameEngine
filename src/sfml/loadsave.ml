type memory = (string, 'a) list

let init_memory () = []

let volubile_save memory str state =
  (str,state)::memory

(* sfml: a file in the repository
   js: cookie or download link *)
let persistant_save str state =
  Mjsystem.save str state

let load_from_file str = 
  Mjsystem.load str

let load memory str =
  List.assoc str memory
