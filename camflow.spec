Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.4.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.3.4
Requires: camflowd = 0.1.7
Requires: camflow-cli = 0.1.6
Requires: kernel = 4.13.4camflow0.3.7
Requires: kernel-headers = 4.13.4camflow0.3.7
Requires: kernel-devel = 4.13.4camflow0.3.7
Requires: libprovenance = 0.3.8

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
