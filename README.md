# simple-makefile
how to make a makefile easy and simple

You can install any script easily.

####¿Can i execute bash in a makefile?

Yes. Just add the command with @

###### examples:

```makefile
        @echo "hi everybody!"
```

```makefile
        @echo "removing files md..."
        @rm *.md
        @echo "done"
```

##### making a package (deb) (debian/ubuntu/mint) of any script in bash declared with #!/bin/code

```makefile
package:
	@mkdir .temp
	@mkdir -p .temp/usr/bin & mkdir -p .temp/usr/share/myscript
	@cp myscript .temp/usr/bin/ & cp myscript .temp/usr/share/myscript/
	@mkdir ./.temp/DEBIAN
	@echo "Package: myscript" >> ./.temp/DEBIAN/control
	@echo "Priority: optional " >> ./.temp/DEBIAN/control
	@echo "Section: shells " >> ./.temp/DEBIAN/control
	@echo "Maintainer: myname " >> ./.temp/DEBIAN/control
	@echo "Architecture: all " >> ./.temp/DEBIAN/control
	@echo "Version: 1.0 " >> ./.temp/DEBIAN/control
	@echo "Depends: " >> ./.temp/DEBIAN/control
	@echo "Description: mydescription"  >> ./.temp/DEBIAN/control
	@chmod +x .temp/usr/bin/myscript
	@dpkg -b .temp mypackage.deb
	@sudo rm -r .temp
```

Find and set:
        "myscript", for your name of script and extension.
        "myname", with your name.
        "mydescription", with the description of your package.
        "mypackage", with the name of your package deb.
  

##### Install script in makefile
```makefile
install:
	@install -d $(DESTDIR)/usr/share/myscript/
	@install -d $(DESTDIR)/usr/bin
	@install -v -m permissions myscript $(DESTDIR)/usr/bin/
```

Find and set:
        "myscript", for your name of script and extension.
        "permissions", with the permissions of your script, ex. `@install -v -m 755 myscript $(DESTDIR)/usr/bin/`


I will make a script called "testscript" with the makefile in this repository to test it.

```makefile
sudo make install
sudo make package
sudo make remove
```

script use:
        ``testscript``

##### Installing package deb
```bash
sudo dpkg -i package.deb
```
