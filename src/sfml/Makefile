CC=ocamlfind ocamlc
CCOPT=ocamlfind opt
CFLAGS=-package 'ocsfml'
LINKER=-linkall
SRC=$(wildcard *.ml)
OBJ=$(SRC:.ml=.cmo)

CAMLDEP=ocamlfind ocamldep
TEMP_FILES=time.ml timebis.ml gif.ml

TARGET=libsfml

all: .depend $(TARGET).cma $(TARGET).cmxa

# We need to order the dependencies to link correctly
$(TARGET).cma: audio.cmo color.cmo image.cmo gif.cmo keyboard.cmo loader.cmo text.cmo mjwindow.cmo mjmenu.cmo timebis.cmo time.cmo
	$(CC) $(LINKER) -a -o $@ $^

$(TARGET).cmxa $(TARGET).a: audio.cmx color.cmx image.cmx gif.cmx keyboard.cmx loader.cmx text.cmx mjwindow.cmx mjmenu.cmx timebis.cmx time.cmx
	$(CCOPT) $(LINKER) -a -o $@ $^

%.cmxi: %.mli
	$(CCOPT) $(CFLAGS) -c $<

%.cmx: %.ml
	$(CCOPT) $(CFLAGS) -c $<


%.cmi: %.mli
	$(CC) $(CFLAGS) -c $<

%.cmo: %.ml
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f .depend
	-rm -f $(OBJ) $(TARGET).cma $(TARGET).cmxa 
	-rm -f *.mli
	-rm -f *~
	-rm -f *.cmi *.cmx *.o *.a
	-rm -f $(TEMP_FILES)

.depend:
	$(CAMLDEP) $(CFLAGS) *.ml *.mli > .depend

-include .depend
