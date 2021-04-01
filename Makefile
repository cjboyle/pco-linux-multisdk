
CAM_TYPES = clhs me4 usb_pl

.PHONY: all $(CAM_TYPES) bin lib service clean
all: bin lib

$(CAM_TYPES):
	$(MAKE) -C pco_$@_camera/pco_$@ libpcocam

bin: FORCE
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_mgr bin/pco_clhs_mgr
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_svc bin/pco_clhs_svc
	ln -sf $(shell pwd)/pco_clhs_camera/pco_clhs/bin/pco_clhs_info bin/pco_clhs_info

lib: $(CAM_TYPES) FORCE
	@find $(shell pwd)/pco_me4_camera/ -name "*.so" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_usb_pl_camera/ -name "*.so" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_clhs_camera/ -name "*.so" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_me4_camera/ -name "*.a" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_usb_pl_camera/ -name "*.a" -exec ln -sf {} lib/ \;
	@find $(shell pwd)/pco_clhs_camera/ -name "*.a" -exec ln -sf {} lib/ \;

clean: FORCE
	@find . -type l -exec rm {} \;
	@find . -name "*.o" -exec rm {} \;

install: install-bin install-lib install-service install-env FORCE

install-bin: bin FORCE
	@find $(shell pwd)/bin/ -exec ln -sf {} /usr/local/bin \;

install-lib: lib FORCE
	@find $(shell pwd)/lib/ -exec ln -sf {} /usr/local/lib \;

install-service: pcoclhs.service FORCE
	install -m 644 $< /etc/systemd/system

install-env: setup-pco-env.sh
	install -m 644 $< /etc/profile.d
ifeq (${SISODIR5}x,x)
else
	install -m 644 "${SISODIR5}/setup-siso-env.sh" /etc/profile.d
endif

FORCE: