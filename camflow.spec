Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.9.6
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.6
Requires: camflowd = 0.2.6
Requires: camflow-cli = 0.1.15
Requires: kernel = 5.5.11camflow0.6.5
Requires: kernel-headers = 5.5.11camflow0.6.5
Requires: kernel-devel = 5.5.11camflow0.6.5
Requires: libprovenance = 0.4.11

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
