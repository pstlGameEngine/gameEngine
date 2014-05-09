let nb_frame = ref 0
let posy = ref 340.
let sizeX = ref 15.
let sizeY = ref 40.
let alpha = ref 0.1

let image1 = Image.create_from_file "test4.jpg"
let z1 = Image.create_from_file "z1.png"
let z2 = Image.create_from_file "z2.png"
let t = Text.create_text 
	  "test du canal alpha, de la position et de la taille d'une image" 
          20.    		(* coordonée x du texte *)
          20.  			(* coordonée y du texte *)
	  20    		(* taille du texte *)    
          

let newSizes () = 
  sizeX := !sizeX +. (float_of_int (!nb_frame)) /. 60.;
  sizeY := !sizeY +. (float_of_int (!nb_frame)) /. 30.;
  posy := !posy +. (float_of_int (!nb_frame)) /. 30.;
  alpha := min 0.8 (!alpha+.0.01)

let _ = 
  let newFrame f = 
    Mjwindow.drawImage f 	(* fenetre Mjwindow.t *)
		       image1   (* image de type Image.t *)
                       0. 	(* coordonée x de l'image *)
                       (-80.)	(* coordonée y de l'image *)
				(*Le point formé par ces 2 coordonnées est
				  le point haut gauche de l'image*)
                       900.	(* longueur *)
                       750.	(* hauteur *)
                       1.;	(* opacité *)
    Mjwindow.writeText f t (Color.rgb 90 0 0);
    if (!nb_frame mod 2) = 0 then
      Mjwindow.drawImage f z1 400. !posy !sizeX !sizeY !alpha
    else
      Mjwindow.drawImage f z2 400. !posy !sizeX !sizeY !alpha;
      newSizes ();
      nb_frame := !nb_frame + 1;
    if Mjwindow.Mouse.is_button_pressed Mjwindow.MouseButton.LeftButton then 
    Mjwindow.close f

  and fen = Mjwindow.create_window 900. 650. "zombie is comming" 25 Color.black in
  Mjwindow.explicit_load fen [image1;z1;z2];
  Mjwindow.display fen newFrame true
