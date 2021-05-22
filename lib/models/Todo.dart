import 'package:todoapp/app/database/QueryBuilder.dart';

class Todo {

  static const String TABLE = "todo";
  int id;
  String title;
  String description;
  String status;


  Todo({this.id, this.title, this.description, this.status});

  getId() {
    return this.id;
  }

  getTitle() {
    return this.title;
  }

  getDescription() {
    return this.title;
  }

  getStatus() {
    return this.status;
  }


  factory Todo.fromJson(Map<String, dynamic> data) => new Todo(
    id: data["id"],
    title: data["title"],
    description: data["description"],
    status: data["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "status": status,
  };


  // Insert Data
  Future<int> insert(database) async {
    return await database.insert(TABLE, this.toJson());
  }

  // Get All
  Future<List> get(database) async {
    var result = await database.query(TABLE, columns: [
      "id", "title", "description", "status"]
    );

    return result.toList();
  }

  // Get By Id
  Future<Todo> getById(int id, database) async {
    List<Map> results = await database.query(TABLE,
        columns: ["id", "title", "description", "status"],
        where: 'id = ?',
        whereArgs: [id]);

    if (results.length > 0) {
      return new Todo.fromJson(results.first);
    }

    return null;
  }

  // Update Data
  Future<int> update(database) async {
    return await database.update(TABLE, this.toJson(), where: "id = ?", whereArgs: [this.id]);
  }

  // Delete
  Future<int> delete(int id, database) async {
    return await database.delete(TABLE, where: 'id = ?', whereArgs: [id]);
  }
}