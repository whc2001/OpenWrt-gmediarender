# OpenWrt-gmediarender

Port [gmediarender-resurrect](https://github.com/hzeller/gmrender-resurrect) to OpenWrt.

Derived from [JiapengLi/OpenWrt-gmediarender](https://github.com/JiapengLi/OpenWrt-gmediarender)

## HOW TO
    cd ~
	git clone https://github.com/whc2001/OpenWrt-gmediarender.git
	cd [Your OpenWrt Dir]
	./scripts/feeds update -a
	./scripts/feeds install -a
	mkdir feeds/packages/multimedia/gmediarender
	cp -f ~/OpenWrt-gmediarender/Makefile feeds/packages/multimedia/gmediarender/
	./scripts/feeds update -i
	./scripts/feeds install gmediarender
	make menuconfig
	
** Choose the right platform **
** Select gmediarender in Multimedia --> gmediarender **

	make V=s

###Build Single Package
** \* Run *make V=s*  first**

	make package/index
	make package/gmediarender/{clean,compile} V=s