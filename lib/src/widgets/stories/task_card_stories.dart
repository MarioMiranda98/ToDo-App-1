import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_card.dart';

Widget test1() => TaksCard(
  taskTitle: 'Hola mundo', 
  taskDescription: 'eadasdad', 
  taskStatus: 'En Curso', 
  action: () { print('Hola mundo'); });