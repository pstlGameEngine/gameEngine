SRC_DIR=src
LIB_DIR=lib
DOC_DIR=doc
EX_DIR=examples

all: libs examples

libs: 
	@echo [Building the libraries]
	$(MAKE) all -C $(SRC_DIR)
	mkdir -p $(LIB_DIR)/js
	mkdir -p $(LIB_DIR)/sfml
	cp $(SRC_DIR)/js/*.cm* $(LIB_DIR)/js/
	cp $(SRC_DIR)/js/*.js $(LIB_DIR)/js/
	cp $(SRC_DIR)/sfml/*.cm* $(LIB_DIR)/sfml/
	cp $(SRC_DIR)/sfml/*.o $(LIB_DIR)/sfml/
	cp $(SRC_DIR)/sfml/*.a $(LIB_DIR)/sfml/

doc:
	@echo [Building the documentation]
	mkdir -p $(DOC_DIR)
	$(MAKE) doc -C $(SRC_DIR)

clean:
	@echo [Cleaning everything]
	$(MAKE) clean -C $(SRC_DIR)
	$(MAKE) clean -C $(EX_DIR)
	rm -rf $(LIB_DIR) $(DOC_DIR)
	rm -rf *~

examples: libs
	@echo [Building examples]
	$(MAKE) -C $(EX_DIR)

.PHONY: doc examples libs
