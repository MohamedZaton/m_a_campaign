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

    final viewModel = Get.put(WebFileLogic());

    return Scaffold(
        backgroundColor: kBackGroundColor,
        appBar: AppBar(
          title: Center(
              child: Image.asset(
            "assets/images/logo.png",
            scale: 5,
          )),
          actions: [
            InkWell(
                onTap: () async {
                  SendMailsUtil.sendSmtpGmail("mohamed.zaytoun@pclink-alx.com",
                      viewModel.htmlPath.value);
                },
                child: Icon(Icons.share_outlined)),
          ],
        ),
        body: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            print("ggettx = " + viewModel.htmlPath.value);
            loadHtmlFromAssets(_controller, viewModel.htmlPath.value);
          },
        ));
  }

  loadHtmlFromAssets(
      WebViewController webViewController, String htmlPath) async {
    String fileText = await rootBundle.loadString(htmlPath);
    webViewController.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
