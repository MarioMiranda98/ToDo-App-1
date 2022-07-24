import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/controllers/home_page_controller.dart';
import 'package:to_do_app_1/src/pages/task_details_page/task_details_page.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_card.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GetBuilder<HomePageController>(
      id: 'home-page-body',
      init: HomePageController(),
      builder:  (homePageController) => SafeArea(
        child: Scaffold(
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
              _buildMainList(homePageController)
            ],
          ),
          backgroundColor: theme.colorScheme.background,
          drawer: TaskDrawer(),
        ),
      ),
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

  Widget _buildMainList(HomePageController controller) {
    return SliverList(
      delegate: SliverChildBuilderDelegate( 
        (BuildContext context, int index) {
          return TaksCard(
            action: () => Get.to(() => TaskDetailsPage()),
            taskTitle: controller.tasks[index].title,
            taskDescription: controller.tasks[index].shortDescription,
            taskStatus: controller.tasks[index].status,
          );
        },
        childCount: controller.tasks.length
      )
    );
  }
}