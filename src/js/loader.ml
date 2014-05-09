open Dom_html

type ressource = Im of imageElement Js.t

type cache = (string, ressource) Hashtbl.t

let initCache size = Hashtbl.create size

let addToCache c path ress = Hashtbl.add c path ress

let find c path = Hashtbl.find c path
