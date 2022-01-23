import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/pages/home/home_logic.dart';
import 'package:m_a_camping/pages/home/home_view.dart';
import 'package:m_a_camping/pages/register/register_logic.dart';
import 'package:m_a_camping/pages/register/register_view.dart';
import 'package:m_a_camping/pages/web_file/web_file_browser.dart';
import 'package:m_a_camping/pages/web_file/web_file_logic.dart';
import 'package:m_a_camping/pages/web_file/web_file_page.dart';
import 'package:m_a_camping/themes/light_theme.dart';
import 'dart:ui' as ui;
import 'dart:html';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();

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
              page: () => kIsWeb ? WebFileBrowser() : WebFilePage(),
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
