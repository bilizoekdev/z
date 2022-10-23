#sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/projectarcana-aosp/manifest -b 12.x -g default,-mips,-darwin,-notdefault
git clone https://github.com/saitama-sense/local_manifest --depth 1 -b main .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
source build/envsetup.sh
lunch aosp_ginkgo-userdebug
export TZ=Asia/Jakarta
export KBUILD_BUILD_USER=Saitama
export KBUILD_BUILD_HOST=Cirrus
export BUILD_USERNAME=Saitama
export BUILD_HOSTNAME=Cirrus
# export USE_MICROG=true
# export TARGET_USES_MINI_GAPPS=true
make bacon-j8
# build Arcana GALE
