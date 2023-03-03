import 'package:note_keeper/task_model.dart';

class TaskModel {
  String title;
  String description;
  bool isCompleted;

  TaskModel({required this.title, required this.description, this.isCompleted = false});
}
