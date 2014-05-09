# All directories
TARGETS=*/

all: $(TARGETS)


$(TARGETS):
	$(MAKE) -C $@

clean:
	for i in $(TARGETS); do $(MAKE) -C $$i clean; done
	rm -f *~

.PHONY: $(TARGETS)
