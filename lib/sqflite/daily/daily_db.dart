import 'package:dailythings/sqflite/common.dart';
import 'package:dailythings/sqflite/models/daily_task_entry.dart';
import 'package:sqflite/sqflite.dart';

class DailyDB {
  final tableName = 'daily';
  final dbName = "daily.db";

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "dayKey" TEXT NOT NULL,
      "title" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "createdTime" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as integer )),
      "completionTime" TEXT NOT NULL,
      "category" TEXT NOT NULL,
      "isCompleted"  INTEGER NOT NULL DEFAULT 0,
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> createTask(
      {required String title,
      required String dayKey,
      required String category,
      required String completionTime,
      required String description}) async {
    final database = await DatabaseService().getDatabase(dbName);
    return await database.rawInsert('''
    INSERT INTO $tableName (dayKey,title,description,createdTime,category,completionTime) VALUES (?,?,?,?,?.?)
''', [
      dayKey,
      title,
      description,
      DateTime.now().millisecondsSinceEpoch,
      category,
      completionTime
    ]);
  }

  Future<List<DailyTaskEntry>> fetchTasks(String dayKey) async {
    final database = await DatabaseService().getDatabase(dbName);
    final journals = await database.rawQuery('''
    SELECT * FROM $tableName WHERE dayKey = ?
  ''', [dayKey]);
    return journals.map((j) => DailyTaskEntry.fromJson(j)).toList();
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().getDatabase(dbName);
    final numberOfDeleted = await database.rawDelete('''
        DELETE FROM $tableName WHERE id = ?
''', [id]);

    return numberOfDeleted;
  }

  Future<int> deleteAll() async {
    final database = await DatabaseService().getDatabase(dbName);
    final numberOfDeleted =
        await database.rawDelete('''DELETE FROM $tableName''');
    return numberOfDeleted;
  }
}
