CC=ocamlc
OCAMLDOC=ocamldoc
DOC_DIR=../../doc
DOCFLAGS=-html -d $(DOC_DIR) -I .
SRC=audio.mli color.mli image.mli gif.mli keyboard.mli text.mli mjwindow.mli mjmenu.mli timebis.ml time.ml

err:
	@echo You might be doing something wrong.

doc: $(SRC)
	ocamlc -c $^
	$(OCAMLDOC) $(DOCFLAGS) $^

clean:
	rm -f *.cm* *~
