Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.9.1
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.4
Requires: camflowd = 0.2.3
Requires: camflow-cli = 0.1.13
Requires: kernel = 5.1.9camflow0.6.1
Requires: kernel-headers = 5.1.9camflow0.6.1
Requires: kernel-devel = 5.1.9camflow0.6.1
Requires: libprovenance = 0.4.7

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
