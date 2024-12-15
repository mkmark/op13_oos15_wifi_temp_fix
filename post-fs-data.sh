#!/system/bin/sh
MODDIR=${0%/*}
mount --bind $MODDIR/com.android.wifi/ /apex/com.android.wifi/
