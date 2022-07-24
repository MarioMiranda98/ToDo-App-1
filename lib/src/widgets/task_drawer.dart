import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/pages/create_task_page/create_task_page.dart';
import 'package:to_do_app_1/src/pages/home_page/home_page.dart';

class TaskDrawer extends StatelessWidget {
  final String currentPage;

  // ignore: prefer_const_constructors_in_immutables
  TaskDrawer({
    this.currentPage = '',
    Key? key
  }): super(key: key);

  @override 
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: theme.colorScheme.background,
      child: ListView(
        children: <Widget> [
          SizedBox(
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: screenSize.width * 0.1,
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Divider(color: theme.colorScheme.primary, thickness: 1),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: screenSize.width * 0.075
              ),
            ),
            trailing: Icon(
              Icons.home,
              color: theme.colorScheme.primary,
              size: 60.0,
            ),
            onTap: () { 
              if(currentPage != 'home_page') {
                Get.deleteAll(force: true);
                Get.offAll(() => HomePage(), transition: Transition.downToUp);
              }
            }
          ),
          Divider(color: theme.colorScheme.primary, thickness: 1),
          const SizedBox(height: 10.0),
          ListTile(
            title: Text(
              'Crear Tarea',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: screenSize.width * 0.075
              ),
            ),
            trailing: Icon(
              Icons.add,
              color: theme.colorScheme.primary,
              size: 60.0,
            ),
            onTap: () {
              Get.to(() => CreateTaskPage(), transition: Transition.downToUp);
            },
          ),
          Divider(color: theme.colorScheme.primary, thickness: 1),
        ],
      ),
    );
  }
}