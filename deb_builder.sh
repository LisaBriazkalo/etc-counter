mkdir -p ~/deb-package/etc
find /etc -type f -exec cp --parents {} ~/deb-package/ \;

mkdir ~/deb-package/DEBIAN

cat > ~/deb-package/DEBIAN/control << 'EOF'
Package: etc-files
Version: 1.0
Section: misc
Priority: optional
Architecture: all
Maintainer: Your Name <your.email@example.com>
Description: Package containing all files (not directories) from /etc
 This package contains all the files from /etc but excludes directories.
EOF

dpkg-deb --build ~/deb-package
