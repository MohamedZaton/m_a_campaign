import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:m_a_camping/tools/colors.dart';

class CustomWebViewWidget extends StatelessWidget {
  final bool isConnectWeb;
  final String webURL;
  final bool isAppBar;
  const CustomWebViewWidget(
      {Key? key,
      this.isConnectWeb = false,
      required this.webURL,
      this.isAppBar = true})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    print("click_web_view : " + webURL);
    Size size = MediaQuery.of(context).size;
    if (isConnectWeb) {
      return Scaffold(
        body: WebviewScaffold(
          appBar: AppBar(
            title: Center(
                child: Image.asset(
              "assets/images/logo.png",
              scale: 5,
            )),
          ),
          ignoreSSLErrors: true,
          url: webURL,
          initialChild: Container(
            color: kBackGroundColor,
            child: Center(
                child: SpinKitCubeGrid(
              color: kLightPrimary,
            )),
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
