# the ramdisk
INTERNAL_RAMDISK_FILES := $(TARGET_ROOT_OUT)
BUILT_RAMDISK_TARGET := $(PRODUCT_OUT)/ramdisk.img

# We just build this directly to the install location.
INSTALLED_RAMDISK_TARGET := $(BUILT_RAMDISK_TARGET)
$(INSTALLED_RAMDISK_TARGET): $(MKBOOTFS) $(INTERNAL_RAMDISK_FILES) | $(MINIGZIP)
	$(call pretty,"Target ram disk: $@")
	$(hide) $(MKBOOTFS) $(TARGET_ROOT_OUT) | $(MINIGZIP) > $@

$(INSTALLED_RECOVERYIMAGE_TARGET): device/samsung/degaswifi/degas-mkbootimg \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) device/samsung/degaswifi/degas-mkbootimg $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}

$(INSTALLED_BOOTIMAGE_TARGET): device/samsung/degaswifi/degas-mkbootimg $(INTERNAL_BOOTIMAGE_FILES) $(TARGET_ROOT_OUT)
	$(call pretty,"Target boot image: $@")
	$(hide) device/samsung/degaswifi/degas-mkbootimg $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made BOOT image: $@"${CL_RST}
