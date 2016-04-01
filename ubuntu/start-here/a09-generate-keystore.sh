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

#keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -validity 999999
#keytool -genkey -v -keystore <App-Name>.keystore -alias <Alias Name> -keyalg RSA -keysize 2048 -validity 10000

keytool -genkey -v -keystore $myStoreName.keystore -alias $myStoreName -keyalg RSA -keysize 2048 -validity 10000



keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -binary | openssl base64

# or in three steps
# keytool -export -alias $myStoreName -file certfile.cer -keystore $myStoreName.store
# keytool -import -alias public$myStoreName -file certfile.cer -keystore public$myStoreName.store
# rm certfile.cer





keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore -list -v



#sometimes the following is needed
#keytool -exportcert -alias $myStoreName -keystore $myStoreName.keystore | openssl sha1 -hex


keytool -list -v -keystore $myStoreName.store


#notes
#To specify your keystore and alias, open the project ant.properties file (found in the root of the project directory) and add entries for key.store and key.alias as below

#key.store=<App-Name>.keystore
#key.alias=Alias-Name
#Save your changes. Now you can build a signed .apk in release mode

#Open a command-line and navigate to the root of your project directory.
#Use Ant to compile your project in release mode:

#ant release
