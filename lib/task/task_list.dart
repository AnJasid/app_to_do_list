import 'package:app_to_do_list/models/task_model.dart';

class TaskList {
  final List<TaskModel> taskdata = [
    TaskModel(
      taskName: 'Grocery',
      taskDesc: 'To buy goods',
    ),
    TaskModel(
      taskName: 'Cleaning',
      taskDesc: 'To clean the room',
    ),
    TaskModel(
      taskName: 'Studying',
      taskDesc: 'To study about flutter',
    ),
  ];
}
