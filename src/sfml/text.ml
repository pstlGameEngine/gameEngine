type t = {content:string; posx:float; posy:float; size:int}

let create_text chaine x y s = 
  {content=chaine;
  posx=x;
  posy=y;
  size=s}

let get_content t = 
  t.content

let get_size t =
  t.size

let get_posx t =
  t.posx

let get_posy t =
  t.posy

let set_text t s = 
{t with content = s}
