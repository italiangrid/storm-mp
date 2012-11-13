Summary: emi storm-frontend metapackage
Name: emi-storm-frontend-mp
Version: 1.1.0
Release: 2%{?dist}
License: Apache License 2.0
Vendor: EMI
Group: System Environment/Libraries

Packager: Elisabetta Ronchieri <elisabetta.ronchieri@cnaf.infn.it>

Requires: lcg-expiregridmapdir
Requires: fetch-crl
Requires: emi-version
Requires: yaim-storm
Requires: storm-frontend-server
Requires: cleanup-grid-accounts
Requires: edg-mkgridmap

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
AutoReqProv: yes

Source: emi-storm-frontend-mp-%{version}.tar.gz

%description
emi storm-frontend metapackage

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
 
