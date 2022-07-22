import 'package:flutter/material.dart';

class TaskButton extends StatelessWidget {
  final String buttonText;
  final IconData icon;
  final Color backgroundColor;
  final void Function()? action;
  final double margin;
  final double width;
  final double fontSize;
  final double iconSize;
  final Color colorText;
  final Color iconColor;

  TaskButton({
    this.buttonText = 'Text',
    this.backgroundColor = const Color(0XFFE2EAFC),
    this.icon = Icons.ac_unit,
    this.action,
    this.margin = 20.0,
    this.width = 100.0,
    this.fontSize = 16.0,
    this.iconSize = 14.0,
    this.colorText = const Color(0XFFFFFCF2),
    this.iconColor = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Icon(icon, size: 16, color: iconColor),
            SizedBox(width: 5.0),
            Text(
              buttonText,
              style: TextStyle(
                fontSize: fontSize,
                color: colorText,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          color: backgroundColor.withOpacity(1),
        ),

        width: width,
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        margin: EdgeInsets.symmetric(horizontal: margin),
      ),
    );
  }
}