import 'package:example/features/todo/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentTodo = Provider<Todo>((ref) {
  throw UnimplementedError;
});

class TodoTile extends ConsumerWidget {
  const TodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);

    return ListTile(
      title: Text(todo.title),
      trailing: const TodoToggleButton(),
    );
  }
}

class TodoToggleButton extends ConsumerWidget {
  const TodoToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(currentTodo);

    return Checkbox(
      value: todo.completed,
      onChanged: (value) {
        //
      },
    );
  }
}
