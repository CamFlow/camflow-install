Summary: Install all CamFlow dependencies.
Name: camflow
Version: 0.3.2
Release: 1
Group: audit/camflow
License: GPLv3
Source: %{expand:%%(pwd)}
BuildRoot: %{_topdir}/BUILD/%{name}-%{version}-%{release}
Requires: camflow-service = 0.1.1
Requires: camflow-config = 0.3.1
Requires: camflow-cli = 0.1.3
Requires: camflow-provenance-lib = 0.3.2
Requires: kernel = 4.11.3camflow_0.3.2
Requires: kernel-headers = 4.11.3camflow_0.3.2
Requires: kernel-devel = 4.11.3camflow_0.3.2

%description
%{summary}

%prep

%clean
rm -r -f "$RPM_BUILD_ROOT"

%files
