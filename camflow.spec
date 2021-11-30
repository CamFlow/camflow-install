Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.15.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.5.2-1
Requires: camflowd = 0.3.3-1
Requires: camflow-cli = 0.2.2-1
Requires: libprovenance = 0.5.4-1
Requires: kernel = 5.15.5-200.camflow.fc35
Requires: kernel-core = 5.15.5-200.camflow.fc35
Requires: kernel-modules = 5.15.5-200.camflow.fc35
Requires: kernel-devel = 5.15.5-200.camflow.fc35
Requires: kernel-headers = 5.15.5-200.camflow.fc35
Requires: kernel-cross-headers = 5.15.5-200.camflow.fc35
Requires: kernel-cross-headers = 5.15.5-200.camflow.fc35
Requires: kernel-modules-extra = 5.15.5-200.camflow.fc35
Requires: kernel-modules-internal = 5.15.5-200.camflow.fc35

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
