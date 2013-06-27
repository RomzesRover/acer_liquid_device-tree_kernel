Device tree to compile Cyanogenmod 9 for acer liquid (salsa)
=========================================

Not working in this stuff:
```
# deep sleep
# camera
# wifi, usb tether.
# may be anything else, need more testers..
```

How to compile:
```
#1 first you need to download cyanogenmod 9 sources into (~/sources/cm9):
"repo init -u git://github.com/CyanogenMod/android.git -b ics"

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
