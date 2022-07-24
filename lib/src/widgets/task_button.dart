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

  // ignore: prefer_const_constructors_in_immutables
  TaskButton({
    this.action,
    this.icon = Icons.ac_unit,
    this.iconColor = Colors.black,
    this.iconSize = 16.0,
    this.buttonText = 'Text',
    this.fontSize = 16.0,
    this.colorText = const Color(0XFFFFFCF2),
    this.backgroundColor = const Color(0XFF2B2D42),
    this.width = 100.0,
    this.margin = 20.0,
    Key? key
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        // ignore: sort_child_properties_last
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Icon(icon, size: iconSize, color: iconColor),
            const SizedBox(width: 5.0),
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