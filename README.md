# Lenovo TB3-730X Device tree
This is the device tree for the Lenovo TB3-730X.

<img width="654" height="443" alt="17934454434037826396027524649844" src="https://github.com/user-attachments/assets/48aa4d1e-4c80-434b-8fc2-3b9f540ff21d" />

## Specs:

| Specification | Details |
|---|---|
| Manufacturer | Lenovo |
| Name | TB3-730X |
| Codename | wt98999 |
| Release Year | 2016 |
| Type | Tablet |
| Chipset | MediaTek MT6735M / Mediatek MT6753 |
| CPU | Octa-Core 1.0GHz Cortex-A53 |
| GPU | Mali-T720MP2 |
| Display | 1024x600 pixels (WSVGA LCD) |
| Storage | 16GB |
| Memory | 1/2GB |
| Architecture | aarch64 |
| Original Software | Android |
| Original Version | 6.0 |

---

# Build ROM
Use server/virtual with Fedora 45.

Install packages:
```
dnf install openjdk-8-jdk android-tools-adb bc bison build-essential curl flex g++-multilib gcc-multilib gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libesd0-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc yasm zip zlib1g-dev git wget curl git
```
Install repo tool:
```
mkdir -p ~/bin
wget 'https://storage.googleapis.com/git-repo-downloads/repo' -P ~/bin
chmod +x ~/bin/repo
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```
Make android source tree directories:
```
mkdir -p ~/your_rom/version/.repo/local_manifests/
cd ~/your_rom/version
```
Clone device tree, kernel and vendor:
```
Device tree: GitHub
Kernel: GitHub
Vendor: GitLab
``` 
Init source tree with AEX sources:
```
repo init -u https://github.com/<ROM>/<manifest.git> -b <Android version>
```

Sync source code from repos:
```
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```
Export some shell functions and make lunch:
```
. build/envsetup.sh
lunch
```
Run build:
```
mka bacon -j$(nproc --all)
```
