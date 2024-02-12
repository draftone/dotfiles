#!/bin/bash

IP=$(ip addr show eth0 | grep 'inet ' | awk '{ print $2 }' | cut -d/ -f1)

# 既存のポートプロキシルールを削除し、新しいルールを追加
/mnt/c/Windows/System32/cmd.exe /C netsh interface portproxy delete v4tov4 listenport=2222
/mnt/c/Windows/System32/cmd.exe /C netsh interface portproxy add v4tov4 listenport=2222 connectport=22 connectaddress=$IP

/mnt/c/Windows/System32/sc.exe config iphlpsvc start=auto
/mnt/c/Windows/System32/sc.exe start  iphlpsvc
