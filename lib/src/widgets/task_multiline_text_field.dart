import 'package:flutter/material.dart';

class TaskMultilineTextField extends StatelessWidget {
  final String textFieldTitle;
  final TextEditingController? controller;
  
  TaskMultilineTextField({
    this.textFieldTitle = 'Input Text',
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isDense: true,
          labelText: textFieldTitle,
          labelStyle:
              TextStyle(
                color:  theme.colorScheme.primary,
                fontSize: 26.0
              ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: theme.colorScheme.primary.withOpacity(0.5),
            ),
          ),
        ),
        style: TextStyle(color: Colors.black, fontSize: screenSize.height * 0.020),
        keyboardType: TextInputType.text,
        maxLines: null,
        maxLength: 200,
      ),
    );
  }
}