#!/bin/bash
#Matt's Auto system update 
echo -n "STARTING UPDATE SCRIPTS"
DEBIAN_FRONTEND=noninteractive apt-get -yq install lsb-release
version=`lsb_release -sr`
source /opt/unattendedconfig.sh
export APT_LISTCHANGES_FRONTEND=none

case $version in 
    
    8.8)
        # 8.8 to 8.11
        echo -n "Updating Debian 8 to 8.11"
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt --purge autoremove
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" dist-upgrade
        apt --purge autoremove
        reboot
        ;;

    8.11)
        # 8 to 9
        echo -n "Updating Debian 8 to 9"
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/jessie/stretch/g' /etc/apt/sources.list
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt --purge autoremove
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" dist-upgrade
        apt --purge autoremove
        reboot
        ;;

    9.13)
        # 9 to 10
        echo -n "Updating Debian 9 to 10"
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt --purge autoremove
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/stretch/buster/g' /etc/apt/sources.list
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt -yq -o Dpkg::Options::="--force-confnew" full-upgrade
        apt --purge autoremove
        reboot
        ;;

    10)
        # 10 to 11
        echo -n "Updating Debian 10 to 11"
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt --purge autoremove
        cp /etc/apt/sources.list /etc/apt/sources.list_backup
        sed -i 's/buster/bullseye/g' /etc/apt/sources.list
        sed -i 's/buster/bullseye/g' /etc/apt/sources.list.d/*.list
        sed -i 's#/debian-security bullseye/updates# bullseye-security#g' /etc/apt/sources.list
        DEBIAN_FRONTEND=noninteractive apt-get update
        DEBIAN_FRONTEND=noninteractive apt-get -yq -o Dpkg::Options::="--force-confnew" upgrade
        apt -yq -o Dpkg::Options::="--force-confnew" full-upgrade
        apt --purge autoremove
        reboot
        ;;

    11)
        #Remove script
        rm -yq /etc/systemd/system/versionupdator.service
        ;;
esac