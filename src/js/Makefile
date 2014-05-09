CC=ocamlfind ocamlc
CFLAGS=-package 'unix','js_of_ocaml','js_of_ocaml.syntax' -syntax camlp4o
LINKER=-linkall
SRC=$(wildcard *.ml)
OBJ=$(SRC:.ml=.cmo)
CAMLDEP=ocamlfind ocamldep
TEMP_FILES=time.ml timebis.ml gif.ml

TARGET=libjs

all: .depend $(TARGET).cma

# We need to order the dependencies to link correctly
$(TARGET).cma: audio.cmo color.cmo image.cmo gif.cmo keyboard.cmo loader.cmo text.cmo mjwindow.cmo mjmenu.cmo timebis.cmo time.cmo
	$(CC) $(LINKER) -a -o $@ $^

%.cmi: %.mli
	$(CC) $(CFLAGS) -c $<

%.cmo: %.ml
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f .depend
	-rm -f $(OBJ) $(TARGET).cma
	-rm -f *.mli
	-rm -f *~
	-rm -f *.cmi
	-rm -f $(TEMP_FILES)

.depend:
	$(CAMLDEP) $(CFLAGS) *.ml *.mli > .depend

-include .depend
