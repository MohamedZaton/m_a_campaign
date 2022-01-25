import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/utils/send_mails_util.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:ui' as ui;
import 'dart:html';
import 'web_file_logic.dart';

class WebFileBrowser extends StatelessWidget {
  static const String id = '/web_file_page';
  final GlobalKey<FormState> _formSharetKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();

  WebFileBrowser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController _controller;

    final webfileLogic = Get.put(WebFileLogic());
    bool isHtmlLocal = webfileLogic.htmlPath.value.contains(".html");
    String title = webfileLogic.title.value;
    webfileLogic.isLoading.value = true;
    ui.platformViewRegistry.registerViewFactory(
        'test-view-type',
        (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = "https://www.youtube.com/embed/5VbAwhBBHsg"
          ..style.border = 'none');
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
        title: Center(child: Text(title)),
        actions: [
          InkWell(
              onTap: () async {
                // SendMailsUtil.sendSmtpGmail("mohamed.zaytoun@pclink-alx.com",
                //     webfileLogic.htmlPath.value);
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
                            "Please write your email address to receive this mailing ",
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
                              } else {
                                print("vaild F FF");
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
          : Obx(() {
              return Stack(
                children: [
                  WebView(
                    initialUrl: webfileLogic.htmlPath.value,
                    javascriptMode: JavascriptMode.disabled,
                    onPageFinished: (url) {
                      webfileLogic.isLoading.value = false;
                    },
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
