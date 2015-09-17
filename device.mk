
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product-if-exists, vendor/samsung/degaswifi/degaswifi-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/degaswifi/overlay

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_CHARACTERISTICS := tablet

# Screen size is "large", density is "mdpi", need "hdpi" for extra drawables
PRODUCT_AAPT_CONFIG := large mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=128m \
    ro.carrier=wifi-only

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Graphics config
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/configs/gfx.cfg:system/etc/gfx.cfg

# fstab:
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/rootdir/fstab.pxa1088:root/fstab.pxa1088 \

# init.rc's:
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/rootdir/init.recovery.pxa1088.rc:root/init.recovery.pxa1088.rc \
    device/samsung/degaswifi/rootdir/init.pxa1088.rc:root/init.pxa1088.rc \
    device/samsung/degaswifi/rootdir/init.pxa1088.usb.rc:root/init.pxa1088.usb.rc \
    device/samsung/degaswifi/rootdir/init.pxa1088.tel.rc:root/init.pxa1088.tel.rc \
    device/samsung/degaswifi/rootdir/init_bsp.rc:root/init_bsp.rc \
    device/samsung/degaswifi/rootdir/init_bsp.pxa1088.rc:root/init_bsp.pxa1088.rc \
    device/samsung/degaswifi/rootdir/init_bsp.pxa1088.tel.rc:root/init_bsp.pxa1088.tel.rc

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa1088 \
    init.pxa1088.rc \
    init.pxa1088.usb.rc \
    ueventd.pxa1088.rc
    
# uevent.rc
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/rootdir/ueventd.pxa1088.rc:root/ueventd.pxa1088.rc

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/configs/audio_policy.conf:system/etc/audio_policy.conf

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/degaswifi/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Product specific Packages
PRODUCT_PACKAGES += \
    libsecril-client

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=wlan0

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# GPS
#PRODUCT_COPY_FILES += \
#    device/samsung/degaswifi/configs/sirfgps.conf:system/etc/sirfgps.conf

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
