import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:to_do_app_1/src/data/enums/image_modal_enum.dart';
import 'package:to_do_app_1/src/data/services/task_service.dart';
import 'package:to_do_app_1/src/models/task_model.dart';
import 'package:to_do_app_1/src/pages/edit_task_page/edit_task_page.dart';
import 'package:to_do_app_1/src/pages/home_page/home_page.dart';
import 'package:to_do_app_1/src/pages/task_details_page/widgets/task_review_widget.dart';
import 'package:to_do_app_1/src/utils/helpers.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';

// ignore_for_file: use_key_in_widget_constructors
class TaskDetailsPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TaskModel? taskModel;

  TaskDetailsPage({
    this.taskModel
  });

  @override 
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

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
                  size: screenSize.width * 0.1,
                  color: theme.colorScheme.primary,
                ),
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
              ),
            ),
            _buildTaskTitleCard(screenSize),
            _buildTaskShortDescriptionCard(screenSize),
            _buildTaskLongDescriptionCard(screenSize),
            _buildTaskDateCard(screenSize),
            _buildStatusCard(screenSize),
            _buildRowButtons(theme, screenSize)
          ],
        )
      ),
    );
  }

  Widget _buildTaskTitleCard(Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Titulo de la tarea', description: taskModel!.title, containerHeight: screenSize.height * 0.16),
      ),
    );
  }

  Widget _buildTaskShortDescriptionCard(Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Resumen', description: taskModel!.shortDescription, containerHeight: screenSize.height * 0.2),
      ),
    );
  }

  Widget _buildTaskLongDescriptionCard(Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Descripción General', description: taskModel!.longDescription, containerHeight: screenSize.height * 0.36),
      ),
    );
  }

   Widget _buildTaskDateCard(Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Fecha Acordada', description: taskModel!.date, containerHeight: screenSize.height * 0.18),
      ),
    );
  }

  Widget _buildStatusCard(Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Estatus', description: taskModel!.status, containerHeight: screenSize.height * 0.16),
      ),
    );
  }

  Widget _buildRowButtons(ThemeData theme, Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            TaskButton(
              backgroundColor: theme.colorScheme.error,
              buttonText: 'Eliminar',
              colorText: theme.colorScheme.background,
              icon: Icons.delete,
              iconSize: screenSize.width * 0.09,
              iconColor: theme.colorScheme.background,
              fontSize: screenSize.width * 0.07,
              margin: 5.0,
              width: screenSize.width * 0.45,
              action: () async {
                final res = await TaskService.instance.deleteTask(taskModel!.id);

                 if(res > 0) {
                  await Helpers.showModal(Get.context!, 
                    action: () {
                      Get.deleteAll(force: true);
                      Get.offAll(() => HomePage(), transition: Transition.fadeIn);
                    },
                    modalText: 'La tarea se ha eliminado con éxito',
                    isConfirm: false,
                    assetUrl: ImageModalEnum.success.imagePath
                  );
                } else {
                  await Helpers.showModal(Get.context!, 
                    action: () {
                      Get.deleteAll(force: true);
                      Get.offAll(() => HomePage(), transition: Transition.fadeIn);
                    },
                    modalText: 'Ha ocurrido un error.',
                    isConfirm: false,
                    assetUrl: ImageModalEnum.failed.imagePath
                  );
                }
              },
            ),
            (taskModel!.idStatus == 2) ?
              TaskButton(
                backgroundColor: theme.colorScheme.primary,
                buttonText: 'Editar',
                colorText: theme.colorScheme.background,
                icon: Icons.edit,
                iconSize: screenSize.width * 0.09,
                iconColor: theme.colorScheme.background,
                fontSize: screenSize.width * 0.07,
                margin: 5.0,
                action: () => Get.to(() => EditTaskPage(taskModel: taskModel), transition: Transition.leftToRight),
                width: screenSize.width * 0.45,
            )
            : Container()
          ],
        ),
      ),
    );
  }
}