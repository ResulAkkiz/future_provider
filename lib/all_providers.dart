import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider/model/todo_model.dart';

final dioProvider = Provider<Dio>(
  (ref) {
    return Dio(BaseOptions(baseUrl: 'https://dummyjson.com/'));
  },
);

final todoProvider = FutureProvider.family<List<Todo>, int>((ref, limit) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('todos', queryParameters: {'limit': limit});
  final List<dynamic> todosList = response.data['todos'];
  List<Todo> result = todosList.map((todo) => Todo.fromJson(todo)).toList();
  return result;
});
