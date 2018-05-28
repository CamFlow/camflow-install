Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.7.2
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.1
Requires: camflowd = 0.2.1
Requires: camflow-cli = 0.1.8
Requires: kernel = 4.16.12camflow0.4.1
Requires: kernel-headers = 4.16.12camflow0.4.1
Requires: kernel-devel = 4.16.12camflow0.4.1
Requires: libprovenance = 0.4.0

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
