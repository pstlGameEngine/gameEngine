CC=ocamlc
OCAMLDOC=ocamldoc
DOC_DIR=../../doc
DOCFLAGS=-html -d $(DOC_DIR) -I .
SRC= audio.mli image.mli gif.mli keyboard.mli mouse.mli text.mli mjwindow.mli mjmenu.mli mjmenu.ml timebis.ml time.ml mjcolor.ml mjgraphics.ml

err:
	@echo You might be doing something wrong.

doc: $(SRC)
	ocamlc -c $^
	$(OCAMLDOC) $(DOCFLAGS) $^

clean:
	rm -f *.cm* *~
