/*
** Copyright 2008, Google Inc.
** Copyright (c) 2009, Code Aurora Forum. All rights reserved.
** Copyright (c) 2010, Ricardo Cerqueira
**
** Licensed under the Apache License, Version 2.0 (the "License");
** you may not use this file except in compliance with the License.
** You may obtain a copy of the License at
**
**     http://www.apache.org/licenses/LICENSE-2.0
**
** Unless required by applicable law or agreed to in writing, software
** distributed under the License is distributed on an "AS IS" BASIS,
** WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
** See the License for the specific language governing permissions and
** limitations under the License.
**
** NOTICE - (RC)
**
** All alterations done to this file to add support for the Z71 terminal
** are intended for use with CyanogenMod. This includes all the support
** for ov5642, and the reverse engineered bits like ioctls and EXIF 
** referred to below as "Values originally from proprietary headers")
** Please do not change the EXIF header without asking me first.
*/

#ifndef ANDROID_HARDWARE_QUALCOMM_CAMERA_HARDWARE_H
#define ANDROID_HARDWARE_QUALCOMM_CAMERA_HARDWARE_H

#include <CameraHardwareInterface.h>
#include <binder/MemoryBase.h>
#include <binder/MemoryHeapBase.h>
#include <stdint.h>
#include <ui/Overlay.h>

extern "C" {
#include <utils/threads.h>
#include <linux/android_pmem.h>
#include <msm_camera.h>
}

#define CONFIG_MACH_ACER_A1 1

struct str_map {
    const char *const desc;
    int val;
};

typedef enum {
    TARGET_MSM7625,
    TARGET_MSM7627,
    TARGET_QSD8250,
    TARGET_MSM7630,
    TARGET_MAX
}targetType;

struct target_map {
    const char *targetStr;
    targetType targetEnum;
};

struct board_property{
    targetType target;
    unsigned int previewSizeMask;
};

/* Values originally in proprietary headers */

#define MSM_CAMERA_CONTROL "/dev/msm_camera/control0"
#define MSM_CAMERA_CONFIG "/dev/msm_camera/config0"

#define TRUE 1
#define FALSE 0

#if defined(CONFIG_MACH_ACER_A1)

#define CAMERA_MIN_CONTRAST 0
#define CAMERA_MAX_CONTRAST 6
#define CAMERA_MIN_SHARPNESS 0
#define CAMERA_MIN_EXPOSURE_COMPENSATION 0
#define CAMERA_MAX_SHARPNESS 10
#define CAMERA_MIN_SATURATION 0
#define CAMERA_MAX_SATURATION 10
#define CAMERA_MAX_EXPOSURE_COMPENSATION 8

#define CAMERA_DEF_ZOOM 0
#define CAMERA_DEF_SHARPNESS 10
#define CAMERA_DEF_CONTRAST 6
#define CAMERA_DEF_SATURATION 6
#define CAMERA_DEF_EXPOSURE_COMPENSATION "0"
#define CAMERA_EXPOSURE_COMPENSATION_STEP 2

#else /* !defined(CONFIG_MACH_ACER_A1) */

#define CAMERA_MIN_CONTRAST 0
#define CAMERA_MAX_CONTRAST 255
#define CAMERA_MIN_SHARPNESS 0
#define CAMERA_MIN_EXPOSURE_COMPENSATION 0
#define CAMERA_MAX_SHARPNESS 255
#define CAMERA_MIN_SATURATION 0
#define CAMERA_MAX_SATURATION 255
#define CAMERA_MAX_EXPOSURE_COMPENSATION 8
#define CAMERA_DEF_SHARPNESS 30
#define CAMERA_DEF_CONTRAST 8
#define CAMERA_DEF_SATURATION 6
#define CAMERA_DEF_EXPOSURE_COMPENSATION "2.0"
#define CAMERA_EXPOSURE_COMPENSATION_STEP 2

#endif /* defined(CONFIG_MACH_ACER_A1) */

#define CEILING16(x) (x&0xfffffff0)
#define PAD_TO_WORD(x) ((x&1) ? x+1 : x)

#define JPEG_EVENT_DONE 0 /* useless */
#define CAM_CTRL_SUCCESS 1

#define MINIMUM_FPS 10
#define DEFAULT_FPS 15
#define MAXIMUM_FPS 25

/*
* in1 is original dimensions for thumbnail
* in2 is original dimensions for picture frame size
* out1 is cropped dimensions for thumbnail
* out2 is cropped dimensions for picture frame size
*/
typedef struct {
	unsigned int in1_w;
	unsigned int in1_h;
	unsigned int out1_w;
	unsigned int out1_h;
	unsigned int in2_w;
	unsigned int in2_h;
	unsigned int out2_w;
	unsigned int out2_h;
	uint8_t update_flag; 
} common_crop_t;

typedef uint8_t cam_ctrl_type;

typedef struct {
	//Size: 0x20 bytes = 32 bytes = 16 short
	unsigned short video_width;//0xe4
	unsigned short video_height;//0xe6
	unsigned short picture_width; //0xe8
	unsigned short picture_height;//0xea
	unsigned short display_width; //0xec
	unsigned short display_height; //0xee
	unsigned short orig_picture_dx;  //0xf0
	unsigned short orig_picture_dy; //0xf2
	unsigned short ui_thumbnail_width; //0xf4
	unsigned short ui_thumbnail_height; //0xf6
	unsigned short thumbnail_width;  //0xf8
	unsigned short thumbnail_height;  //0xfa
	unsigned short raw_picture_height; //0xfc
	unsigned short raw_picture_width;  //0xfe
	unsigned short filler7;   ///0x100
	unsigned short filler8;   //0x102
} cam_ctrl_dimension_t;

typedef struct {
	uint32_t timestamp;  /* seconds since 1/6/1980          */
	double   latitude;   /* degrees, WGS ellipsoid */
	double   longitude;  /* degrees                */
	int16_t  altitude;   /* meters                          */
} camera_position_type;
typedef uint8_t jpeg_event_t;

typedef enum {
	CAMERA_WB_MIN_MINUS_1,
	CAMERA_WB_AUTO = 1,  /* This list must match aeecamera.h */
	CAMERA_WB_CUSTOM,
	CAMERA_WB_INCANDESCENT,
	CAMERA_WB_FLUORESCENT,
	CAMERA_WB_DAYLIGHT,
	CAMERA_WB_CLOUDY_DAYLIGHT,
	CAMERA_WB_TWILIGHT,
	CAMERA_WB_SHADE,
	CAMERA_WB_MAX_PLUS_1
} camera_wb_type;

typedef enum {
    CAMERA_ANTIBANDING_OFF,
    CAMERA_ANTIBANDING_60HZ,
    CAMERA_ANTIBANDING_50HZ,
    CAMERA_ANTIBANDING_AUTO,
    CAMERA_MAX_ANTIBANDING,
} camera_antibanding_type;

typedef enum {
	AF_MODE_NORMAL,
	AF_MODE_MACRO,
	AF_MODE_AUTO,
} isp3a_af_mode_t;

enum {
	CAMERA_AEC_FRAME_AVERAGE,
	CAMERA_AEC_CENTER_WEIGHTED,
	CAMERA_AEC_SPOT_METERING,
};

enum {
	LED_MODE_OFF,
	LED_MODE_AUTO,
	LED_MODE_ON,
};

typedef enum {
	CAMERA_ISO_AUTO = 0,
	CAMERA_ISO_DEBLUR,
	CAMERA_ISO_100,
	CAMERA_ISO_200,
	CAMERA_ISO_400,
	CAMERA_ISO_800,
	CAMERA_ISO_1600,
} camera_iso_mode_type;

struct fifo_queue {
	int num_of_frames;
	int front;
	struct fifo_node *node;
	pthread_mutex_t mut;
	pthread_cond_t wait;
};

struct fifo_node {
	struct msm_frame *f;
	struct fifo_node *next;
};

void enqueue(struct fifo_queue *queue, struct fifo_node *node) {
	struct fifo_node *cur_node=queue->node;
	int i;
	LOGE("enqueue:%p(%d)\n", node, queue->num_of_frames);
	node->next=NULL;
	if(queue->num_of_frames==0) {
		queue->num_of_frames++;
		queue->front=!!queue->num_of_frames;
		queue->node=node;
		return;
	}
	queue->num_of_frames++;
	queue->front=!!queue->num_of_frames;
	for(i=0;i<(queue->num_of_frames-2);++i) {
		cur_node=cur_node->next;
		assert(!!cur_node);
	}
	cur_node->next=node;
}

struct fifo_node *dequeue(struct fifo_queue *queue) {
	if(queue->num_of_frames==0)
		return NULL;
	struct fifo_node *node=queue->node;
	LOGE("dequeue:%p(%d)\n", node, queue->num_of_frames);
	queue->num_of_frames--;
	queue->front=!!queue->num_of_frames;
	queue->node=queue->node->next;
	return node;
}

#if defined(CONFIG_MACH_ACER_A1)

#define CAMERA_SET_PARM_DIMENSION		1
#define CAMERA_SET_PARM_ZOOM			2
#define CAMERA_SET_PARM_SHARPNESS		4
#define CAMERA_SET_PARM_CONTRAST		6
#define CAMERA_SET_PARM_BRIGHTNESS		7
#define CAMERA_SET_PARM_EXPOSURE_COMPENSATION	8
#define CAMERA_SET_PARM_SATURATION		11
#define CAMERA_SET_PARM_EXPOSURE                12
#define CAMERA_SET_PARM_AUTO_FOCUS              13
#define CAMERA_SET_PARM_WB                      14
#define CAMERA_SET_PARM_EFFECT                  15
#define CAMERA_SET_PARM_FPS                     16
#define CAMERA_ENABLE_AFD                       52
#define CAMERA_SET_PARM_ANTIBANDING		21
#define CAMERA_SET_PARM_ISO                     26
#define CAMERA_SET_PARM_HJR                     35
#define CAMERA_SET_PARM_ROLLOFF                 36
#define CAMERA_AUTO_FOCUS_CANCEL                50
#define CAMERA_STOP_PREVIEW                     38
#define CAMERA_START_PREVIEW                    39
#define CAMERA_START_SNAPSHOT                   40
#define CAMERA_START_RAW_SNAPSHOT               41
#define CAMERA_STOP_SNAPSHOT                    42
#define CAMERA_GET_PARM_MAXZOOM                 47
#define CAMERA_SET_PARM_LED_MODE                46
#define CAMERA_PREPARE_SNAPSHOT                 54
#define CAMERA_START_VIDEO                      56
#define CAMERA_STOP_VIDEO			57
#define CAMERA_START_RECORDING                  58
#define CAMERA_STOP_RECORDING                   59
#define CAMERA_SET_PARM_FOCUS_STEP              23
//#define CAMERA_GET_PARM_AF_SHARPNESS            48
//#define CAMERA_SET_MOTION_ISO                   49
//#define CAMERA_GET_PARM_FOCUS_STEP		51
//============================

#else /* !defined(CONFIG_MACH_ACER_A1) */

#define CAMERA_SET_PARM_DIMENSION 1
#define CAMERA_SET_PARM_ZOOM 2
#define CAMERA_SET_PARM_SHARPNESS 4
#define CAMERA_SET_PARM_CONTRAST 6
#define CAMERA_SET_PARM_BRIGHTNESS 7
// fake exp compensation
#define CAMERA_SET_PARM_EXPOSURE_COMPENSATION 8
#define CAMERA_SET_PARM_SATURATION 11
#define CAMERA_SET_PARM_EXPOSURE 12
#define CAMERA_SET_PARM_AUTO_FOCUS 13
#define CAMERA_SET_PARM_WB 14
#define CAMERA_SET_PARM_EFFECT 15
#define CAMERA_SET_PARM_FPS 16
#define CAMERA_ENABLE_AFD 21 //Bah can't find the real value
#define CAMERA_SET_PARM_ANTIBANDING 21
#define CAMERA_SET_PARM_ISO 26
#define CAMERA_SET_PARM_HJR 36
#define CAMERA_SET_PARM_ROLLOFF 37
#define CAMERA_AUTO_FOCUS_CANCEL 38
#define CAMERA_STOP_PREVIEW 38
#define CAMERA_START_PREVIEW 39
#define CAMERA_START_SNAPSHOT 40
#define CAMERA_START_RAW_SNAPSHOT 41
#define CAMERA_STOP_SNAPSHOT 42
#define CAMERA_EXIT 43
#define CAMERA_GET_PARM_MAXZOOM 47
#define CAMERA_SET_PARM_LED_MODE 49
#define CAMERA_PREPARE_SNAPSHOT 54
#define CAMERA_START_VIDEO 56
#define CAMERA_STOP_VIDEO 57
#define CAMERA_START_RECORDING 58
#define CAMERA_STOP_RECORDING 59

#endif /* defined(CONFIG_MACH_ACER_A1) */


typedef enum {
	CAMERA_RSP_CB_SUCCESS,    /* Function is accepted         */
	CAMERA_EXIT_CB_DONE,      /* Function is executed         */
	CAMERA_EXIT_CB_FAILED,    /* Execution failed or rejected */
	CAMERA_EXIT_CB_DSP_IDLE,  /* DSP is in idle state         */
	CAMERA_EXIT_CB_DSP_ABORT, /* Abort due to DSP failure     */
	CAMERA_EXIT_CB_ABORT,     /* Function aborted             */
	CAMERA_EXIT_CB_ERROR,     /* Failed due to resource       */
	CAMERA_EVT_CB_FRAME,      /* Preview or video frame ready */
	CAMERA_EVT_CB_PICTURE,    /* Picture frame ready for multi-shot */
	CAMERA_STATUS_CB,         /* Status updated               */
	CAMERA_EXIT_CB_FILE_SIZE_EXCEEDED, /* Specified file size not achieved,
	encoded file written & returned anyway */
	CAMERA_EXIT_CB_BUFFER,    /* A buffer is returned         */
	CAMERA_EVT_CB_SNAPSHOT_DONE,/*  Snapshot updated               */
	CAMERA_CB_MAX
} camera_cb_type;

struct cam_frame_start_parms {
	unsigned int unknown;
	struct msm_frame frame;
	struct msm_frame video_frame;
};

typedef unsigned int exif_tag_id_t;

#define EXIF_RATIONAL 5
#define EXIF_ASCII 2
#define EXIF_BYTE 1

typedef struct {
	int val;
	int otherval;
} rat_t;

typedef unsigned int exif_tag_id_t;
enum {
	EXIFTAGID_GPS_LATITUDE	= 0x20002,
	EXIFTAGID_GPS_LONGITUDE	= 0x40004,
};

typedef union {
        char * _ascii; /* At byte 16 relative to exif_tag_entry_t */
        rat_t * _rats;
        rat_t  _rat;
        uint8_t _byte;
} exif_tag_data_t;

/* The entire exif_tag_entry_t struct must be 24 bytes in length */
typedef unsigned int exif_tag_type_t;
typedef struct {
	exif_tag_type_t type;
	uint32_t copy;
	uint32_t count;
	exif_tag_data_t data;
} exif_tag_entry_t;

typedef struct {
	exif_tag_id_t tag_id;
	exif_tag_entry_t tag_entry;
} exif_tags_info_t;

/* EXIF tag IDs */
#define EXIFTAGID_GPS_LATITUDE 0x20002
#define EXIFTAGID_GPS_LATITUDE_REF 0x10001
#define EXIFTAGID_GPS_LONGITUDE 0x40004
#define EXIFTAGID_GPS_LONGITUDE_REF 0x30003
#define EXIFTAGID_GPS_ALTITUDE 0x60006
#define EXIFTAGID_GPS_ALTITUDE_REF 0x50005
#define EXIFTAGID_EXIF_CAMERA_MAKER 0x21010F
#define EXIFTAGID_EXIF_CAMERA_MODEL 0x220110
#define EXIFTAGID_EXIF_DATE_TIME_ORIGINAL 0x3A9003
#define EXIFTAGID_EXIF_DATE_TIME 0x3B9004
/* End of values originally in proprietary headers */

namespace android {

class QualcommCameraHardware : public CameraHardwareInterface {
public:

    virtual sp<IMemoryHeap> getPreviewHeap() const;
    virtual sp<IMemoryHeap> getRawHeap() const;

    virtual void setCallbacks(notify_callback notify_cb,
                   data_callback data_cb,
                   data_callback_timestamp data_cb_timestamp,
                   void* user);
    virtual void enableMsgType(int32_t msgType);
    virtual void disableMsgType(int32_t msgType);
    virtual bool msgTypeEnabled(int32_t msgType);

    virtual status_t dump(int fd, const Vector<String16>& args) const;
    virtual status_t startPreview();
    virtual void stopPreview();
    virtual bool previewEnabled();
    virtual status_t startRecording();
    virtual void stopRecording();
    virtual bool recordingEnabled();
    virtual void releaseRecordingFrame(const sp<IMemory>& mem);
    virtual status_t autoFocus();
    virtual status_t cancelAutoFocus();
    virtual status_t takePicture();
    virtual status_t cancelPicture();
    virtual status_t setParameters(const CameraParameters& params);
    virtual CameraParameters getParameters() const;
    virtual status_t sendCommand(int32_t command, int32_t arg1, int32_t arg2);
    virtual status_t getBufferInfo( sp<IMemory>& Frame, size_t *alignedSize);

    //int getPreviewSize(int *width, int *height, int *frame_size);
    //int setObjectPosition(int x, int y);

    virtual void release();
    virtual bool useOverlay();
    virtual status_t setOverlay(const sp<Overlay> &overlay);

    static sp<CameraHardwareInterface> createInstance();
    static sp<QualcommCameraHardware> getInstance();

    void receivePreviewFrame(struct msm_frame *frame);
    void receiveRecordingFrame(struct msm_frame *frame);
    void receiveJpegPicture(void);
    void jpeg_set_location();
    void receiveJpegPictureFragment(uint8_t *buf, uint32_t size);
    void notifyShutter(common_crop_t *crop, bool mPlayShutterSoundOnly);
    void receive_camframetimeout();

    unsigned char native_set_zoom(int camfd, void *pZm);
    unsigned char native_get_maxZoom(int camfd, void *pZm);

private:
    QualcommCameraHardware();
    virtual ~QualcommCameraHardware();
    status_t startPreviewInternal();
    void stopPreviewInternal();
    friend void *auto_focus_thread(void *user);
    void runAutoFocus();
    status_t cancelAutoFocusInternal();
    int sensor_io_cfg(int s_cfg_type, int s_cfg_mode, int s_cfg_rs, uint8_t s_cfg_max_steps, void *s_cfg_data_p);
    bool native_set_dimension (int camfd);
    bool native_jpeg_encode (void);
    bool native_set_cfg(cam_ctrl_type type, int8_t data);
    bool native_set_parm(cam_ctrl_type type, uint16_t length, void *value);
    bool native_zoom_image(int fd, int srcOffset, int dstOffset, common_crop_t *crop);

    static wp<QualcommCameraHardware> singleton;

    /* These constants reflect the number of buffers that libmmcamera requires
       for preview and raw, and need to be updated when libmmcamera
       changes.
    */
    static const int kPreviewBufferCount = NUM_PREVIEW_BUFFERS;
    static const int kRawBufferCount = 1;
    static const int kJpegBufferCount = 1;

    int jpegPadding;

    CameraParameters mParameters;
    unsigned int frame_size;
    float mZoomValuePrev, mZoomValueCurr;
    unsigned char mZoomInitialized;
    bool mCameraRunning;
    Mutex mCameraRunningLock;
    bool mPreviewInitialized;

    // This class represents a heap which maintains several contiguous
    // buffers.  The heap may be backed by pmem (when pmem_pool contains
    // the name of a /dev/pmem* file), or by ashmem (when pmem_pool == NULL).

    struct MemPool : public RefBase {
        MemPool(int buffer_size, int num_buffers,
                int frame_size,
                const char *name);

        virtual ~MemPool() = 0;

        void completeInitialization();
        bool initialized() const {
            return mHeap != NULL && mHeap->base() != MAP_FAILED;
        }

        virtual status_t dump(int fd, const Vector<String16>& args) const;

        int mBufferSize;
        int mAlignedBufferSize;
        int mNumBuffers;
        int mFrameSize;
        sp<MemoryHeapBase> mHeap;
        sp<MemoryBase> *mBuffers;

        const char *mName;
    };

    struct AshmemPool : public MemPool {
        AshmemPool(int buffer_size, int num_buffers,
                   int frame_size,
                   const char *name);
    };

    struct PmemPool : public MemPool {
        PmemPool(const char *pmem_pool,
                 int control_camera_fd, int flags, int pmem_type,
                 int buffer_size, int num_buffers,
                 int frame_size,
                 const char *name);
        virtual ~PmemPool();
        int mFd;
        int mPmemType;
        int mCameraControlFd;
        uint32_t mAlignedSize;
        struct pmem_region mSize;
    };

    sp<PmemPool> mPreviewHeap;
    sp<PmemPool> mRecordHeap;
    sp<PmemPool> mThumbnailHeap;
    sp<PmemPool> mRawHeap;
    sp<PmemPool> mDisplayHeap;
    sp<AshmemPool> mJpegHeap;
    sp<PmemPool> mRawSnapShotPmemHeap;
    sp<AshmemPool> mRawSnapshotAshmemHeap;
    sp<PmemPool> mPostViewHeap;


    bool startCamera();
    bool initPreview();
    bool initRecord();
    void deinitPreview();
    bool initRaw(bool initJpegHeap);
    bool initRawSnapshot();
    void deinitRaw();
    void deinitRawSnapshot();

    bool mFrameThreadRunning;
    Mutex mFrameThreadWaitLock;
    Condition mFrameThreadWait;
    friend void *frame_thread(void *user);
    void runFrameThread(void *data);

    //720p recording video thread
    bool mVideoThreadExit;
    bool mVideoThreadRunning;
    Mutex mVideoThreadWaitLock;
    Condition mVideoThreadWait;
    friend void *video_thread(void *user);
    void runVideoThread(void *data);


    bool mShutterPending;
    Mutex mShutterLock;

    bool mSnapshotThreadRunning;
    Mutex mSnapshotThreadWaitLock;
    Condition mSnapshotThreadWait;
    friend void *snapshot_thread(void *user);
    void runSnapshotThread(void *data);
    Mutex mRawPictureHeapLock;

    void debugShowPreviewFPS() const;
    void debugShowVideoFPS() const;

    int mSnapshotFormat;
    void filterPictureSizes();
    void filterPreviewSizes();
    void storeTargetType();

    void initDefaultParameters();
    void findSensorType();

    status_t setPreviewSize(const CameraParameters& params);
    status_t setPreviewFrameRate(const CameraParameters& params);
    status_t setPictureSize(const CameraParameters& params);
    status_t setJpegQuality(const CameraParameters& params);
    status_t setAntibanding(const CameraParameters& params);
    status_t setEffect(const CameraParameters& params);
    status_t setAutoExposure(const CameraParameters& params);
    status_t setWhiteBalance(const CameraParameters& params);
    status_t setFlash(const CameraParameters& params);
    status_t setGpsLocation(const CameraParameters& params);
    status_t setRotation(const CameraParameters& params);
    status_t setZoom(const CameraParameters& params);
    status_t setFocusMode(const CameraParameters& params);
    status_t setBrightness(const CameraParameters& params);
    status_t setExposureCompensation(const CameraParameters& params);
    status_t setOrientation(const CameraParameters& params);
    status_t setLensshadeValue(const CameraParameters& params);
    status_t setISOValue(const CameraParameters& params);
    status_t setPictureFormat(const CameraParameters& params);
    status_t setSharpness(const CameraParameters& params);
    status_t setContrast(const CameraParameters& params);
    status_t setSaturation(const CameraParameters& params);
    void setGpsParameters();
    void storePreviewFrameForPostview();
    bool isValidDimension(int w, int h);

    Mutex mLock;
    Mutex mCamframeTimeoutLock;
    bool camframe_timeout_flag;
    bool mReleasedRecordingFrame;

    void receiveRawPicture(void);
    void receiveRawSnapshot(void);

    Mutex mCallbackLock;
    Mutex mOverlayLock;
	Mutex mRecordLock;
	Mutex mRecordFrameLock;
	Condition mRecordWait;
    Condition mStateWait;

    /* mJpegSize keeps track of the size of the accumulated JPEG.  We clear it
       when we are about to take a picture, so at any time it contains either
       zero, or the size of the last JPEG picture taken.
    */
    uint32_t mJpegSize;
    unsigned int        mPreviewFrameSize;
    unsigned int        mRecordFrameSize;
    int                 mRawSize;
    int                 mJpegMaxSize;

#if DLOPEN_LIBMMCAMERA
    void *libmmcamera;
#endif

    int mCameraControlFd;
#if 0
    int mCameraConfigFd;
#endif
    struct msm_camsensor_info mSensorInfo;
    cam_ctrl_dimension_t mDimension;
    bool mAutoFocusThreadRunning;
    Mutex mAutoFocusThreadLock;
    int mAutoFocusFd;

    Mutex mAfLock;

    pthread_t mCamConfigThread;
    pthread_t mFrameThread;
    pthread_t mVideoThread;
    pthread_t mSnapshotThread;

    common_crop_t mCrop;

    bool mInitialized;

    int mBrightness;
    int mHJR;
    struct msm_frame frames[kPreviewBufferCount];
    struct msm_frame *recordframes;
    bool *record_buffers_tracking_flag;
    bool mInPreviewCallback;
    bool mUseOverlay;
    sp<Overlay>  mOverlay;

    int32_t mMsgEnabled;    // camera msg to be handled
    notify_callback mNotifyCallback;
    data_callback mDataCallback;
    data_callback_timestamp mDataCallbackTimestamp;
    void *mCallbackCookie;  // same for all callbacks
    int mDebugFps;
    int kPreviewBufferCountActual;
    int previewWidth, previewHeight;
};

}; // namespace android

#endif
