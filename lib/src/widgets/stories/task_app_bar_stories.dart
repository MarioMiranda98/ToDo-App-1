import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';

Widget taskAppBarTest() => TaskAppBar(
  floating: true,
  pinned: true,
  snap: true,
  title: 'Todo App',
);