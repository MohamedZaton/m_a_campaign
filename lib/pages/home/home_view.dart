import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/pages/register/register_logic.dart';
import 'package:m_a_camping/pages/register/register_view.dart';
import 'package:m_a_camping/pages/web_file/web_file_page.dart';
import 'package:m_a_camping/pages/web_view/web_view_page.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/widgets/home_item_widget.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final logic = Get.put(HomeLogic());
  final register_logic = Get.put(RegisterLogic());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Image.asset(
          "assets/images/logo.png",
          scale: 5,
        )),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: size.height * 0.20,
              child: HomeItemWgt(
                onPress: () {},
                infoText: "M&A Technology Website",
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: size.height * 0.20,
              child: const HomeItemWgt(
                onPress: null,
                isRight: true,
                imagePath: "assets/images/item_b.png",
                infoText: "EduBuyer Website",
              )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: size.height * 0.20,
              child: HomeItemWgt(
                onPress: () {
                  Get.to(() => WebFilePage());
                },
                imagePath: "assets/images/item_c.png",
                infoText: "Test mails html",
              )),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(RegisterPage());
            },
            child: Text(
              'Register Now',
              style:
                  TextStyle(color: kLightPrimary, fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: kCyanColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
            ),
          )
        ],
      ),
    );
  }
}
