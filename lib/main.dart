import 'package:example/features/todo/pages/index_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        title: "Example",
        home: TodoIndexPage(), //
      ),
    ),
  );
}
