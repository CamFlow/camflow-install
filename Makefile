v0.1.0: lsm-version=v0.1.0
v0.1.0: audit-version=v0.1.0 #user space version number not need to be identical to LSM
v0.1.0: ifc-version=v0.1.0 #user space version number not need to be identical to LSM

all: v0.1.0

prepare:
	@echo "Building CamFlow ${lsm-version}, this may take a while and require root password."
	mkdir -p build
	@echo "Downloading audit library ${audit-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-audit-lib.git
	cd ./build/camflow-audit-lib && git checkout tags/${audit-version}
	cd ./build/camflow-audit-lib && $(MAKE) prepare
	@echo "Downloading ifc library ${ifc-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-ifc-lib.git
	cd ./build/camflow-ifc-lib && git checkout tags/${ifc-version}
	cd ./build/camflow-ifc-lib && $(MAKE) prepare
	@echo "Downloading LSM patches..."
	cd ./build && git clone https://github.com/camflow/camflow-patches.git
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) prepare

config:
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) config

compile:
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) compile
	cd ./build/camflow-ifc-lib && $(MAKE) all
	cd ./build/camflow-audit-lib && $(MAKE) all

install:
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) install
	cd ./build/camflow-ifc-lib && $(MAKE) install
	cd ./build/camflow-audit-lib && $(MAKE) install


v0.1.0: prepare config compile install
