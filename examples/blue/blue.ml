open Keyboard
open Mjgraphics

module Blue = struct

type scrolling_image = {content: Image.t; mutable current_sv: float; scroll_value:float}

let make_si im init sv = {content=im; current_sv=init; scroll_value=sv}

let draw_scrolling_image f si sx sy =
    Mjwindow.drawImage 	f 
			si.content 
			(0. -. si.current_sv)
			0.
			sx
			sy
			1.;
    Mjwindow.drawImage 	f 
			si.content 
			(0. -. si.current_sv +. sx)
			0.
			sx
			sy
			1.;
    let new_sv = if si.current_sv > sx 
		 then si.current_sv -. sx
		 else si.current_sv in
    si.current_sv <- new_sv +. si.scroll_value

let drawBlue f blueGif = 
  Mjwindow.drawGif f blueGif 200. 260. 90. 128. 1.

let drawAll fen background perso = 
  draw_scrolling_image fen background 1000. 400.;
  drawBlue fen perso
end

let _ =
  let b1 = Image.create_from_file "rp01.png"
  and b2 = Image.create_from_file "rp02.png"
  and b3 = Image.create_from_file "rp03.png"
  and b4 = Image.create_from_file "rp04.png"
  and b5 = Image.create_from_file "rp05.png"
  and b6 = Image.create_from_file "rp06.png"
  and b7 = Image.create_from_file "rp07.png"
  and b8 = Image.create_from_file "rp08.png"
  and b9 = Image.create_from_file "rp09.png"
  and bg = Image.create_from_file "bg.jpg"
  in
  let gif = Gif.make_gif [b1;b2;b3;b4;b5;b6;b7;b8;b9] 4
  and background = Blue.make_si bg 0. 15.
  in
  let loop fen = Blue.drawAll fen background gif 
  and fen = Mjwindow.create_window 800. 400. "Blue is running" 60 Color.black
  in Mjwindow.display fen loop true
