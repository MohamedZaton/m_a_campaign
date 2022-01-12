import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/widgets/home_item_widget.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("M&A"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
                height: 150,
                child: HomeItemWgt(
                  onPress: null,
                  infoText: "M&A Technology Website",
                )),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
                height: 150,
                child: HomeItemWgt(
                  onPress: null,
                  infoText: "M&A Technology Website",
                )),
            SizedBox(
              height: 10,
            ),
            const SizedBox(
                height: 150,
                child: HomeItemWgt(
                  onPress: null,
                  infoText: "M&A Technology Website",
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Register Now',
                style: TextStyle(
                    color: kLightPrimary, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
