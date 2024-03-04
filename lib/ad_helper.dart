import 'package:easy_audience_network/easy_audience_network.dart';
import 'package:flutter/material.dart';

class AdHelper {
  static void initialize() {
    EasyAudienceNetwork.init(
      // testingId: "b602d594afd2b0b327e07a06f36ca6a7e42546d0",
      testMode: true,
    );
  }


  static Widget getNativeBannerAd() {
    return NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: NativeAdListener(
        onError: (code, message) => print('error'),
        onLoaded: () => print('loaded'),
        onClicked: () => print('clicked'),
        onLoggingImpression: () => print('logging impression'),
        onMediaDownloaded: () => print('media downloaded'),
      ),
    );
  }

  static InterstitialAd getInterstitialAd() {
    final interstitialAd = InterstitialAd(InterstitialAd.testPlacementId);
    interstitialAd.listener = InterstitialAdListener(
      onLoaded: () {
        interstitialAd.show();
      },
      onDismissed: () {
        interstitialAd.destroy();
        print('Interstitial dismissed');
      },
    );
    interstitialAd.load();
    return interstitialAd;
  }


  static Widget getNativeAd() {
    return NativeAd(
      placementId: NativeAd.testPlacementId,
      adType: NativeAdType.NATIVE_AD,
      width: double.infinity,
      height: 200,
      keepAlive: true,
      keepExpandedWhileLoading: false,
      expandAnimationDuraion: 300,
      listener: NativeAdListener(
        onError: (code, message) => print('error'),
        onLoaded: () => print('loaded'),
        onClicked: () => print('clicked'),
        onLoggingImpression: () => print('logging impression'),
        onMediaDownloaded: () => print('media downloaded'),
      ),
    );
  }
}
