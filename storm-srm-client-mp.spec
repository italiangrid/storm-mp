Summary: emi storm-srm-client metapackage
Name: emi-storm-srm-client-mp
Version: 1.0.0
Release: 5%{?dist}
License: Apache License 2.0
Vendor: EMI
Group: System Environment/Libraries

Packager: Elisabetta Ronchieri <elisabetta.ronchieri@cnaf.infn.it>

Requires: emi-version
Requires: storm-srm-client

BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)

AutoReqProv: yes

Source: emi-storm-srm-client-mp-%{version}.tar.gz

%description
emi storm-srm-client metapackage

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
 
