import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_1/src/controllers/create_task_controller.dart';

import 'package:to_do_app_1/src/controllers/home_page_controller.dart';
import 'package:to_do_app_1/src/controllers/status_controller.dart';
import 'package:to_do_app_1/src/models/status_model.dart';
import 'package:to_do_app_1/src/pages/task_details_page/task_details_page.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_card.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
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
              _buildMainList()
            ],
          ),
          backgroundColor: theme.colorScheme.background,
          drawer: TaskDrawer(),
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
              GetBuilder<StatusController>(
                id: 'status',
                init: StatusController(),
                builder: (statusController) => DropdownButton(
                  value: statusController.status,
                  dropdownColor: theme.colorScheme.background,
                  items: _buildItems(statusController), 
                  onChanged: (dynamic value) { 
                    final HomePageController createTaskController = Get.put(HomePageController());
                    createTaskController.refreshTaskList(value);
                    statusController.status = value; 
                  },
                  icon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.arrow_downward,
                      size: 20.0,
                      color: theme.colorScheme.primary,  
                    ),
                  ),
                )
              )
            ],
          ) ,
        ),
      ),
    );
  }

  List<DropdownMenuItem> _buildItems(StatusController controller) {
    List<DropdownMenuItem> items = List.empty(growable: true);

    for(StatusModel element in controller.statusList) {
      items.add(DropdownMenuItem(
        value: element.id,
        child: Text(
          element.status,
          style: TextStyle(
            color: Theme.of(Get.context!).colorScheme.primary,
            fontWeight: FontWeight.w700,
            fontSize: 20.0
          ),
        ),
      ));
    }

    return items;
  }

  Widget _buildMainList() {
    return GetBuilder<HomePageController>(
      id: 'home-page-body',
      init: HomePageController(),
      builder:  (homePageController) => SliverList(
        delegate: SliverChildBuilderDelegate( 
          (BuildContext context, int index) {
            return TaksCard(
              action: () => Get.to(() => TaskDetailsPage()),
              taskTitle: homePageController.tasks[index].title,
              taskDescription: homePageController.tasks[index].shortDescription,
              taskStatus: homePageController.tasks[index].status,
            );
          },
          childCount: homePageController.tasks.length
        )
      )
    );
  }
}