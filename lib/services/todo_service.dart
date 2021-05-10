import 'package:dio/dio.dart';
import 'package:example/locator.dart';

class TodoService {
  final _dio = locator<Dio>();

  Future<Response> index() {
    return _dio.get('todos');
  }

  // Future<Respone> create(Todo todo) {
  //   return _dio.post('todos', data: todo.toMap());
  // }
}
