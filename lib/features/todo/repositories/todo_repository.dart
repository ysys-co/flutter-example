import 'package:dio/dio.dart';
import 'package:example/features/core/providers.dart';
import 'package:example/features/todo/models/todo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part '../services/todo_service.dart';

final todoRepositoryProvider = Provider((ref) {
  return _TodoRepository(
    service: _TodoService(ref.watch(client)),
  );
});

class _TodoRepository {
  final _TodoService? _service;

  _TodoRepository({_TodoService? service}) : _service = service;

  Future<List<Todo>> index() {
    return _service!.index().then((response) => Todo.fromList(response.data));
  }
}
