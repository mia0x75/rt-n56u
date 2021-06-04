FIRMWARE_ROOTFS_VER=3.9
FIRMWARE_BUILDS_VER=$(git rev-parse --short=8 HEAD 2>/dev/null)
FIRMWARE_BUILDS_REV=$(date +%m%d 2>/dev/null)
