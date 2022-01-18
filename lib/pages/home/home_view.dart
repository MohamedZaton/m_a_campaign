import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/pages/register/register_logic.dart';
import 'package:m_a_camping/pages/register/register_view.dart';
import 'package:m_a_camping/pages/web_file/web_file_page.dart';
import 'package:m_a_camping/pages/web_view/web_view_page.dart';
import 'package:m_a_camping/tools/colors.dart';
import 'package:m_a_camping/tools/constants.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/widgets/background_widget.dart';
import 'package:m_a_camping/widgets/home_item_widget.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final homeLogic = Get.put(HomeLogic());
  final registerLogic = Get.put(RegisterLogic());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          BackGroundWgt(),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icons/logo_line.png",
                      scale: 5,
                    )
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      child: Obx(() {
                        if (homeLogic.isLoading.value) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return AlignedGridView.count(
                            crossAxisCount: 3,
                            itemCount: homeLogic.mainItemList.length,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            itemBuilder: (context, index) {
                              return homeLogic.mainItemList[index];
                            },
                          );
                        }
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
