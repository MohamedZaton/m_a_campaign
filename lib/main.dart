import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/pages/home/home_logic.dart';
import 'package:m_a_camping/pages/home/home_view.dart';
import 'package:m_a_camping/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
      ],
    );
  }
}
