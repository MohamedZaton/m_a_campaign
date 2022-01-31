
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/utils/send_mails_util.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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
  InAppWebViewController? _webViewController;

  @override
  void initState() {

  }

  @override
  Widget build(BuildContext context) {

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
          /// QR code  button
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
              : const SizedBox(
                  width: 4,
                ),
          const SizedBox(
            width: 10,
          )
        ],
      ),

      body: isHtmlLocal
          ?
        InAppWebView(
          initialFile:webfileLogic.htmlPath.value ,
          onReceivedServerTrustAuthRequest: (controller, challenge) async {
            print(challenge);
            controller.android.clearSslPreferences();
            return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
          },
          onWebViewCreated: (InAppWebViewController controller) {
            _webViewController = controller;
          },

        ) : Obx(() {
        return Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: Uri.parse(webfileLogic.htmlPath.value)),
              onReceivedServerTrustAuthRequest: (controller, challenge) async {
                controller.android.clearSslPreferences();
                return ServerTrustAuthResponse(action: ServerTrustAuthResponseAction.PROCEED);
              },
              onWebViewCreated: (controller) {
                webfileLogic.isLoading.value=false;
              },
              onProgressChanged: (controller, progress) {
                print("progress == $progress") ;
                if(progress>=100){
                  webfileLogic.isLoading.value=false;
                }else{
                  webfileLogic.isLoading.value=true;
                }

              },
            ),
            webfileLogic.isLoading.value
                ? Center(
              child: CircularProgressIndicator(),
            ) : Stack(),
          ],
        );
            }),

    );
  }
}
