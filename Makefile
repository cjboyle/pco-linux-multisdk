
CAM_TYPES = clhs me4 usb_pl

.PHONY: all $(CAM_TYPES) bin lib clean install install-*
all: bin lib

$(CAM_TYPES):
	$(MAKE) -C pco_$@_camera/pco_$@ libpcocam
	@chmod -R 755 pco_$@_camera/*

bin: FORCE
	@mkdir -m 755 -p bin
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_mgr bin/pco_clhs_mgr
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_svc bin/pco_clhs_svc
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_info bin/pco_clhs_info

lib: $(CAM_TYPES) FORCE
	@mkdir -m 755 -p lib
	@find $(shell pwd)/pco_me4_camera/ -name "*.so*" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_usb_pl_camera/ -name "*.so*" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_clhs_camera/ -name "*.so*" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_me4_camera/ -name "*.a" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_usb_pl_camera/ -name "*.a" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_clhs_camera/ -name "*.a" -exec ln -sf {} lib/ \;

clean: FORCE
	@find . -type l -exec rm {} \;
	@find . -name "*.o" -exec rm {} \;

install: install-bin install-lib install-service install-env FORCE

install-bin: bin FORCE
	@find $(shell pwd)/bin/* -exec ln -sf {} /usr/local/bin \;

install-lib: lib FORCE
	@find $(shell pwd)/lib/* -exec ln -sf {} /usr/local/lib \;

install-service: FORCE
	install -m 644 pcoclhs.service /etc/systemd/system
	install -m 644 -T pcoclhs.service.sudoers /etc/sudoers.d/BMIT_grp

install-env: setup-pco-env.sh
	install -m 644 $< /etc/profile.d
ifeq (${SISODIR5}x,x)
else
	install -m 644 "${SISODIR5}/setup-siso-env.sh" /etc/profile.d
endif

FORCE:
