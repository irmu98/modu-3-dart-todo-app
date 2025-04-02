
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:todo_app/data_source/todo_data_source.dart';
import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

void main(){
  final String path = 'lib/data/todos.json';
  final TodoDataSource todoDataSource = TodoDataSourceImpl(path: path);
  final TodoRepository todoRepository = TodoRepositoryImpl(dataSource: todoDataSource);

  test('1. 목록 보기', () async {
    List<Todo> getTodos = await todoRepository.getTodos();

    expect(getTodos.length, 2);
    expect(getTodos.first.id, 181);
    expect(getTodos.first.userId, 10);
    expect(getTodos.first.title, "청소");
    expect(getTodos.first.completed,false);
  });
}
