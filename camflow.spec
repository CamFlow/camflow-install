Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.2.1
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.3.3
Requires: camflowd = 0.1.6
Requires: camflow-cli = 0.1.5
Requires: kernel = 4.12.9camflow_0.3.5
Requires: kernel-headers = 4.12.9camflow_0.3.5
Requires: kernel-devel = 4.12.9camflow_0.3.5
Requires: libprovenance = 0.3.7

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
