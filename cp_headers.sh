CLEAN_HEADER=bionic/libc/kernel/tools/clean_header.py

KERNEL_PATH=kernel/sony/msm-4.9
HEADER_SRC=$KERNEL_PATH/kernel/include
HEADER_ORI=$KERNEL_PATH/common-headers/original-kernel-headers
HEADER_SAN=$KERNEL_PATH/common-headers/kernel-headers

STAGING_HEADERS="\
    ion.h\
    msm_ion.h"

LINUX_HEADERS="\
    linux/hdmi.h"

UAPI_HEADERS="\
    sound/compress_params.h\
    sound/compress_offload.h\
    sound/asound.h\
    linux/msm_mdp.h\
    linux/msm_mdp_ext.h\
    linux/v4l2-mediabus.h\
    linux/esoc_ctrl.h\
    linux/mfd/wcd9xxx/wcd9xxx_registers.h\
    linux/mfd/wcd9xxx/wcd9320_registers.h\
    linux/mfd/msm-adie-codec.h\
    linux/msm_rmnet.h\
    linux/msm_ipa.h\
    linux/msm_ipc.h\
    linux/videodev2.h\
    linux/fuse.h\
    linux/ipa_qmi_service_v01.h\
    linux/netlink.h\
    linux/msm_kgsl.h\
    linux/msm_dsps.h\
    linux/msm_vidc_dec.h\
    linux/msm_vidc_enc.h\
    linux/msm_rotator.h\
    linux/mdss_rotator.h\
    linux/rmnet_data.h\
    linux/rmnet_ipa_fd_ioctl.h\
    linux/qseecom.h\
    linux/spcom.h\
    linux/msm-core-interface.h\
    linux/v4l2-common.h\
    linux/v4l2-controls.h\
    linux/v4l2-mediabus.h\
    linux/mmc/ioctl.h\
    linux/mmc/core.h\
    linux/mmc/mmc.h\
    media/msm_camera.h\
    media/msm_cam_sensor.h\
    media/msm_camsensor_sdk.h\
    media/msm_fd.h\
    media/msm_isp.h\
    media/msm_jpeg.h\
    media/msm_jpeg_dma.h\
    media/msm_vidc.h\
    media/msmb_camera.h\
    media/msmb_generic_buf_mgr.h\
    media/msmb_isp.h\
    media/msmb_ispif.h\
    media/msmb_pproc.h\
    media/msm_media_info.h\
    media/msm_sde_rotator.h\
    video/msm_hdmi_modes.h\
    scsi/ufs/ufs.h\
    scsi/ufs/ioctl.h\
    drm/msm_drm.h\
    drm/msm_drm_pp.h\
    drm/sde_drm.h\
    asm-generic/ioctls.h"

TECHPACK_UAPI_HEADERS="\
    sound/audio_effects.h\
    sound/lsm_params.h\
    sound/devdep_params.h\
    sound/msmcal-hwdep.h\
    sound/voice_params.h\
    linux/msm_audio_calibration.h\
    linux/msm_audio_wmapro.h\
    linux/msm_audio_amrwb.h\
    linux/msm_audio_amrwbplus.h\
    linux/msm_audio_wma.h\
    linux/msm_audio_aac.h\
    linux/msm_audio.h"

TECHPACK_IPC_HEADERS="\
    voice_svc.h"

cd ../../../..

source build/envsetup.sh
lunch 38

for x in $LINUX_HEADERS; do \
cp $HEADER_SRC/$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x
done

for x in $UAPI_HEADERS; do \
cp $HEADER_SRC/"uapi/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x
done

for x in $TECHPACK_UAPI_HEADERS; do \
cp $HEADER_SRC/"../techpack/audio/include/uapi/"$x $HEADER_ORI/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI -d $HEADER_SAN $x
done

for x in $TECHPACK_IPC_HEADERS; do \
cp $HEADER_SRC/"../techpack/audio/include/ipc/"$x $HEADER_ORI/sound/$x
$CLEAN_HEADER -u -v -k $HEADER_ORI/sound -d $HEADER_SAN/sound $x
done

echo "Copy complete!"
