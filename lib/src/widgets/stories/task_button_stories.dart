import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';

Widget testTaskButton() => TaskButton(
  buttonText: 'Hola',
  colorText: Colors.white,
  icon: Icons.fmd_good,
  iconColor: Colors.white,
  backgroundColor: const Color(0XFF2B2D42),
  margin: 15.0,
);