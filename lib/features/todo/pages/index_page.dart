import 'package:example/features/todo/models/todo.dart';
import 'package:example/features/todo/repositories/todo_repository.dart';
import 'package:example/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _todosProvider = FutureProvider<List<Todo>>((ref) {
  return ref.watch(todoRepositoryProvider).index();
});

class TodoIndexPage extends ConsumerStatefulWidget {
  const TodoIndexPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoIndexPageState();
}

class _TodoIndexPageState extends ConsumerState<TodoIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ref.watch(_todosProvider).when(
        data: (todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return ProviderScope(
                child: const TodoTile(),
                overrides: [
                  currentTodo.overrideWithValue(todo),
                ],
              );
            },
          );
        },
        error: (error, trace) {
          return Text(error.toString());
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
