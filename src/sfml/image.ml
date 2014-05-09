type t = {filename:string}

let create_from_file fic = 
  {filename = fic}

let get_filename fic = fic.filename
