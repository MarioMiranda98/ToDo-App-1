
import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';

class TaskModal extends StatelessWidget {
  final String assetUrl;
  final String modalText;
  final bool isConfirm;
  final void Function()? action;
  final void Function()? actionCancel;

  // ignore_for_file: prefer_const_constructors_in_immutables
  TaskModal({
    this.assetUrl = '',
    this.modalText = 'Sin Texto',
    this.isConfirm = false,
    this.action,
    this.actionCancel,
    Key? key
  }): super(key: key);

  @override 
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: 150.0,
      width: screenSize.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: screenSize.height * 0.25),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        color: theme.colorScheme.background,
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color:Colors.black12,
            blurRadius: 3,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget> [
          _buildImage(assetUrl: assetUrl, screenSize: screenSize),
          _buildModalText(modalText: modalText, theme: theme, screenSize: screenSize),
          (isConfirm ? 
            _buildTwoButtonsRow(context, theme, screenSize) 
            : _buildButton(context, theme, screenSize)
          )
        ],
      ),
    );
  }

  Widget _buildImage({String assetUrl = '', Size screenSize = const Size(0.0, 0.0)}) =>
    Image(
      image: AssetImage(assetUrl),
      height: screenSize.width * 0.3,
      width: screenSize.width * 0.3,
    );

  Widget _buildModalText({String modalText = 'Sin Descripción', ThemeData? theme, Size screenSize = const Size(0.0, 0.0)}) => 
    Text(
      modalText,
      style: TextStyle(
        fontSize: screenSize.width * 0.05,
        fontWeight: FontWeight.w500,
        color: theme!.colorScheme.primary
      ),
      textAlign: TextAlign.center,
    );

  Widget _buildTwoButtonsRow(BuildContext context, ThemeData? theme, Size screenSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        TaskButton(
          icon: Icons.check, 
          buttonText: 'Confirmar', 
          iconColor: theme!.colorScheme.background, 
          margin: 15.0, 
          action: action,
          width: screenSize.width * 0.35, 
          fontSize: screenSize.width * 0.04, 
          iconSize: screenSize.width * 0.08,
        ),
        TaskButton(
          icon: Icons.backspace_sharp, 
          buttonText: 'Cancelar',
          iconColor: theme.colorScheme.background, 
          margin: 15.0, 
          action: actionCancel, 
          backgroundColor: theme.colorScheme.error,
          width: screenSize.width * 0.35, 
          fontSize: screenSize.width * 0.04, 
          iconSize: screenSize.width * 0.08,
        )
      ],
    );
  }

  Widget _buildButton(BuildContext context, ThemeData? theme, Size screenSize) => 
    TaskButton(
      icon: Icons.check, 
      buttonText: 'Aceptar', 
      iconColor: theme!.colorScheme.background, 
      margin: 15.0, 
      action: action,
      width: screenSize.width * 0.35, 
      fontSize: screenSize.width * 0.04, 
      iconSize: screenSize.width * 0.08
    );
}