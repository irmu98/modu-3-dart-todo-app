import 'dart:math';

import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<void> addTodo(String title) async {
    List<Todo> todoList = await getTodos();

    final newTodo = Todo(
      userId: 1,
      id: todoList.last.id + 1,
      title: title,
      completed: false,
      createdAt: DateTime.now(),
    );

    todoList.add(newTodo);
    
    await _dataSource.writeTodos(todoList.map((e) => e.toJson()).toList());

  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() async {
    // TODO: implement getTodos]
    try {
      final List<Map<String, dynamic>> todosJson =
          await _dataSource.readTodos();
      return todosJson.map((todo) => Todo.fromJson(todo)).toList();
    } catch (e) {
      throw Exception('');
    }
  }

  @override
  Future<void> toggleTodo(int id) {
    // TODO: implement toggleTodo
    throw UnimplementedError();
  }

  @override
  Future<void> updateTodo(int id, String newTitle) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
