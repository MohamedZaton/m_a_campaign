import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:m_a_camping/widgets/outline_btn_widget.dart';
import 'package:m_a_camping/widgets/trapezium_shape_widget.dart';

class HomeItemWgt extends StatelessWidget {
  final String infoText;
  final String? imagePath;
  final Function()? onPress;
  final bool? isRight;

  const HomeItemWgt(
      {Key? key,
      required this.infoText,
      this.imagePath = "assets/images/item_a.png",
      required this.onPress,
      this.isRight = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Stack(
        children: [
          Pic(imagePath!),
          Info(infoText, isRight!),
        ],
      ),
    );
  }

  Widget Pic(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerRight,
          fit: BoxFit.cover,
          image: AssetImage(imagePath),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String? infoText;
  final bool isRight;
  Info(
    this.infoText,
    this.isRight, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment:
            isRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 6 / 15),
            child: Text(
              infoText!,
              softWrap: true,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          OutLineBtnWgt()
        ],
      ),
    );
  }
}
