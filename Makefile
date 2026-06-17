CC = gcc

# DEV AUTOMATION

status:
	git status

add:
	git add DOCUMENTATION/PACKAGE.txt
	git commit -m "docs: update package documentation"

	git add Makefile
	git commit -m "build: update build system"

	git add updates/DEBIAN/control
	git commit -m "build: update zyphor-updates package metadata"

	git add -A cli/
	git commit -m "refactor: migrate zyphor-cli to zcli package structure"

	git add -A command-center/
	git commit -m "refactor: migrate command center to zcc package structure"

	git add -A os-release/
	git commit -m "refactor: migrate os-release package to zor"

	git add -A repo-config/
	git commit -m "refactor: migrate repository configuration to zrc"

	git add -A whats-new/
	git commit -m "refactor: migrate whats-new package to zwn"

	git add -A shell/
	git commit -m "refactor: retire legacy zyshell package"

	git add zcc/
	git commit -m "feat: add zcc package"

	git add zcli/
	git commit -m "feat: add zcli package"

	git add zor/
	git commit -m "feat: add zor package"

	git add zou/
	git commit -m "feat: add zou package"

	git add zrc/
	git commit -m "feat: add zrc package"

	git add zwn/
	git commit -m "feat: add zwn package"

	git add zysh/
	git commit -m "feat: introduce zysh as default shell"

	git add zyshell/
	git commit -m "chore: add zyshell transition package"

	git add Makefile
	git commit -m "chore: modified Makefile"

push:
	git push origin $(branch)

pull:
	git pull origin $(branch)

merge:
	git merge $(branch)

switch:
	git checkout $(branch)

# RELEASE AUTOMATION

release:
	zyphor build package zor
	mv zor.deb zyphor-os-release.deb

	zyphor build package zwn
	mv zwn.deb zyphor-whats-new.deb

	zyphor build package zcc
	mv zcc.deb zyphor-command-center.deb

	zyphor build package updates
	mv updates.deb zyphor-updates.deb

	mv ./*.deb ../zyphor-os.github.io/pool/main/z --verbose

# BUILD AUTOMATION

copy-default-assets:
	cp -r assets-xfce4/default/fastfetch os-config/variant-xfce/includes.chroot/etc/skel/.config/

	cp -r assets-xfce4/default/banner-installer/logo_debian.png os-config/common/includes.installer/usr/share/graphics/logo_debian.png
	
	cp -r assets-xfce4/default/default-wallpapers/backgrounds.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds.png
	cp -r assets-xfce4/default/default-wallpapers/backgrounds2.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds2.png
	cp -r assets-xfce4/default/default-wallpapers/backgrounds3.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds3.png
	cp -r assets-xfce4/default/default-wallpapers/backgrounds4.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds4.png

	cp -r assets-xfce4/default/default-grub-bootloader-screensaver/grub-bootloader-screen-saver.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/zyphor-grub-bootloader-screensavers/grub-bootloader-screen-saver.png
	cp -r assets-xfce4/default/default-grub-bootloader-screensaver/zyphor-full.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/zyphor-grub-bootloader-screensavers/zyphor-full.png

	cp -r assets-xfce4/default/face-icon/face.png os-config/variant-xfce/includes.chroot/etc/skel/.face

	cp -r assets-xfce4/default/issue os-config/variant-xfce/includes.chroot/etc/issue

	cp -r assets-xfce4/default/os-release os-config/variant-xfce/includes.chroot/etc/os-release

	cp -r assets-xfce4/default/grub.cfg os-config/common/bootloaders/grub-pc/grub.cfg

	cp -r assets-xfce4/default/grub os-config/variant-xfce/includes.chroot/etc/default/grub

	cp -r assets-xfce4/default/menu.cfg os-config/common/bootloaders/syslinux_common/menu.cfg

	cp -r assets-xfce4/default/kali-finish-install os-config/common/includes.installer/kali-finish-install

	cp -r assets-xfce4/default/preseed.cfg os-config/common/includes.installer/preseed.cfg

	echo "\nAssets Copied!\n"

copy-horizon-assets:
	cp -r assets-xfce4/horizon/fastfetch os-config/variant-xfce/includes.chroot/etc/skel/.config/

	cp -r assets-xfce4/horizon/banner-installer/logo_debian.png os-config/common/includes.installer/usr/share/graphics/logo_debian.png
	
	cp -r assets-xfce4/horizon/default-wallpapers/backgrounds.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds.png
	cp -r assets-xfce4/horizon/default-wallpapers/backgrounds2.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds2.png
	cp -r assets-xfce4/horizon/default-wallpapers/backgrounds3.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds3.png
	cp -r assets-xfce4/horizon/default-wallpapers/backgrounds4.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds4.png
	cp -r assets-xfce4/horizon/default-wallpapers/backgrounds5.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/backgrounds5.png

	cp -r assets-xfce4/horizon/default-grub-bootloader-screensaver/grub-bootloader-screen-saver.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/zyphor-grub-bootloader-screensavers/grub-bootloader-screen-saver.png
	cp -r assets-xfce4/horizon/default-grub-bootloader-screensaver/zyphor-full.png os-config/variant-xfce/includes.chroot/usr/share/backgrounds/zyphor-grub-bootloader-screensavers/zyphor-full.png

	cp -r assets-xfce4/horizon/face-icon/face.png os-config/variant-xfce/includes.chroot/etc/skel/.face

	cp -r assets-xfce4/horizon/issue os-config/variant-xfce/includes.chroot/etc/issue

	cp -r assets-xfce4/horizon/os-release os-config/variant-xfce/includes.chroot/etc/os-release

	cp -r assets-xfce4/horizon/grub.cfg os-config/common/bootloaders/grub-pc/grub.cfg

	cp -r assets-xfce4/horizon/grub os-config/variant-xfce/includes.chroot/etc/default/grub

	cp -r assets-xfce4/horizon/menu.cfg os-config/common/bootloaders/syslinux_common/menu.cfg

	cp -r assets-xfce4/horizon/kali-finish-install os-config/common/includes.installer/kali-finish-install

	cp -r assets-xfce4/horizon/preseed.cfg os-config/common/includes.installer/preseed.cfg

	echo "\nAssets Copied!\n"

build:
	./build.sh --variant xfce --verbose

# BOOT AUTOMATION

vmInit:
	$(CC) vmInit.c \
	 helpers/helperInput.c \
	 helpers/helperString.c \
	 -o vmInit

bootHardDisk:
	$(CC) bootHardDisk.c \
	 helpers/helperInput.c \
	 helpers/helperString.c \
	 -o bootHardDisk

bootCDROM:
	$(CC) bootCDROM.c \
	 helpers/helperInput.c \
	 helpers/helperString.c \
	 -o bootCDROM

clean:
	rm -f vmInit bootHardDisk bootCDROM