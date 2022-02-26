part of '../repositories/todo_repository.dart';

class _TodoService {
  const _TodoService(this.client);

  final Dio client;

  Future<Response> index() {
    return client.get('todos');
  }
}
