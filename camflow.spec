Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.7.6
Release: 1
Group: audit/camflow
License: GPLv2
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camconfd = 0.4.1
Requires: camflowd = 0.2.2
Requires: camflow-cli = 0.1.10
Requires: kernel = 4.18.16camflow0.4.5
Requires: kernel-headers = 4.18.16camflow0.4.5
Requires: kernel-devel = 4.18.16camflow0.4.5
Requires: libprovenance = 0.4.4

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
