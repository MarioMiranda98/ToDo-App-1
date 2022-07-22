import 'package:flutter/material.dart';

class TaskDrawer extends StatelessWidget {
  final String currentPage;

  TaskDrawer({this.currentPage = ''});

  @override 
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.background,
      child: ListView(
        children: <Widget> [
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 20.0
              ),
            ),
            trailing: Icon(
              Icons.home,
              color: theme.colorScheme.primary,
              size: 40.0,
            ),
          ),
          Divider(color: theme.colorScheme.primary),
          ListTile(
            title: Text(
              'Crear Tarea',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 20.0
              ),
            ),
            trailing: Icon(
              Icons.add,
              color: theme.colorScheme.primary,
              size: 40.0,
            ),
          ),
          Divider(color: theme.colorScheme.primary),
        ],
      ),
    );
  }
}