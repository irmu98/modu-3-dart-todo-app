import 'dart:convert';
import 'dart:io';

import 'todo_data_source.dart';

class TodoDataSourceImpl implements TodoDataSource {
  final String path = 'lib/data/todos.json';

  @override
  Future<List<Map<String, dynamic>>> readTodos() async {
    final String jsonString = await File(path).readAsString();
    final List jsonList = jsonDecode(jsonString);
    final List<Map<String, dynamic>> todos = List<Map<String, dynamic>>.from(
      jsonList,
    );
    return todos;
  }

  @override
  Future<void> writeTodos(List<Map<String, dynamic>> todos) {
    // TODO: implement writeTodos
    throw UnimplementedError();
  }
}
