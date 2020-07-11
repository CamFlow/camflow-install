Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.10.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.5.0
Requires: camflowd = 0.3.0
Requires: camflow-cli = 0.2.0
Requires: kernel = 5.7.8-201.camflow.fc32
Requires: kernel-core = 5.7.8-201.camflow.fc32
Requires: kernel-modules = 5.7.8-201.camflow.fc32
Requires: kernel-devel = 5.7.8-201.camflow.fc32
Requires: kernel-headers = 5.7.8-201.camflow.fc32
Requires: libprovenance = 0.5.0

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
