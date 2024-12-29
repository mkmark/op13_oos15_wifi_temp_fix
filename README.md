# op13_oos15_wifi_temp_fix

> [!IMPORTANT]  
> ONEPLUS13_COS_TO_OOS_v2.5.zip by the [guide](https://xdaforums.com/t/pjz110-coloros-to-oxygenos-cph2653gdpr_11_15-0-0-305ex01.4707431) has fixed this issue, no need to flash this module any more.

Magisk module to fix OnePlus 13 crash reboot, typically when locked and wandering between Wifi access points.

Only for OnePlus 13 installing Oxygen OS 15 following `https://xdaforums.com/t/pjz110-coloros-to-oxygenos-cph2653gdpr_11_15-0-0-305ex01.4707431` using ONEPLUS13_COS_TO_OOS_v2.0.zip.

## dev log

`adb logcat` to identify the cause of system crash.

```log
E AndroidRuntime: *** FATAL EXCEPTION IN SYSTEM PROCESS: WifiHandlerThread
E AndroidRuntime: java.lang.NoSuchMethodError: No interface method getEstimatedPercentInternetAvailability()I in class Lcom/android/server/wifi/WifiCandidates$Candidate; or its super classes (declaration of 'com.android.server.wifi.WifiCandidates$Candidate' appears in /apex/com.android.wifi/javalib/service-wifi.jar)
```

Note that without flashing the 4 imgs (Flash Carrier and Region Files step in the guide) there won't be a crash, so the issue comes from incompatibility between the 4 imgs and `/apex/com.android.wifi`.

[koaaN told me he made the 4 imgs by extracting from cos](https://xdaforums.com/t/pjz110-coloros-to-oxygenos-cph2653gdpr_11_15-0-0-305ex01-v2-5.4707431/post-89853201), so in theory a cooresponding `/apex/com.android.wifi` from cos will be compatible.

Find `HYBRID_COS_OP13_CN.zip/HYBRID_COS_OP13_CN/super.img/system_a.img/system/apex/com.android.wifi.apex/apex_payload.img/javalib/service-wifi.jar` to be different from `/apex/com.android.wifi/javalib/service-wifi.jar`, so the job is to replace the `com.android.wifi` with the cos version found.

Learn that [apex are dynamically mounted after boot but before magisk is ran](https://github.com/topjohnwu/Magisk/issues/3008), but won't be loaded until after magisk post-fs-data, so the plan is to make a magisk module so that "directly replace the files in the apex folder after it is mounted" as suggested by github.com/topjohnwu.
