Summary: emi storm-globus-gridftp-server metapackage
Name: emi-storm-globus-gridftp-mp
Version: 1.1.0
Release: 2%{?dist}
License: Apache License 2.0
Vendor: EMI
Group: System Environment/Libraries

Packager: Elisabetta Ronchieri <elisabetta.ronchieri@cnaf.infn.it>

Requires: lcas-lcmaps-gt4-interface
Requires: lcas-plugins-basic
Requires: lcg-expiregridmapdir
Requires: emi-version
Requires: yaim-storm
Requires: fetch-crl
Requires: lcmaps
Requires: lcas-plugins-voms
Requires: storm-globus-gridftp-server
Requires: lcmaps-without-gsi
Requires: lcmaps-plugins-basic
Requires: cleanup-grid-accounts
Requires: edg-mkgridmap
Requires: lcmaps-plugins-voms
Requires: lcas

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
AutoReqProv: yes

Source: emi-storm-globus-gridftp-mp-%{version}.tar.gz

%description
emi storm-globus-gridftp metapackage

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
 
