import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/pages/register/register_logic.dart';
import 'package:m_a_camping/utils/screens.dart';

import 'package:m_a_camping/widgets/background_widget.dart';

import 'home_logic.dart';

class HomePage extends StatelessWidget {
  static const String id = "/home_page";

  final homeLogic = Get.put(HomeLogic());
  final registerLogic = Get.put(RegisterLogic());

  @override
   build(BuildContext context)  {
    final size = MediaQuery.of(context).size;
    // // Initialize Firebase.
    // await Firebase.initializeApp();
    return Scaffold(
      body: Stack(
        children: [
          BackGroundWgt(
            imageBgPath: "assets/images/main_bkgd_2.png",
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height:ScreenMobile.width(context)*0.02,
                ),
                Container(
                  width: ScreenMobile.width(context),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icons/logo_line_2.png",
                        scale: 4,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4,
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
