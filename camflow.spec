Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.14.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.5.1-1
Requires: camflowd = 0.3.1-1
Requires: camflow-cli = 0.2.1-1
Requires: libprovenance = 0.5.3-1
Requires: kernel = 5.11.17-200.camflow.fc33
Requires: kernel-core = 5.11.17-200.camflow.fc33
Requires: kernel-modules = 5.11.17-200.camflow.fc33
Requires: kernel-devel = 5.11.17-200.camflow.fc33
Requires: kernel-headers = 5.11.17-200.camflow.fc33
Requires: kernel-cross-headers = 5.11.17-200.camflow.fc33
Requires: kernel-cross-headers = 5.11.17-200.camflow.fc33
Requires: kernel-modules-extra = 5.11.17-200.camflow.fc33
Requires: kernel-modules-internal = 5.11.17-200.camflow.fc33

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
