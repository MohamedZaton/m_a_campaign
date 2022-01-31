import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/models/persion_model.dart';
import 'package:m_a_camping/pages/home/home_logic.dart';
import 'package:m_a_camping/pages/home/home_view.dart';
import 'package:m_a_camping/pages/register/register_logic.dart';
import 'package:m_a_camping/pages/register/register_view.dart';
import 'package:m_a_camping/pages/web_file/web_file_logic.dart';
import 'package:m_a_camping/pages/web_file/web_file_page.dart';
import 'package:m_a_camping/themes/light_theme.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:universal_platform/universal_platform.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // this for
  if (UniversalPlatform.isAndroid) {
    HttpOverrides.global = MyHttpOverrides();
  }

  await Firebase.initializeApp();

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        width: kIsWeb ? 400 : double.infinity,
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'M&A',
          theme: buildLightTheme(),
          initialRoute: HomePage.id,
          getPages: [
            GetPage(
              name: HomePage.id,
              page: () => HomePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<HomeLogic>(() => HomeLogic());
              }),
            ),
            GetPage(
              name: WebFilePage.id,
              page: () =>  WebFilePage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<WebFileLogic>(() => WebFileLogic());
              }),
            ),
            GetPage(
              name: RegisterPage.id,
              page: () => RegisterPage(),
              binding: BindingsBuilder(() {
                Get.lazyPut<RegisterLogic>(() => RegisterLogic());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
