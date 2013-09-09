Device tree to compile Cyanogenmod 9.1 for acer liquid (salsa)
=========================================

Not working in this stuff:
```
# camera (photo works, but laggy. pano and video stacked)
# usb tether (I check it, but I found this https://github.com/thepasto/android_device_acer_salsa/commit/8bee993d41b78d30dadfb3d9811d2fe078c5d4c7).
# may be anything else, need more testers..
```

Prepare to compile:
```
#0 first of all you need to use an 64bit nix system, for exapmpe ubuntu 12.04 LTS x64 or ubuntu 10.04 x64, and system need
to be full updated

#1 Install req packages:
"sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl 
libncurses5-dev zlib1g-dev openjdk-6-jre openjdk-6-jdk pngcrush schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-4.7-multilib g++-4.5-multilib pngcrush optipng"

#2 Install java jdk 6 by this instruction:
1.) download java 6 from http://www.oracle.com/technetwork/java/javasebusiness/downloads/java-archive-downloads-javase6-419409.html
you need .bin file no rpm.bin!
2.) create path for java:
"sudo mkdir /usr/local/java"
3.) move downloaded file to this folder:
"sudo mv ~/Загрузки/jdk-6u45-linux-x64.bin /usr/local/java/"
4.) go to work directory:
"cd /usr/local/java"
5.) create right rights:
"sudo chmod +x jdk-6u45-linux-x64.bin"
6.) launch .bin file
"sudo ./jdk-6u45-linux-x64.bin"
7.) update work paths to java:
"sudo update-alternatives --install /usr/bin/java java /usr/local/java/jdk1.6.0_45/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/local/java/jdk1.6.0_45/bin/javac 1
sudo update-alternatives --install /usr/bin/javaws javaws /usr/local/java/jdk1.6.0_35/bin/javaws 1"
8.) set config:
"sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo update-alternatives --config javaws"
9.) edit bashrc to current user:
"gedit ~/.bashrc"
to end of file add two strings:
"export PATH=$PATH:/usr/local/java/jdk1.6.0_45/bin
export PATH=$PATH:/usr/local/java/jdk1.6.0_45/jre/bin"

#3 Create the directories:
"mkdir -p ~/bin"

#4 Install the repo command:
"curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
chmod a+x ~/bin/repo"

#5 edit bashrc to current user:
"gedit ~/.bashrc"
to end of file add one string:
"export PATH=${PATH}:~/bin"

#6 create work directory:
"mkdir ~/sources"
"mkdir ~/sources/cm9"

#7 After prepareing you'll need to reboot computer !
```

How to compile:
```
#1 first you need to download cyanogenmod 9 sources into (~/sources/cm9):
"repo init -u git://github.com/CyanogenMod/android.git -b ics-release"
"repo sync -j8"

#2 then goto cm9, device folder:
"cd ~/sources/cm9/device"

#3 and make and move folder named "acer":
"mkdir acer"
"cd acer"

#4 then clone this sources:
"git clone https://github.com/RomzesRover/acer_liquid_device-tree_kernel.git -b cm9"

#5 and rename folder "acer_liquid_device-tree_kernel" to "salsa":
"mv ~/sources/cm9/device/acer/acer_liquid_device-tree_kernel  ~/sources/cm9/device/acer/salsa"

#6 then move to cm9 root directory:
"cd ~/sources/cm9"

#7 and prepare to compile cm9;
"~/sources/cm9/vendor/cm/get-prebuilts"
"cd ~/sources/cm9"
". build/envsetup.sh"

#8 and now you can compile cm9 for liquid:
"brunch salsa -j5"

#9 That's all the result will be in ~/sources/cm9/out/target/salsa
thx.
```

Credits:
```
#RomzesRover
#[ray
#thepasto
```

Usefull commands with commets in russian language:
```
						- # для компилирования andr
repo forall -c git reset --hard			- Очистка исходников android от патчей
make clean					- Очистка от итогов компиляции (для ядра и android)
make mrproper					- Очистка ядра от конфигов (ВАЖНО если компилируешь в первый раз)
/sources/cm9_1/vendor/cm/get-prebuilts	- Получить пребуилтс (Приложения, которые не собираются из исходников)
. build/envsetup.sh				- Обязательно перед компиляцией
brunch salsa -j5				- Собрать прошивку для ливкида (на 4х ядерном хосте)

make ARCH=arm CROSS_COMPILE=/home/romzesrover/sources/arm-2009q3/bin/arm-none-linux-gnueabi- -j5
						- собрать ядро, тулчайн по пути (на 4х ядерном хосте)

						- # Ниже как скомпилировать отдельные либы для salsa
. build/envsetup.sh
breakfast salsa
cd device/acer/salsa/libaudio			- Пример звук
mm						- Создать звук

make hwcomposer.qsd8k				- сделать что нужно .. :)
make recoveryimage				- сделать recovery

						- # для установки рекавери
sudo -s						- делаем от имени админа
adb reboot bootloader				- грузимся в бутлоадер
fastboot -i 0x0502 flash recovery recovery.img	- шьем новое рекавери
fastboot flash boot boot.img			- шьем новый бут

						- # Для github.com/romzesrover
git add .					- замечает измененные и новый файлы
git add -A					- замечает удаленные файлы
git commit -m "first commit"			- делает коммит, даем ему имя
git remote add origin https://github.com/RomzesRover/acer_liquid_device-tree_kernel.git
						- добавить git... нужно делать только в первый раз
git push -u origin master			- обновить файлы на сервере с твоими исходниками.. (попросит логин, пароль)

git checkout -b master				- Переключить бранч
```
