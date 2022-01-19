import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/utils/send_mails_util.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'web_file_logic.dart';

class WebFilePage extends StatelessWidget {
  static const String id = '/web_file_page';

  WebFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    final webfileLogic = Get.put(WebFileLogic());
    bool isHtmlLocal = webfileLogic.htmlPath.value.contains(".html");
    String title = webfileLogic.title.value;

    return Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          title: Center(child: Text(title)),
          actions: [
            InkWell(
                onTap: () async {
                  SendMailsUtil.sendSmtpGmail("mohamed.zaytoun@pclink-alx.com",
                      webfileLogic.htmlPath.value);
                },
                child: Icon(Icons.share_outlined)),
          ],
        ),
        // webView controll
        body: isHtmlLocal
            ? WebView(
                initialUrl: 'about:blank',
                onWebViewCreated: (WebViewController webViewController) {
                  _controller = webViewController;
                  print("ggettx = " + webfileLogic.htmlPath.value);
                  webfileLogic.loadHtmlFromAssets(
                      _controller, webfileLogic.htmlPath.value);
                },
              )
            : WebView(
                initialUrl: webfileLogic.htmlPath.value,
                javascriptMode: JavascriptMode.unrestricted,
              ));
  }
}
