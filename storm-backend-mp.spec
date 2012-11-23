Summary: emi storm-backend-server metapackage
Name: emi-storm-backend-mp
Version: 1.2.0
Release: 2%{?dist}
License: Apache License
Vendor: EMI
Group: System Environment/Libraries
Packager: Elisabetta Ronchieri <elisabetta.ronchieri@cnaf.infn.it>

Requires: lcg-expiregridmapdir
Requires: fetch-crl
Requires: emi-version
Requires: yaim-storm
Requires: storm-backend-server
Requires: cleanup-grid-accounts
Requires: storm-gridhttps-plugin
Requires: storm-dynamic-info-provider
Requires: glite-yaim-bdii
Requires: edg-mkgridmap
Requires: emir-serp

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

AutoReqProv: yes

Source: emi-storm-backend-mp-%{version}.tar.gz

%description
emi storm-backend-server metapackage

%prep

%setup

%build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT
echo
find $RPM_BUILD_ROOT -name '*.la' -exec rm -rf {} \;
find $RPM_BUILD_ROOT -name '*.pc' -exec sed -i -e "s|$RPM_BUILD_ROOT||g" {} \;

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)

%changelog

