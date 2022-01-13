import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebViewWidget extends StatelessWidget {
  final bool isConnectWeb;
  final String? webURL;
  final bool isAppBar;
  const CustomWebViewWidget(
      {Key? key,
      this.isConnectWeb = false,
      @required this.webURL,
      this.isAppBar = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    print("click_web_view : " + webURL!);
    Size size = MediaQuery.of(context).size;
    if (isConnectWeb) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: isAppBar
            ? AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: kLightPrimary),
                  onPressed: () => Get.back(),
                ),
              )
            : PreferredSize(
                preferredSize: Size(0.0, 0.0),
                child: Container(),
              ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: WebView(
                  initialUrl: webURL,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image(
                      image: AssetImage("assets/icons/disconnected.png"),
                      width: 50,
                      height: 50,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Center(child: Text("Connecting network")),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
