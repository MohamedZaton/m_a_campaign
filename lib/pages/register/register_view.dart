import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/tools/styles.dart';
import 'package:m_a_camping/utils/screens.dart';

import 'register_logic.dart';

class RegisterPage extends StatelessWidget {
  static const String id = '/register_page';

  final register_logic = Get.put(RegisterLogic());

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/main_bkgd.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenMobile.width(context) * 0.05,
            ),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        kRegisterTxt,
                        style: kTitleTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
