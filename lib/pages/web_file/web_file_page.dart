import 'dart:convert';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/utils/send_mails_util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'web_file_logic.dart';

class WebFilePage extends StatefulWidget {
  static const String id = '/web_file_page';

  WebFilePage({Key? key}) : super(key: key);

  @override
  State<WebFilePage> createState() => _WebFilePageState();
}

class _WebFilePageState extends State<WebFilePage> {
  final GlobalKey<FormState> _formSharetKey = GlobalKey<FormState>();

  TextEditingController emailCtr = TextEditingController();

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    final webfileLogic = Get.put(WebFileLogic());
    bool isHtmlLocal = webfileLogic.htmlPath.value.contains(".html");
    String title = webfileLogic.title.value;
    webfileLogic.isLoading.value = true;

    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        title: Center(child: Text(title)),
        actions: [
          /// share button
          InkWell(
            onTap: () async {
              Get.bottomSheet(Container(
                color: Colors.white,
                width: ScreenMobile.width(context),
                height: ScreenMobile.heigth(context) * 0.3,
                child: Form(
                  key: _formSharetKey,
                  child: Padding(
                    padding: const EdgeInsets.all(1.8),
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.02,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "E-mail :",
                              style: kTitleTextStyle,
                            ),
                          ],
                        ),

                        const Text(
                          "Please write your email address to received this website",
                          style: kDetailsTxtStyle,
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.02,
                        ),

                        /// email field
                        TextFormField(
                          controller: emailCtr,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: kEmailTxt,
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(),
                          ),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required ';
                            } else if (!GetUtils.isEmail(value)) {
                              return 'Please enter a valid E-mail Address';
                            } else {}
                          },
                        ),
                        SizedBox(
                          height: ScreenMobile.width(context) * 0.05,
                        ),

                        /// Register Form
                        ElevatedButton(
                          onPressed: () {
                            if (_formSharetKey.currentState!.validate()) {
                              print("valid Form True");
                              // SendMailsUtil.sendSmtpGmail(
                              //     emailCtr.text, webfileLogic.htmlPath.value);
                              SendMailsUtil.sendShareNotification(
                                  emailCtr.text, webfileLogic.htmlPath.value);
                              Get.back();
                              Get.snackbar(
                                "Success ",
                                "Please check your email",
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                              );
                            } else {
                              print("vaild F FF");
                              Get.back();
                            }
                          },
                          child: Text(
                            kSendTxt,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kLightPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // <-- Radius
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
            },
            child: Icon(Icons.share_outlined),
          ),
          SizedBox(
            width: 10,
          ),
          // qr button
          !isHtmlLocal
              ? InkWell(
                  onTap: () async {
                    Get.bottomSheet(Container(
                      color: Colors.white,
                      width: ScreenMobile.width(context),
                      height: ScreenMobile.heigth(context) * 0.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 2,
                          ),
                          QrImage(
                            data: webfileLogic.htmlPath.value,
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Scan ",
                            style: TextStyle(
                                color: kLightAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Wrap(children: [
                            Text(
                              "The QR Code to visit  Website ",
                              style: kTitleTextStyle.copyWith(fontSize: 10),
                            )
                          ]),
                          Text(
                            "Steps : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: kLightAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "1. Open the QR Code reader or the camera on your phone.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: kDarkGray,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "2. Then point your  phone at the QR code to scan it.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: kDarkGray,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            "3. Finally, tap the pop-up banner or button.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: kDarkGray,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ));
                  },
                  child: Icon(Icons.qr_code),
                )
              : SizedBox(
                  width: 4,
                ),
          SizedBox(
            width: 10,
          )
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
          : Obx(() {
              return Stack(
                children: [
                  WebView(
                    initialUrl: Uri.encodeFull(webfileLogic.htmlPath.value),
                    onPageFinished: (url) {
                      webfileLogic.isLoading.value = false;
                    },
                    onProgress: (progress) {
                      webfileLogic.isLoading.value = true;
                    },
                    onWebResourceError: (error) {
                      print("[zt] Webview error type : ${error.errorType}");
                      print("[zt] Webview error code : ${error.errorCode}");
                      print(
                          "[zt] Webview error description : ${error.description}");
                    },
                    javascriptMode: JavascriptMode.unrestricted,
                  ),
                  webfileLogic.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Stack(),
                ],
              );
            }),
    );
  }
}
