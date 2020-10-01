#!/bin/bash
#start when im not home.
out=$(sudo arp-scan -l | grep -c 2c:33:61:2e:36:9d)#after the -c enter your MAC address(this can be your personal device that you take with you)
#so it arms automatically when you're out
if [ $out -eq 0 ];
then
  ap=$(airport -s)
  echo -e "$ap\n" >> listofdevices.txt
  BluetoothConnector >> listofdevices.txt
  date >> listofdevices.txt
  sudo sed -e '/NETGEAR_EXT dc:ef:09:96:1e:93/d' -e '/GuestREINvent 62:0d:10:65:53:d1/d' -e '/Virgin Media 52:0d:10:65:53:d1/d' -e '/REINvent 40:0d:10:65:53:d1/d' -e '/TP-Link_915C c0:25:e9:79:91:5c/d' -e '/GuestREINvent 62:0d:10:65:53:d7/d' -e '/REINvent 40:0d:10:65:53:d7/d' -e '/NETGEAR_5GEXT dc:ef:09:96:1e:92/d' -e '/Usage: BluetoothConnector [--connect | -c] [--disconnect | -d] 00-00-00-00-00-00 [--notify | -n]/d' -e '/Get the MAC address from the list below (if your device is missing, pair it  with your computer first):/d' -e '/SKY2F75E 70:50:af:f7:57/d' -e '/80-c7-55-63-0f-a3 - SC-AKX400/d' -e '/f8-6f-c1-ec-b2-81 - Shan’s Apple Watch/d' -e '/2c-33-61-2e-36-9e - XoxRumbleLorexoX/d' -e  '/WiFi-Repeater 00:e0:20:55:22:fd/d' -e '/PS4-151576D608BE 5c:93:a2:2d:78:d3/d' -e '/Virgin Media 2a:35:d1:3a:4d:51/d' listofdevices.txt >> refinedlistofdevices.txt
  #this might require a couple tries, you need to remove the MAC adresses of the household.
  #So what you need to do is to remove the bit between the / and / with the MAC address
elif [ $out -ne 0 ];
then
  echo "You're home!"
fi
