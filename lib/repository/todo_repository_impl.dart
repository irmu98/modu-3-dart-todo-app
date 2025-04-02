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
    try {
      List<Todo> todoList = await getTodos();

      final newTodo = Todo(
        userId: 1,
        id: todoList.last.id + 1,
        title: title,
        completed: false,
        createdAt: DateTime.now(),
      );

      todoList.add(newTodo);

      await _dataSource.writeTodos(
          todoList
              .map((e) => e.toJson())
              .toList());
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    try {
      List<Todo> todoList = await getTodos();

      await _dataSource.writeTodos(
          todoList
              .where((e) => e.id != id)
              .map((e) => e.toJson())
              .toList());
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<Map<String, dynamic>> todosJson =
      await _dataSource.readTodos();
      return todosJson.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> toggleTodo(int id) async {
    try {
      List<Todo> todoList = await getTodos();

      List<Todo> sampleList = todoList.where((e) => e.id != id).toList();

      sampleList.add(
          todoList.where((e) => e.id == id).toList()
      );

      await _dataSource.writeTodos(
          todoList
              .map((e) {
            if (e.id == id) {
              e.completed = !e.completed;
            }
            return e.toJson();
          })
              .toList());
    } catch(e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateTodo(int id, String newTitle) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}