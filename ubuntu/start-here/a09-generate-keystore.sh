#!/bin/bash  

#  only need to run this script with the command (do not type the #)
#  bash a09-generate-keystore.sh
#  best in cloud 9 to just right click this file and select run


sudo mkdir /home/keystore
cd /home/keystore

echo "You will be asked for two passwords to enter. A keystore password and a key (alias) password for this app". 
echo "Both passwords can be the same"
echo "Enter the name of your app to name this keystore file, which will also be the alias name"
read myStoreName

keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -validity 999999


keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -binary | openssl base64


keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore -list -v

#sometime the following is needed
#keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -hex


