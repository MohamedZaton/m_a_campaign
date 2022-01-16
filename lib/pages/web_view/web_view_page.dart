import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:m_a_camping/utils/MyConnectivity.dart';
import 'package:m_a_camping/widgets/webview_widget.dart';

class DetailsWebViewPage extends StatefulWidget {
  static String id = "Details";
  final String webURL;
  final bool isAppBar;
  const DetailsWebViewPage(
      {Key? key, required this.webURL, this.isAppBar = true})
      : super(key: key);
  @override
  _DetailsWebViewPageState createState() => _DetailsWebViewPageState();
}

class _DetailsWebViewPageState extends State<DetailsWebViewPage> {
  late String _webURL;
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  get isAppBar => widget.isAppBar;

  @override
  void initState() {
    super.initState();
    _webURL = widget.webURL;
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isConnectState = true;
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        isConnectState = false;
        break;
      case ConnectivityResult.mobile:
        isConnectState = true;
        break;
      case ConnectivityResult.wifi:
        isConnectState = true;
    }

    return CustomWebViewWidget(
      isConnectWeb: isConnectState,
      webURL: _webURL,
      isAppBar: isAppBar,
    );
  }
}
