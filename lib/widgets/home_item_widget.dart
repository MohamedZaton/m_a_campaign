import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m_a_camping/utils/screens.dart';
import 'package:m_a_camping/widgets/outline_btn_widget.dart';
import 'package:m_a_camping/widgets/trapezium_shape_widget.dart';

class HomeItemWgt extends StatelessWidget {
  final String infoText;
  final String? imagePath;
  final Function()? onPress;

  const HomeItemWgt({
    Key? key,
    required this.infoText,
    this.imagePath = "assets/icons/m_a_logo.png",
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ctx = context;
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          Pic(imagePath!, ctx),
          const SizedBox(
            height: 2,
          ),
          Info(infoText),
        ],
      ),
    );
  }

  Widget Pic(String imagePath, BuildContext ctx) {
    return Container(
      width: ScreenMobile.width(ctx) * 0.25,
      height: ScreenMobile.width(ctx) * 0.25,
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
                ?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
