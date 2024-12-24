import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:linked_in/theme/styles.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.withBackground,
    this.onPress,
    this.image,
    this.withImage = false,
  });
  final String title;
  final String? image;
  final bool withBackground;
  final bool? withImage;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
            side: withBackground == true
                ? null
                : WidgetStateProperty.all(BorderSide(color: Colors.black)),
            minimumSize: WidgetStateProperty.all(Size.fromHeight(45)),
            backgroundColor: WidgetStateProperty.all(
              withBackground == true ? linkedInBlue0077B5 : Colors.white,
            )),
        child: withImage == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 7,
                children: [
                  SvgPicture.asset(image!, width: 30),
                  Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          color: withBackground == true
                              ? Colors.white
                              : Colors.black))
                ],
              )
            : Text(title,
                style: TextStyle(
                    fontSize: 18,
                    color:
                        withBackground == true ? Colors.white : Colors.black)));
  }
}
