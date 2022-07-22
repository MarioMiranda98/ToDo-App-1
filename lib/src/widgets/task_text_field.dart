import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  final String textFieldTitle;
  
  TaskTextField({
    this.textFieldTitle = 'Input Text'
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isDense: true,
          //errorText: errorModel.name,
          labelText: textFieldTitle,
          labelStyle:
              TextStyle(color: Colors.grey, fontSize: screenSize.height * 0.020),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: const Color(0xFF8492A6).withOpacity(0.5),
            ),
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: screenSize.height * 0.020),
        keyboardType: TextInputType.text,
      ),
    );
  }
}