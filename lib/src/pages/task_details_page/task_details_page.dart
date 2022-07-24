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
            _buildStatusCard(),
            _buildRowButtons(theme)
          ],
        )
      ),
    );
  }

  Widget _buildTaskTitleCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Titulo de la tarea', description: taskModel!.title, containerHeight: 110.0),
      ),
    );
  }

  Widget _buildTaskShortDescriptionCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Resumen', description: taskModel!.shortDescription, containerHeight: 120.0),
      ),
    );
  }

  Widget _buildTaskLongDescriptionCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Descripción General', description: taskModel!.longDescription, containerHeight: 180.0),
      ),
    );
  }

  Widget _buildStatusCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        child: TaskReviewWidget(title: 'Estatus', description: taskModel!.status, containerHeight: 110.0),
      ),
    );
  }

  Widget _buildRowButtons(ThemeData theme) {
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
              iconSize: 24.0,
              iconColor: theme.colorScheme.background,
              fontSize: 24.0,
              margin: 5.0,
              action: () async {
                final res = await TaskService.instance.deleteTask(taskModel!.id);

                 if(res > 0) {
                  await Helpers.showModal(Get.context!, 
                    action: () {
                      Get.deleteAll(force: true);
                      Get.offAll(() => HomePage(), transition: Transition.fadeIn);
                    },
                    modalText: 'La tarea se ha actualizado con éxito',
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
              width: 160.0,
            ),
            (taskModel!.idStatus == 2) ?
              TaskButton(
                backgroundColor: theme.colorScheme.primaryContainer,
                buttonText: 'Editar',
                colorText: theme.colorScheme.background,
                icon: Icons.edit,
                iconSize: 24.0,
                iconColor: theme.colorScheme.background,
                fontSize: 24.0,
                margin: 5.0,
                action: () => Get.to(() => EditTaskPage(taskModel: taskModel), transition: Transition.leftToRight),
                width: 160.0,
            )
            : Container()
          ],
        ),
      ),
    );
  }
}