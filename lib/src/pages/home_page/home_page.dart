import 'package:flutter/material.dart';

import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';
import 'package:to_do_app_1/src/widgets/task_card.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          TaskAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: 'ToDo App',
            leading: GestureDetector(
              child: Icon(
                Icons.menu,
                size: 20.0,
                color: theme.colorScheme.primary,
              ),
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
            ),
          ),
          _buildFilterTasks(theme),
          _buildMainList()
        ],
      ),
      backgroundColor: theme.colorScheme.background,
      drawer: TaskDrawer(),
    );
  }

  Widget _buildFilterTasks(ThemeData theme) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 35.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ver Por: ',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: theme.primaryTextTheme.headline1?.fontSize
                ),
              ),
              const SizedBox(width: 10.0),
              DropdownButton(
                dropdownColor: theme.colorScheme.background,
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      'Completada', 
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 20.0,
                        fontWeight: theme.primaryTextTheme.bodyText2!.fontWeight!
                      ) 
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      'Pendiente',
                       style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: 20.0,
                        fontWeight: theme.primaryTextTheme.bodyText2!.fontWeight!
                      ) 
                    ),
                  )
                ], 
                onChanged: (value) => print('Cambio: $value'),
                value: 1,
              )
            ],
          ) ,
        ),
      ),
    );
  }

  Widget _buildMainList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate( 
        (BuildContext context, int index) {
          return TaksCard(
            action: () => print(index),
            taskDescription: 'Tarea de prueba',
            taskTitle: 'Pruebas Hardcore',
            taskStatus: 'Pendiente',
          );
        },
        childCount: 10
      )
    );
  }
}