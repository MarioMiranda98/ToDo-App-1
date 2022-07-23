import 'package:flutter/material.dart';
import 'package:to_do_app_1/src/pages/task_details_page/widgets/task_review_widget.dart';

import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';

class TaskDetailsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override 
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: theme.colorScheme.background,
        drawer: TaskDrawer(),
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
            _buildTaskTitleCard(),
            _buildTaskShortDescriptionCard(),
            _buildTaskLongDescriptionCard(),
            _buildChangeTaskStatus(theme)
          ],
        )
      ),
    );
  }

  Widget _buildTaskTitleCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Titulo de la tarea', description: 'Titulo'),
      ),
    );
  }

  Widget _buildTaskShortDescriptionCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Resumen', description: 'Resumen de la tarea'),
      ),
    );
  }

  Widget _buildTaskLongDescriptionCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Descripción General', description: 'Descripción de la tarea'),
      ),
    );
  }

  Widget _buildChangeTaskStatus(ThemeData theme) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 75.0,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Estatus: ',
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: theme.primaryTextTheme.headline1?.fontSize
                ),
              ),
              const SizedBox(width: 10.0),
              DropdownButton(
                dropdownColor: theme.colorScheme.background,
                icon: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.arrow_downward,
                    size: 20.0,
                    color: theme.colorScheme.primary,  
                  ),
                ),
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
}