# op13_oos15_wifi_temp_fix

Fix OnePlus 13 crash reboot, typically when locked and wandering between Wifi access points.

Only for OnePlus 13 installing Oxygen OS 15 following `https://xdaforums.com/t/pjz110-coloros-to-oxygenos-cph2653gdpr_11_15-0-0-305ex01.4707431/page-5`

Fix the following crash by replacing `/apex/com.android.wifi` with Color OS 15 version.

```log
E AndroidRuntime: *** FATAL EXCEPTION IN SYSTEM PROCESS: WifiHandlerThread
E AndroidRuntime: java.lang.NoSuchMethodError: No interface method getEstimatedPercentInternetAvailability()I in class Lcom/android/server/wifi/WifiCandidates$Candidate; or its super classes (declaration of 'com.android.server.wifi.WifiCandidates$Candidate' appears in /apex/com.android.wifi/javalib/service-wifi.jar)
```
