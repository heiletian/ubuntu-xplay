#!/bin/bash

dir=$(/usr/bin/dirname $0)

if [ ! -d /etc/xplay ];then
    mkdir /etc/xplay
fi

cp -aRrf ${dir}/../package/bin/xplay /usr/bin/
cp -aRrf ${dir}/../package/bin/xplayctl /usr/bin/
cp -aRrf ${dir}/../package/bin/xplayrun /usr/bin/
cp -aRrf ${dir}/../package/libs/* /usr/local/lib/

cp -aRrf ${dir}/../package/etc/log4qt.properties /etc/xplay/
cp -aRrf ${dir}/../package/etc/simsun.ttc /etc/xplay/
cp -aRrf ${dir}/../package/etc/00-xplay.conf /etc/ld.so.conf.d/
ldconfig

echo "/usr/bin/xplay" > /etc/xplay/library.file
echo "/usr/bin/xplayctl" >> /etc/xplay/library.file
echo "/usr/bin/xplayrun" >> /etc/xplay/library.file
for lib in `ls ${dir}/../package/libs/`;do
    echo "/usr/local/lib/$lib" >> /etc/xplay/library.file
done

echo "/etc/xplay/log4qt.properties" >> /etc/xplay/library.file
echo "/etc/xplay/simsun.ttc" >> /etc/xplay/library.file
echo "/etc/ld.so.conf.d/00-xplay.conf" >> /etc/xplay/library.file

echo "Successful installation /usr/bin/xplay"
