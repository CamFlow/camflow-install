kernel-version=5.11.2
lsm-version=0.7.2
lib-version=0.5.3
config-version=0.5.1
cli-version=0.2.1
service-version=0.3.2
package-version=0.14.0
fedora-version=33

prepare_provenance:
	mkdir -p build
	@echo "Downloading provenance library v${lib-version} ..."
	cd ./build && git clone https://github.com/camflow/libprovenance.git
	cd ./build/libprovenance && git checkout tags/v${lib-version}
	cd ./build/libprovenance && git submodule update --init --recursive
	cd ./build/libprovenance && $(MAKE) prepare

prepare_config:
	mkdir -p build
	@echo "Downloading configuration service v${config-version} ..."
	cd ./build && git clone https://github.com/camflow/camconfd.git
	cd ./build/camconfd && git checkout tags/v${config-version}
	cd ./build/camconfd && $(MAKE) prepare

prepare_cli:
	mkdir -p build
	@echo "Downloading command line interface v${cli-version} ..."
	cd ./build && git clone https://github.com/camflow/camflow-cli.git
	cd ./build/camflow-cli && git checkout tags/v${cli-version}
	cd ./build/camflow-cli && $(MAKE) prepare

prepare_service:
	mkdir -p build
	@echo "Downloading service v${service-version} ..."
	cd ./build && git clone https://github.com/camflow/camflowd.git
	cd ./build/camflowd && git checkout tags/v${service-version}
	cd ./build/camflowd && $(MAKE) prepare

prepare_lsm:
	mkdir -p build
	@echo "Downloading LSM patches..."
	cd ./build && git clone https://github.com/camflow/camflow-patches.git
	cd ./build/camflow-patches && git checkout tags/v${lsm-version}
	cd ./build/camflow-patches && $(MAKE) prepare

config:
	@echo "Starting kernel configuration ..."
	cd ./build/camflow-patches && $(MAKE) config

config_cirlce:
	@echo "Starting kernel configuration ..."
	cd ./build/camflow-patches && $(MAKE) config_travis

compile_lsm:
	@echo "Building kernel ..."
	cd ./build/camflow-patches && $(MAKE) compile

compile_provenance:
	@echo "Building provenance library ..."
	cd ./build/libprovenance && $(MAKE) all

install_lsm:
	@echo "Installing kernel ..."
	cd ./build/camflow-patches && $(MAKE) install

install_provenance:
	@echo "Installing provenance library ..."
	cd ./build/libprovenance && $(MAKE) install

install_config:
	@echo "Building configuration service ..."
	cd ./build/camconfd && $(MAKE) all
	@echo "Installing configuration service ..."
	cd ./build/camconfd && $(MAKE) install

install_cli:
	@echo "Building command line interface ..."
	cd ./build/camflow-cli && $(MAKE) all
	@echo "Installing command line interface ..."
	cd ./build/camflow-cli && $(MAKE) install

install_service:
	@echo "Building command line interface ..."
	cd ./build/camflowd && $(MAKE) all
	@echo "Installing command line interface ..."
	cd ./build/camflowd && $(MAKE) install

clean:
	sudo rm -rf ./build

rpm:
	mkdir -p ~/rpmbuild/RPMS
	mkdir -p ~/rpmbuild/SRPMS
	mkdir -p ~/rpmbuild/BUILD
	mkdir -p ~/rpmbuild/SOURCES
	mkdir -p ~/rpmbuild/SPECS
	mkdir -p ~/rpmbuild/tmp
	rpmbuild -bb camflow.spec
	mkdir -p output
	cp ~/rpmbuild/RPMS/x86_64/* ./output

rpm_us:
	mkdir -p ~/rpmbuild/RPMS
	mkdir -p ~/rpmbuild/SRPMS
	mkdir -p ~/rpmbuild/BUILD
	mkdir -p ~/rpmbuild/SOURCES
	mkdir -p ~/rpmbuild/SPECS
	mkdir -p ~/rpmbuild/tmp
	cd ./build/camconfd && $(MAKE) rpm
	cd ./build/camflowd && $(MAKE) rpm
	cd ./build/camflow-cli && $(MAKE) rpm
	cd ./build/libprovenance && $(MAKE) rpm

all_rpm: rpm_us rpm

deb_us:
	cd ./build/camconfd && $(MAKE) deb
	cd ./build/camflowd && $(MAKE) deb
	cd ./build/camflow-cli && $(MAKE) deb
	cd ./build/libprovenance && $(MAKE) deb

publish_rpm:
	cd ./output && package_cloud push camflow/provenance/fedora/${fedora-version} camflow-$(package-version)-1.x86_64.rpm

publish_us:
	cd ./build/camconfd && $(MAKE) publish
	cd ./build/camflowd && $(MAKE) publish
	cd ./build/camflow-cli && $(MAKE) publish
	cd ./build/libprovenance && $(MAKE) publish

publish_all: publish_us publish_rpm

install_rpm:
	curl -1sLf 'https://dl.cloudsmith.io/public/camflow/camflow/cfg/setup/bash.rpm.sh' | sudo -E bash
	sudo dnf -y install camflow
	sudo systemctl enable camconfd.service
	sudo systemctl enable camflowd.service

all: prepare_provenance prepare_config prepare_cli prepare_service prepare_lsm config compile_lsm compile_provenance install_lsm install_provenance install_config install_cli install_service

circle: prepare_provenance prepare_config prepare_cli prepare_service prepare_lsm config_cirlce compile_lsm compile_provenance install_lsm install_provenance install_config install_cli install_service
