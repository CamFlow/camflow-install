Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.9.4
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.5
Requires: camflowd = 0.2.4
Requires: camflow-cli = 0.1.14
Requires: kernel = 5.4.15camflow0.6.4
Requires: kernel-headers = 5.4.15camflow0.6.4
Requires: kernel-devel = 5.4.15camflow0.6.4
Requires: libprovenance = 0.4.10

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
