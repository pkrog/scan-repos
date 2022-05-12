ifeq ($(PREFIX),)
PREFIX=$(HOME)/.local/bin
endif
SCANREPOS=scan-repos
INSTALLED_SCANREPOS=$(shell command -v $(SCANREPOS))
ifneq ($(INSTALLED_SCANREPOS),)
CURRENT_VERSION=$(shell ./$(SCANREPOS) -v)
VERSION_INSTALLED=$(shell $(INSTALLED_SCANREPOS) -v)
SAME_VERSION_NUMBER=$(shell [ $(CURRENT_VERSION) = $(VERSION_INSTALLED) ] && echo TRUE)
DIFF_CONTAINTS=$(if $(SAME_VERSION_NUMBER),$(shell diff -q "$(SCANREPOS)" "$(INSTALLED_SCANREPOS)"))
endif

all:

install: $(PREFIX)
	$(if $(DIFF_CONTAINTS),$(error "Scan-repos is already installed with the same version number ($(VERSION_INSTALLED)), but containts are different. Consider increasing the version number before installing."))
	$(if $(SAME_VERSION_NUMBER),$(info The exact same version of $(SCANREPOS) is already installed.))
	$(if $(SAME_VERSION_NUMBER),,$(if $(INSTALLED_SCANREPOS),$(info Replacing currently installed version $(VERSION_INSTALLED) by version $(CURRENT_VERSION).)))
	$(if $(SAME_VERSION_NUMBER),,install scan-repos "$(PREFIX)")

uninstall:
ifneq ($(INSTALLED_SCANREPOS),)
	$(RM) $(INSTALLED_SCANREPOS)
else
	@echo "Scan-repos is not installed."
endif

$(PREFIX):
	mkdir -p "$@"

test:
	$(MAKE) -C $@

clean:
	$(MAKE) -C test $@

.PHONY: all install uninstall test clean
