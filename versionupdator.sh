#Matt's Auto system update 
echo -n "STARTING UPDATE SCRIPTS"
apt-get -y install lsb-release
version=`lsb_release -sr`

case $version in 
    
    8.8)
        # 8.8 to 8.11
        echo -n "Updating Debian 8 to 8.11"
        apt-get update
        apt-get -y upgrade
        apt --purge autoremove
        apt-get -y dist-upgrade
        apt --purge autoremove
        reboot

    8.11)
        # 8 to 9
        echo -n "Updating Debian 8 to 9"
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/jessie/stretch/g' /etc/apt/sources.list
        apt-get update
        apt-get -y upgrade
        apt --purge autoremove
        apt-get -y dist-upgrade
        apt --purge autoremove
        reboot
        ;;

    9.13)
        # 9 to 10
        echo -n "Updating Debian 9 to 10"
        apt-get update
        apt-get -y upgrade
        apt --purge autoremove
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/stretch/buster/g' /etc/apt/sources.list
        apt-get update
        apt-get -y upgrade
        apt -y full-upgrade
        apt --purge autoremove
        reboot
        ;;

    10)
        # 10 to 11
        echo -n "Updating Debian 10 to 11"
        apt-get update
        apt-get -y upgrade
        apt --purge autoremove
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/buster/bullseye/g' /etc/apt/sources.list
        sed -i 's/buster/bullseye/g' /etc/apt/sources.list.d/*.list
        sed -i 's#/debian-security bullseye/updates# bullseye-security#g' /etc/apt/sources.list
        apt-get update
        apt-get -y upgrade
        apt -y full-upgrade
        apt --purge autoremove
        reboot
        ;;

    11)
        #Remove script
        rm -y /etc/systemd/system/versionupdator.service
        ./opt/debiantolatest/rebunattendedconfig.sh