Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.16.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.5.2-1
Requires: camflowd = 0.3.3-1
Requires: camflow-cli = 0.2.2-1
Requires: libprovenance = 0.5.5-1
Requires: kernel = 6.0.5-200.camflow.f36
Requires: kernel-core = 6.0.5-200.camflow.f36
Requires: kernel-modules = 6.0.5-200.camflow.f36
Requires: kernel-devel = 6.0.5-200.camflow.f36
Requires: kernel-headers = 6.0.5-200.camflow.f36
Requires: kernel-cross-headers = 6.0.5-200.camflow.f36
Requires: kernel-cross-headers = 6.0.5-200.camflow.f36
Requires: kernel-modules-extra = 6.0.5-200.camflow.f36
Requires: kernel-modules-internal = 6.0.5-200.camflow.f36

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
