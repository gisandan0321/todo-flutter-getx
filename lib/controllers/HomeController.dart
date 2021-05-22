import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:todoapp/app/database/QueryBuilder.dart';
import 'package:todoapp/models/Todo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Todo> items = <Todo>[].obs;
  var gettingItems = false.obs;

  @override
  void onInit() {
    super.onInit();

    print(Get.arguments);
    getList();
  }

  // Get List
  getList() async {
    gettingItems(true);
    var database = await QueryBuilder().initDatabase();

    Todo todo = new Todo();

    var result = await todo.get(database);

    result.forEach((item) {
      items.add(new Todo(id: item["id"], title: item["title"], description: item["description"], status: item["status"]));
    });

    gettingItems(false);
  }
}