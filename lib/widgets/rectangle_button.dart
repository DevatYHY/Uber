import 'package:flutter/material.dart';


class RectangleButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Color disabledColor;
  final EdgeInsets padding;
  final Function onPressed;
  final Widget child;
  final bool isCircle;
  final double minimumWidth;
  final double minimumHeight;

  const RectangleButton({
    Key key,
    this.text = '',
    this.fontSize = 20,
    this.color,
    this.disabledColor,
    this.padding = const EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 80,
    ),
    this.onPressed,
    this.isCircle = false,
    this.minimumWidth = 0,
    this.minimumHeight = 0,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize:
        MaterialStateProperty.all<Size>(Size(minimumWidth, minimumHeight)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledColor;
            }
            return color;
          },
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          isCircle
              ? CircleBorder()
              : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.1),
          ),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(padding),
        elevation: MaterialStateProperty.all<double>(1.5),
      ),
      onPressed: onPressed,
      child: text.isNotEmpty ? Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.white,
        ),
      ) : child,
    );
  }
}