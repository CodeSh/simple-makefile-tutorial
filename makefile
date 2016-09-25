package:
  @mkdir .temp
  @mkdir -p .temp/usr/bin & mkdir -p .temp/usr/share/testscript
  @cp testscript .temp/usr/bin/ & cp testscript .temp/usr/share/testscript/
  @mkdir ./.temp/DEBIAN
  @echo "Package: testscript" >> ./.temp/DEBIAN/control
  @echo "Priority: optional " >> ./.temp/DEBIAN/control
  @echo "Section: shells " >> ./.temp/DEBIAN/control
  @echo "Maintainer: Harry " >> ./.temp/DEBIAN/control
  @echo "Architecture: all " >> ./.temp/DEBIAN/control
  @echo "Version: 1.0 " >> ./.temp/DEBIAN/control
  @echo "Depends: " >> ./.temp/DEBIAN/control
  @echo "Description: simple makefile"  >> ./.temp/DEBIAN/control
  @sudo chown -R root.root ./.temp
  @dpkg -b .temp package.deb
  @sudo rm -r .temp
  @echo "Done!"
    
install:
  @install -d $(DESTDIR)/usr/share/testscript/
  @install -d $(DESTDIR)/usr/bin
  @install -v -m 755 testscript $(DESTDIR)/usr/bin/
    
remove:
  @echo "Removing..."
  @rm -rf $(DESTDIR)/usr/share/testscript
  @rm -rf $(DESTDIR)/usr/bin/testscript
  @echo "Done!"
