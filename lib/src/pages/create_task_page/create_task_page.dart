import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/controllers/create_task_controller.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';
import 'package:to_do_app_1/src/widgets/task_multiline_text_field.dart';
import 'package:to_do_app_1/src/widgets/task_text_field.dart';

class CreateTaskPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskShortDescriptionController = TextEditingController();
  final TextEditingController _taskLongDescriptionController = TextEditingController();

  CreateTaskPage({ Key? key}): super(key: key);

  @override 
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    return GetBuilder<CreateTaskController>(
      init: CreateTaskController(),
      builder: (createTaskController) => SafeArea(
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
              _buildTaskTitleTextField(),
              _buildTaskShortDescription(),
              _buildTaskLongDescription(),
              _buildSaveButton(theme, createTaskController)
            ],
          )
        )
      ),
    );
  }

  Widget _buildTaskTitleTextField() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskTextField(textFieldTitle: 'Título de la tarea', controller: _taskTitleController),
      ),
    );
  }

  Widget _buildTaskShortDescription() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskTextField(textFieldTitle: 'Resumen de la tarea', controller: _taskShortDescriptionController),
      ),
    );
  }

  Widget _buildTaskLongDescription() {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskMultilineTextField(textFieldTitle: 'Descripción Especifica', controller: _taskLongDescriptionController),
      ),
    );
  }
  
  Widget _buildSaveButton(ThemeData theme, CreateTaskController controller) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.symmetric(vertical: 15.0),
        child: TaskButton(
          width: 180.0,
          buttonText: 'Guardar',
          fontSize: 24.0,
          iconColor: theme.colorScheme.background,
          iconSize: 40.0,
          icon: Icons.save,
          action: () => controller.validateTaskInputs(<String, dynamic> {
            'title': _taskTitleController.text,
            'short_description': _taskShortDescriptionController.text,
            'long_description': _taskLongDescriptionController.text,
            'id_status': 2
          }),
        ),
      ),
    );
  }
}