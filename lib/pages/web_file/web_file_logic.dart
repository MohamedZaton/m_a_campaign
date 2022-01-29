import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebFileLogic extends GetxController {
  final htmlPath =
      'assets/mails_shot/Claim your free headset sample for education today!.html'
          .obs;
  final title = "".obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    print("getx[WebFile] call  onInit  ");
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  loadHtmlFromAssets(
      WebViewController webViewController, String htmlPath) async {
    String fileText = await rootBundle.loadString(htmlPath);
    webViewController.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
