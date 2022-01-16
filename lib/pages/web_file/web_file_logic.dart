import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFileLogic extends GetxController {
  final htmlPath =
      'assets/mails_shot/Claim your free headset sample for education today!.html'
          .obs;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
