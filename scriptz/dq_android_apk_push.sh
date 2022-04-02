source ./.biz9_config.sh

echo '##############'
echo 'BiZ9 MOBILE PUSH'
echo "APP ID:" ${APP_ID}
echo "APP TITLE:" ${APP_TITLE}
echo "APP VERSION:" ${APP_VERSION}
echo '##############'
INCREMENT_VERSION ()
{
    declare -a part=( ${1//\./ } )
        declare    new
        declare -i carry=1

        for (( CNTR=${#part[@]}-1; CNTR>=0; CNTR-=1 )); do
            len=${#part[CNTR]}
    new=$((part[CNTR]+carry))
        [ ${#new} -gt $len ] && carry=1 || carry=0
        [ $CNTR -gt 0 ] && part[CNTR]=${new: -len} || part[CNTR]=${new}
    done
        new="${part[*]}"
        echo -e "${new// /.}"
}

APP_VERSION_NEW=$(INCREMENT_VERSION $APP_VERSION);

# config
rm -rf config.xml
cp -rf ${CONFIG_FILE} config.xml

sed -i "s/CONFIG_ID/${CONFIG_ID}/g" config.xml
sed -i "s/CONFIG_VERSION/${APP_VERSION_NEW}/g" config.xml
sed -i "s/APP_VERSION=.*/APP_VERSION='${APP_VERSION_NEW}'/" .biz9_config.sh
sed -i "s/G_APP_VERSION=.*/G_APP_VERSION='${APP_VERSION_NEW}'/" www/scripts/biz_scriptz/config.js
sed -i "s/APP_TITLE/${APP_TITLE}/g" config.xml
echo "MY BOSS APP COPY CONFIG OK..."


cordova compile
echo "MY_BOSS_APP COMPILE...."
cordova build --release android
echo "MY_BOSS_APP BUILD..."

#apk
$ZIPALIGN_DIR/zipalign -f -v 4  ${APP_DEBUG_APK} ${APP_TITLE_ID}".apk"
apksigner sign  --ks ${KEY_STORE} --ks-pass pass:"${KEY_STORE_PASSWORD}" ${APP_TITLE_ID}".apk"
echo "MY_BOSS_APP APK APKSIGNER..."

aab
$ZIPALIGN_DIR/zipalign -f -v 4  ${APP_DEBUG_APK} ${APP_TITLE_ID}".aab"
apksigner sign  --ks ${KEY_STORE} --ks-pass pass:"${KEY_STORE_PASSWORD}" ${APP_TITLE_ID}".aab"
echo "MY_BOSS_APP AAB APKSIGNER..."

rsync -rave "ssh -2 -i ${AWS_KEY_PEM}" ${APP_TITLE_ID}.apk  admin@${DEPLOY_IP}:${DEPLOY_LOC}
rsync -rave "ssh -2 -i ${AWS_KEY_PEM}" ${APP_TITLE_ID}.aab  admin@${DEPLOY_IP}:${DEPLOY_LOC}

echo "#################"
echo "MY BOSS APP push version $APP_VERSION_NEW"
echo "version= $APP_VERSION_NEW"
echo "APP_TITLE_ID= $APP_TITLE_ID"
echo "${DOWNLOAD_URL}/${APP_TITLE_ID}.apk"
echo "#################"
echo "${DOWNLOAD_URL}/${APP_TITLE_ID}.aab"
echo "ELEVATED!!!"
echo "#################"
