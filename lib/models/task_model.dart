import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
  bool isDone;

  TaskModel({ this.isDone =false, required this.title});
}
