COMMON_DIR=common
COMMON_FILES=$(wildcard $(COMMON_DIR)/*.ml*)

# JS
JS_COMMON_FILES=$(subst $(COMMON_DIR),$(JS_DIR),$(COMMON_FILES))
JS_DIR=js

# SFML
SFML_DIR=sfml
SFML_COMMON_FILES=$(subst $(COMMON_DIR),$(SFML_DIR),$(COMMON_FILES))

all: js sfml

# Copy the common files into the js dir
$(JS_COMMON_FILES): $(JS_DIR)/%: $(COMMON_DIR)/% 
	cp $< $@

js: $(JS_COMMON_FILES)
	$(MAKE) all -C $(JS_DIR)

# Copy the common files into the sfml dir
$(SFML_COMMON_FILES): $(SFML_DIR)/%: $(COMMON_DIR)/% 
	cp $< $@

sfml: $(SFML_COMMON_FILES)
	$(MAKE) all -C $(SFML_DIR)

doc: 
	$(MAKE) doc -C $(COMMON_DIR)

clean:
	$(MAKE) clean -C $(JS_DIR)
	$(MAKE) clean -C $(SFML_DIR)
	$(MAKE) clean -C $(COMMON_DIR)
	-rm -f *~

.PHONY: js
