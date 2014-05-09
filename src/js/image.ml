type t = {image : string}

let create_from_file fic = {image = fic}

let get_filename file = file.image
