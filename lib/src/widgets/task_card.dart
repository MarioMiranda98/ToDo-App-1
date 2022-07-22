import 'package:flutter/material.dart';

class TaksCard extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskStatus;
  final void Function()? action;
  
  TaksCard({
    this.taskTitle = 'Sin Titulo',
    this.taskDescription = 'No Disponible',
    this.taskStatus = '',
    this.action, 
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: action,
      child: Container(
        height: 135.0,
        width: screenSize.width * 0.9,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: screenSize.width * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color:Colors.black12,
              blurRadius: 3,
              spreadRadius: 3,
            )
          ],
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget> [
            _buildText(
              text: taskTitle, color: Theme.of(context).primaryColor,
              fontSize: 18.0, fontWeight: FontWeight.bold,
              textAlign: TextAlign.center
            ),
            _buildText(
              text: taskDescription, color: Colors.black,
              fontSize: 16.0, fontWeight: FontWeight.w100,
              textAlign: TextAlign.center
            ),
            _buildText(
              text: 'Estatus: $taskStatus', color: Colors.black,
              fontSize: 14.0, fontWeight: FontWeight.w100,
              textAlign: TextAlign.center
            ),
            Container(
              width: screenSize.width,
              margin: const EdgeInsets.only(right: 20.0, bottom: 10.0),
              alignment: Alignment.bottomRight,
              child: const Icon(
                Icons.touch_app,
                size: 18
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildText({String text = '', double fontSize = 5.0, FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black, TextAlign textAlign = TextAlign.left}) => 
    Text(
      text, 
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight
      ),
      textAlign: textAlign,
    );
}