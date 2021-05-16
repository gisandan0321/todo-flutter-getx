import 'package:sqflite/sqflite.dart';
import 'package:todoapp/app/config/Config.dart';
import 'package:path/path.dart';

class QueryBuilder {

  // Initialize Database
  initDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, Config.DB_NAME);

    var database = await openDatabase(dbPath, version: 1, onCreate: createDatabase);
    return database;
  }

  // Create Database
  createDatabase(Database database, int version) async {
    await database.execute("CREATE TABLE todo ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "title TEXT,"
        "description TEXT,"
        "status TEXT"
        ")");
  }
}