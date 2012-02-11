#!/bin/bash
rm META-INF -rf
rm newboot -rf
unzip ../hijack-boot.zip
cp ../../../root-hijack/* newboot/
zip -r hijack-boot.zip META-INF newboot
mv ../hijack-boot.zip ../hijack-boot-old.`date +%y%m%d-%H%M`.zip
cp hijack-boot.zip ../hijack-boot.zip