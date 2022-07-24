
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
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: 10.0),
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
          _buildImage(assetUrl: assetUrl),
          _buildModalText(modalText: modalText, theme: theme),
          (isConfirm ? 
            _buildTwoButtonsRow(context, theme) 
            : _buildButton(context, theme)
          )
        ],
      ),
    );
  }

  Widget _buildImage({String assetUrl = ''}) =>
    Image(
      image: AssetImage(assetUrl),
      height: 50.0,
      width: 50.0,
    );

  Widget _buildModalText({String modalText = 'Sin Descripción', ThemeData? theme}) => 
    Text(
      modalText,
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: theme!.colorScheme.primary
      ),
    );

  Widget _buildTwoButtonsRow(BuildContext context, ThemeData? theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        TaskButton(icon: Icons.check, buttonText: 'Confirmar',
          width: 140.0, iconColor: theme!.colorScheme.background, margin: 15.0, action: action),
        TaskButton(icon: Icons.backspace_sharp, buttonText: 'Cancelar',
          width: 140.0, iconColor: theme.colorScheme.background, margin: 15.0, action: actionCancel)
      ],
    );
  }

  Widget _buildButton(BuildContext context, ThemeData? theme) => 
    TaskButton(icon: Icons.check, buttonText: 'Confirmar', 
      width: 140.0, iconColor: theme!.colorScheme.background, action: action);
}