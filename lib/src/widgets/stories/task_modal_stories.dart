import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_modal.dart';

Widget taskModalTest() => TaskModal(
  assetUrl: 'assets/modal_assets/warning_icon.png',
  modalText: '¿Guardar Tarea?',
  isConfirm: true,
);