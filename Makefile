v0.1.0: lsm-version=v0.1.0
v0.1.0: provenance-version=v0.1.0 #user space version number need not to be identical to LSM
v0.1.0: ifc-version=v0.1.0 #user space version number need not to be identical to LSM

v0.1.1: lsm-version=v0.1.1
v0.1.1: provenance-version=v0.1.1 #user space version number need not to be identical to LSM
v0.1.1: ifc-version=v0.1.1 #user space version number need not to be identical to LSM

v0.1.2: lsm-version=v0.1.2
v0.1.2: provenance-version=v0.1.2 #user space version number need not to be identical to LSM
v0.1.2: ifc-version=v0.1.2 #user space version number need not to be identical to LSM
v0.1.2: config-version=v0.1.0 #user space version number need not to be identical to LSM

v0.1.3: lsm-version=v0.1.3
v0.1.3: provenance-version=v0.1.3 #user space version number need not to be identical to LSM
v0.1.3: ifc-version=v0.1.2 #user space version number need not to be identical to LSM
v0.1.3: config-version=v0.1.0 #user space version number need not to be identical to LSM

v0.1.4: lsm-version=v0.1.4
v0.1.4: provenance-version=v0.1.5 #user space version number need not to be identical to LSM
v0.1.4: ifc-version=v0.1.3 #user space version number need not to be identical to LSM
v0.1.4: config-version=v0.1.0 #user space version number need not to be identical to LSM

v0.1.5: lsm-version=v0.1.5
v0.1.5: provenance-version=v0.1.6 #user space version number need not to be identical to LSM
v0.1.5: ifc-version=v0.1.3 #user space version number need not to be identical to LSM
v0.1.5: config-version=v0.1.1 #user space version number need not to be identical to LSM

v0.1.6: lsm-version=v0.1.6
v0.1.6: provenance-version=v0.1.7 #user space version number need not to be identical to LSM
v0.1.6: ifc-version=v0.1.4 #user space version number need not to be identical to LSM
v0.1.6: config-version=v0.1.2 #user space version number need not to be identical to LSM

v0.1.7: lsm-version=v0.1.7
v0.1.7: provenance-version=v0.1.8 #user space version number need not to be identical to LSM
v0.1.7: ifc-version=v0.1.4 #user space version number need not to be identical to LSM
v0.1.7: config-version=v0.1.3 #user space version number need not to be identical to LSM

v0.1.8: lsm-version=v0.1.8
v0.1.8: provenance-version=v0.1.9 #user space version number need not to be identical to LSM
v0.1.8: ifc-version=v0.1.4 #user space version number need not to be identical to LSM
v0.1.8: config-version=v0.1.4 #user space version number need not to be identical to LSM

v0.1.9: lsm-version=v0.1.9
v0.1.9: provenance-version=v0.1.10 #user space version number need not to be identical to LSM
v0.1.9: ifc-version=v0.1.4 #user space version number need not to be identical to LSM
v0.1.9: config-version=v0.1.5 #user space version number need not to be identical to LSM

all: v0.1.9

prepare:
	@echo "Building CamFlow ${lsm-version}, this may take a while and require root password."
	mkdir -p build
	@echo "Downloading provenance library ${provenance-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-provenance-lib.git
	cd ./build/camflow-provenance-lib && git checkout tags/${provenance-version}
	cd ./build/camflow-provenance-lib && $(MAKE) prepare
	@echo "Downloading ifc library ${ifc-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-ifc-lib.git
	cd ./build/camflow-ifc-lib && git checkout tags/${ifc-version}
	cd ./build/camflow-ifc-lib && $(MAKE) prepare
	@echo "Downloading configuration service ${config-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-config.git
	cd ./build/camflow-config && git checkout tags/${config-version}
	cd ./build/camflow-config && $(MAKE) prepare
	@echo "Downloading LSM patches..."
	cd ./build && git clone https://github.com/camflow/camflow-patches.git
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) prepare

config:
	@echo "Starting kernel configuration ..."
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) config

compile:
	@echo "Building kernel ..."
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) compile
	@echo "Building IFC library ..."
	cd ./build/camflow-ifc-lib && $(MAKE) all
	@echo "Building provenance library ..."
	cd ./build/camflow-provenance-lib && $(MAKE) all

install:
	@echo "Installing kernel ..."
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) install
	@echo "Installing IFC library ..."
	cd ./build/camflow-ifc-lib && $(MAKE) install
	@echo "Installing provenance library ..."
	cd ./build/camflow-provenance-lib && $(MAKE) install
	@echo "Building configuration service ..."
	cd ./build/camflow-config && $(MAKE) all
	@echo "Installing configuration service ..."
	cd ./build/camflow-config && $(MAKE) install

old_prepare:
	@echo "Building CamFlow ${lsm-version}, this may take a while and require root password."
	mkdir -p build
	@echo "Downloading provenance library ${provenance-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-provenance-lib.git
	cd ./build/camflow-provenance-lib && git checkout tags/${provenance-version}
	cd ./build/camflow-provenance-lib && $(MAKE) prepare
	@echo "Downloading ifc library ${ifc-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-ifc-lib.git
	cd ./build/camflow-ifc-lib && git checkout tags/${ifc-version}
	cd ./build/camflow-ifc-lib && $(MAKE) prepare
	@echo "Downloading LSM patches..."
	cd ./build && git clone https://github.com/camflow/camflow-patches.git
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) prepare

old_compile:
	@echo "Building kernel ..."
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) compile
	@echo "Building IFC library ..."
	cd ./build/camflow-ifc-lib && $(MAKE) all
	@echo "Building provenance library ..."
	cd ./build/camflow-provenance-lib && $(MAKE) all

old_install:
	@echo "Installing kernel ..."
	cd ./build/camflow-patches/${lsm-version} && $(MAKE) install
	@echo "Installing IFC library ..."
	cd ./build/camflow-ifc-lib && $(MAKE) install
	@echo "Installing provenance library ..."
	cd ./build/camflow-provenance-lib && $(MAKE) install


v0.1.0: old_prepare config old_compile old_install

v0.1.1: old_prepare config old_compile old_install

v0.1.2: prepare config compile install

v0.1.3: prepare config compile install

v0.1.4: prepare config compile install

v0.1.5: prepare config compile install

v0.1.6: prepare config compile install

v0.1.7: prepare config compile install

v0.1.8: prepare config compile install

v0.1.9: prepare config compile install
