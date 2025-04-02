import 'dart:io';

import 'package:todo_app/data_source/todo_data_source.dart';
import 'package:todo_app/data_source/todo_data_source_impl.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/repository/todo_repository_impl.dart';

import 'model/todo.dart';

void showMenu() {
  print("""
    === TODO LIST 프로그램 ===
    1. 목록 보기
    2. 할 일 추가
    3. 할 일 수정
    4. 완료 상태 토글
    5. 할 일 삭제
    0. 종료
    --------------------------
    """);

  print('선택하세요:');
}

void main() async {
  TodoDataSource mockTodoDataSource = TodoDataSourceImpl(
    path: 'lib/data/todos.json',
  );
  TodoRepository todoRepository = TodoRepositoryImpl(
    dataSource: mockTodoDataSource,
  );

  while (true) {
    showMenu();
    String? num = stdin.readLineSync();
    print(num);
    if (num == '1') {
      // List<Todo> todos = await todoRepository.getTodos();
      // print('[할 일 목록]');
      // for (final todo in todos) {
      //   print('${todo.id}. [${todo.completed == true ? 'X' : ''}] ${todo.title} (${todo.createdAt})');
      // }
    } else if (num == '2') {
    } else if (num == '3') {
    } else if (num == '4') {
    } else if (num == '5') {
    } else if (num == '0') {
      print('[프로그램을 종료합니다. 데이터가 저장되었습니다.]');
      break;
    }
  }
}
