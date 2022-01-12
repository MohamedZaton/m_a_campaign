import 'package:flutter/material.dart';
import 'package:m_a_camping/widgets/trapezium_shape_widget.dart';

class HomeItemWgt extends StatelessWidget {
  final String infoText;
  final String? imagePath;
  final Function()? onPress;

  const HomeItemWgt(
      {Key? key,
      required this.infoText,
      this.imagePath =
          'https://media.sproutsocial.com/uploads/2014/02/Facebook-Campaign-Article-Main-Image2.png',
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Pic(imagePath!),
            Info(infoText),
          ],
        ),
      ),
    );
  }

  Widget Pic(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.centerRight,
          fit: BoxFit.fitHeight,
          image: NetworkImage(imagePath),
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String? infoText;
  Info(this.infoText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TrapeziumClipper(),
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width * 3 / 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            OutlinedButton(
              onPressed: () {},
              child: Text('Learn More'),
            )
          ],
        ),
      ),
    );
  }
}
