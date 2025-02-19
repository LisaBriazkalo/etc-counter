sudo apt update
sudo apt install rpm

mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

mkdir -p ~/rpmbuild/SOURCES/etc_files
find /etc -type f -exec cp --parents {} ~/rpmbuild/SOURCES/etc_files/ \;

cat > ~/rpmbuild/SPECS/etc_files.spec << 'EOF'
%global __strip /bin/true
%global __objdump /bin/true
%define __brp_strip_none 1

Name: etc-files
Version: 1.0
Release: 1%{?dist}
Summary: Package containing all files from /etc
License: GPL
Group: System Environment/Base

BuildRoot: %{_topdir}/BUILD/%{name}-%{version}

%description
This package contains all files (not directories) from /etc.

%prep

%build

%install
mkdir -p %{buildroot}/etc
cp -r %{_sourcedir}/etc_files/* %{buildroot}/etc/

%files
/etc
EOF

rpmbuild -ba ~/rpmbuild/SPECS/etc_files.spec 
