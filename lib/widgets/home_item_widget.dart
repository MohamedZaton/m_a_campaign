import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:m_a_camping/models/home_item_model.dart';
import 'package:m_a_camping/pages/register/register_view.dart';
import 'package:m_a_camping/pages/web_file/web_file_logic.dart';
import 'package:m_a_camping/pages/web_file/web_file_page.dart';
import 'package:m_a_camping/utils/screens.dart';

class HomeItemWgt extends StatelessWidget {
  final HomeItemModel homeItemModel;
  const HomeItemWgt({
    Key? key,
    required this.homeItemModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;
    final webfileLogic = Get.put(WebFileLogic());

    return InkWell(
      onTap: () {
        String goPath = homeItemModel.htmlGoPath!;
        String getTitle = homeItemModel.labelName!;

        webfileLogic.title.value = getTitle;

        if (goPath.isNotEmpty) {
          if (goPath.toString().contains(".html")) {
            webfileLogic.htmlPath.value = goPath;
            Get.to(WebFilePage());
          } else if (goPath.contains(RegisterPage.id)) {
            Get.to(RegisterPage());
          } else if (goPath.toString().contains("www")) {
            webfileLogic.htmlPath.value = goPath;

            Get.to(WebFilePage());
          }
        }
      },
      child: Column(
        children: [
          Pic(homeItemModel.iconPath!, ctx),
          const SizedBox(
            height: 2,
          ),
          Info(homeItemModel.labelName!),
        ],
      ),
    );
  }

  Widget Pic(String imagePath, BuildContext ctx) {
    return Container(
      width: ScreenMobile.width(ctx) * 0.20,
      height: ScreenMobile.width(ctx) * 0.20,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage(imagePath),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String? infoText;

  Info(
    this.infoText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 6 / 15),
          child: Text(
            infoText!,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
