import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';

class TaskModal extends StatelessWidget {
  final String assetUrl;
  final String modalText;
  final bool isConfirm;
  final void Function()? action;

  TaskModal({
    this.assetUrl = '',
    this.modalText = 'Sin Texto',
    this.isConfirm = false,
    this.action
  });

  @override 
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: 150.0,
      width: screenSize.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05, vertical: 10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.5),
        color: Colors.white,
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
          _buildModalText(modalText: modalText),
          (isConfirm ? 
            _buildTwoButtonsRow(context) 
            : _buildButton(context)
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

  Widget _buildModalText({String modalText = 'Sin Descripción'}) => 
    Text(
      modalText,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
    );

  Widget _buildTwoButtonsRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        TaskButton(icon: Icons.check, buttonText: 'Confirmar',
          width: 140.0, iconColor: Colors.white, margin: 15.0),
        TaskButton(icon: Icons.backspace_sharp, buttonText: 'Cancelar',
          width: 140.0, iconColor: Colors.white, margin: 15.0)
      ],
    );
  }

  Widget _buildButton(BuildContext context) => 
    TaskButton(icon: Icons.check, buttonText: 'Confirmar', 
      width: 140.0, iconColor: Colors.white);
}