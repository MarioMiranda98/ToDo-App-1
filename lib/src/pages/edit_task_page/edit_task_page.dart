import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:to_do_app_1/src/controllers/edit_task_controller.dart';
import 'package:to_do_app_1/src/data/enums/image_modal_enum.dart';
import 'package:to_do_app_1/src/models/status_model.dart';
import 'package:to_do_app_1/src/models/task_model.dart';
import 'package:to_do_app_1/src/utils/helpers.dart';
import 'package:to_do_app_1/src/widgets/task_app_bar.dart';
import 'package:to_do_app_1/src/widgets/task_button.dart';
import 'package:to_do_app_1/src/widgets/task_drawer.dart';
import 'package:to_do_app_1/src/widgets/task_multiline_text_field.dart';
import 'package:to_do_app_1/src/widgets/task_text_field.dart';

class EditTaskPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _taskTitleController = TextEditingController();
  final TextEditingController _taskShortDescriptionController = TextEditingController();
  final TextEditingController _taskLongDescriptionController = TextEditingController();
  final TextEditingController _taskDateController = TextEditingController();
  final TaskModel? taskModel;

  EditTaskPage({
    this.taskModel,
    Key? key
  }): super(key: key);

  @override 
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return GetBuilder<EditTaskController>(
      id: 'edit-fields',
      init: EditTaskController(),
      builder: (editTaskController) => SafeArea(
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
              _buildDateField(context, theme),
              _buildDropDownButton(theme, editTaskController, screenSize),
              _buildSaveButton(context, theme, editTaskController, screenSize)
            ],
          )
        )
      ),
    );
  }

  Widget _buildTaskTitleTextField() {
    _taskTitleController.text = taskModel!.title;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskTextField(textFieldTitle: 'Título de la tarea', controller: _taskTitleController),
      ),
    );
  }

  Widget _buildTaskShortDescription() {
    _taskShortDescriptionController.text = taskModel!.shortDescription;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskTextField(textFieldTitle: 'Resumen de la tarea', controller: _taskShortDescriptionController),
      ),
    );
  }

  Widget _buildTaskLongDescription() {
    _taskLongDescriptionController.text = taskModel!.longDescription;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 25.0),
        child: TaskMultilineTextField(textFieldTitle: 'Descripción Especifica', controller: _taskLongDescriptionController),
      ),
    );
  }

   Widget _buildDateField(BuildContext context, ThemeData theme) {
    _taskDateController.text = taskModel!.date;

    return SliverToBoxAdapter(
      child: GestureDetector(
        onPanDown: (_) => FocusScope.of(context).requestFocus(FocusNode()),
        onTap: () async { 
          final aux = await Helpers.buildDatePicker(context, theme);
          if(aux != null) {
            final date = Helpers.formatDate(aux.toString().split(' ')[0]);
            _taskDateController.text = date;
            taskModel!.date = date;
          } else {
            _taskDateController.text = '';
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 25.0),
          child: TaskTextField(textFieldTitle: 'Fecha Acordada (Tap aquí)', controller: _taskDateController, enabled: false),
        ),
      ),
    );
  }

  Widget _buildDropDownButton(ThemeData theme, EditTaskController controller, Size screenSize) {
    controller.status = taskModel!.idStatus;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 35.0,
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
                value: controller.status,
                dropdownColor: theme.colorScheme.background,
                items: _buildItems(controller, screenSize), 
                onChanged: (dynamic value) { 
                  controller.status = value; 
                  _refreshTaskModel(value);
                },
                icon: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    Icons.arrow_downward,
                    size: screenSize.width * 0.07,
                    color: theme.colorScheme.primary,  
                  ),  
                )
              )
            ],
          ) ,
        ),
      ),
    );
  }

  List<DropdownMenuItem> _buildItems(EditTaskController controller, Size screenSize) {
    List<DropdownMenuItem> items = List.empty(growable: true);

    for(StatusModel element in controller.statusList) {
      items.add(DropdownMenuItem(
        value: element.id,
        child: Text(
          element.status,
          style: TextStyle(
            color: Theme.of(Get.context!).colorScheme.primary,
            fontWeight: FontWeight.w700,
            fontSize: screenSize.width * 0.07
          ),
        ),
      ));
    }

    return items;
  }
  
  Widget _buildSaveButton(BuildContext context, ThemeData theme, EditTaskController controller, Size screenSize) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomRight,
        margin: const EdgeInsets.symmetric(vertical: 80.0),
        child: TaskButton(
          width: screenSize.width * 0.45,
          buttonText: 'Guardar',
          fontSize: screenSize.width * 0.07,
          iconColor: theme.colorScheme.background,
          iconSize: screenSize.width * 0.09,
          icon: Icons.save,
          action: () async {
            await Helpers.showModal(context, 
              actionCancel: () { 
                controller.saveChanges = false;
                Navigator.pop(context); 
              },
              action: () {
                controller.saveChanges = true;
                Navigator.pop(context);
              },
              assetUrl: ImageModalEnum.warning.imagePath,
              isConfirm: true,
              modalText: '¿Desea guardar los cambios realizados?'
            );

            if(controller.saveChanges) {
              controller.validateTaskInputs(<String, dynamic> {
                'id': taskModel!.id,
                'title': _taskTitleController.text,
                'short_description': _taskShortDescriptionController.text,
                'long_description': _taskLongDescriptionController.text,
                'id_status': controller.status,
                'date': _taskDateController.text
              });
            }
          }
        ),
      ),
    );
  }

  void _refreshTaskModel(int idStatus) {
    taskModel!.title = _taskTitleController.text;
    taskModel!.shortDescription = _taskShortDescriptionController.text;
    taskModel!.longDescription = _taskLongDescriptionController.text;
    taskModel!.idStatus = idStatus;
    taskModel!.date = _taskDateController.text;
  }
}