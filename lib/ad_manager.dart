import 'dart:io';

class AdManager {
  
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/2247696110"; // these are dummy id's
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/2247696110"; 
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

}