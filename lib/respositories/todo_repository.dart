import 'package:example/locator.dart';
import 'package:example/models/todo.dart';
import 'package:example/services/todo_service.dart';

class TodoRepository {
  final api = TodoService();

  Future<List<Todo>> getAll() async {
    final response = await api.index();

    if (response.statusCode == 200) {
      return (response.data as List).map((todo) {
        return Todo.fromMap(todo);
      }).toList();
    }

    return [];
  }
}
