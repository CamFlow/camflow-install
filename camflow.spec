Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.8.0
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.2
Requires: camflowd = 0.2.3
Requires: camflow-cli = 0.1.11
Requires: kernel = 4.20.5camflow0.5.0
Requires: kernel-headers = 4.20.5camflow0.5.0
Requires: kernel-devel = 4.20.5camflow0.5.0
Requires: libprovenance = 0.4.5

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
