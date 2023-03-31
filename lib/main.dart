import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/all_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(todoProvider);
    return Scaffold(
      body: list.when(
        data: (todoList) {
          return SafeArea(
            child: ListView.builder(
              itemCount: todoList.length,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                var currentTodo = todoList[index];
                return Card(
                  shadowColor: Colors.red,
                  child: CheckboxListTile(
                    value: currentTodo.completed,
                    onChanged: (value) {},
                    title: Text(currentTodo.todo),
                    subtitle: Text(currentTodo.userId.toString()),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 65,
              ),
              Text(
                error.toString(),
                style: const TextStyle(color: Colors.black54, fontSize: 22),
              )
            ]),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
