import 'package:flutter/material.dart';

class TaskDrawer extends StatelessWidget {
  final String currentPage;

  TaskDrawer({this.currentPage = ''});

  @override 
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const <Widget> [
          ListTile(
            title: Text('Home'),
            trailing: Icon(Icons.home),
          ),
          Divider(),
          ListTile(
            title: Text('Crear Tarea'),
            trailing: Icon(Icons.add),
          ),
          Divider(),
        ],
      ),
    );
  }
}