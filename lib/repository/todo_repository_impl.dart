import '../data_source/todo_data_source.dart';
import '../model/todo.dart';
import 'todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _dataSource;

  TodoRepositoryImpl({required TodoDataSource dataSource}) : _dataSource = dataSource;
  
  @override
  Future<void> addTodo(String title) {
    // TODO: implement addTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(int id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> getTodos() {
    // TODO: implement getTodos
    throw UnimplementedError();
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
