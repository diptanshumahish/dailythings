import 'package:dailythings/sqflite/common.dart';
import 'package:dailythings/sqflite/models/journal_model.dart';
import 'package:sqflite/sqflite.dart';

class JournalDB {
  final tableName = 'journal';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      "id" INTEGER NOT NULL,
      "dayKey" TEXT NOT NULL,
      "title" TEXT NOT NULL,
      "description" TEXT NOT NULL,
      "createdTime" INTEGER NOT NULL DEFAULT (cast(strftime('%s','now') as integer )),
      PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> createJournal(
      {required String title,
      required String dayKey,
      required String description}) async {
    final database = await DatabaseService().getDatabase();
    return await database.rawInsert('''
    INSERT INTO $tableName (dayKey,title,description,createdTime) VALUES (?,?,?,?)
''', [dayKey, title, description, DateTime.now().millisecondsSinceEpoch]);
  }

  Future<List<JournalEntry>> fetchJournal(String dayKey) async {
    final database = await DatabaseService().getDatabase();
    final journals = await database.rawQuery('''
    SELECT * FROM $tableName WHERE dayKey = ?
  ''', [dayKey]);
    return journals.map((j) => JournalEntry.fromJson(j)).toList();
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().getDatabase();
    final numberOfDeleted = await database.rawDelete('''
        DELETE FROM $tableName WHERE id = ?
''', [id]);

    return numberOfDeleted;
  }
}
