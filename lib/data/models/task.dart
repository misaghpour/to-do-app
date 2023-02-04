import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
   DateTime date;

  @HiveField(1)
   String title;

  @HiveField(2)
   bool isCompleted;

  @HiveField(3)
   String id;

  Task({required this.title, this.isCompleted = false, required this.date, required this.id});
}
