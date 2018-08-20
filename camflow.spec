Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.7.5
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.1
Requires: camflowd = 0.2.1
Requires: camflow-cli = 0.1.9
Requires: kernel = 4.17.17camflow0.4.4
Requires: kernel-headers = 4.17.17camflow0.4.4
Requires: kernel-devel = 4.17.17camflow0.4.4
Requires: libprovenance = 0.4.2

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
