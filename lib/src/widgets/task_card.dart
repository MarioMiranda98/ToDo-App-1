import 'package:flutter/material.dart';

class TaksCard extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;
  final String taskStatus;
  final IconData icon;
  final void Function()? action;
  
  // ignore: prefer_const_constructors_in_immutables
  TaksCard({
    this.taskTitle = 'Sin Titulo',
    this.taskDescription = 'No Disponible',
    this.taskStatus = '',
    this.action, 
    this.icon = Icons.abc_outlined,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: action,
      child: Container(
        height: screenSize.height * 0.2,
        width: screenSize.width * 0.8,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: screenSize.width * 0.05),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40.0),
              child: Icon(
                icon,
                size: 50.0,
                color: theme.colorScheme.primary,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget> [
                _buildText(
                  text: taskTitle, color: theme.colorScheme.primary,
                  fontSize: screenSize.width * 0.075, fontWeight: theme.primaryTextTheme.bodyText2!.fontWeight!,
                  textAlign: TextAlign.center, screenSize: screenSize
                ),
                _buildText(
                  text: taskDescription, color: theme.colorScheme.primary,
                  fontSize: screenSize.width * 0.05, fontWeight: theme.primaryTextTheme.bodyText1!.fontWeight!,
                  textAlign: TextAlign.center, screenSize: screenSize
                ),
                _buildText(
                  text: 'Estatus: $taskStatus', color: theme.colorScheme.primary,
                  fontSize: screenSize.width * 0.05, fontWeight: theme.primaryTextTheme.bodyText1!.fontWeight!,
                  textAlign: TextAlign.center, screenSize: screenSize
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText({String text = '', double fontSize = 5.0, FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black, TextAlign textAlign = TextAlign.left, Size screenSize = const Size(0.0, 0.0)}) => 
    Flexible(
      child: SizedBox(
        width: screenSize.width * 0.67,
        child: Text(
          text, 
          style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign,
        ),
      ),
    );
}