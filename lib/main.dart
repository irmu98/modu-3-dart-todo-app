import 'dart:io';

import 'package:todo_app/logs/logs.dart';

import 'data_source/todo_data_source.dart';
import 'data_source/todo_data_source_impl.dart';
import 'model/todo.dart';
import 'repository/todo_repository.dart';
import 'repository/todo_repository_impl.dart';

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
  writeLogs('앱 시작됨.');
  TodoDataSource mockTodoDataSource = TodoDataSourceImpl(
    path: 'lib/data/mock_todos.json',
  );
  TodoRepository todoRepository = TodoRepositoryImpl(
    dataSource: mockTodoDataSource,
  );

  while (true) {
    showMenu();
    String? num = stdin.readLineSync();
    if (num == '1') {
      List<Todo> todos = await todoRepository.getTodos();
      print('[할 일 목록]');
      for (final todo in todos) {
        print(
          '${todo.id}. [${todo.completed == true ? 'X' : ''}] ${todo.title} (${todo.createdAt})',
        );
      }
      writeLogs('');
    } else if (num == '2') {
      print('할 일 제목을 입력하세요: ');
      String? title = stdin.readLineSync();

      if (title != null) {
        await todoRepository.addTodo(title);
        print('[할 일 추가됨]');
      }
      
    } else if (num == '3') {
      print('수정할 할 일 ID를 입력하세요: ');
      String? id = stdin.readLineSync();
      print('새 제목을 입력하세요: ');
      String? title = stdin.readLineSync();
      if (id != null && title != null) {
        await todoRepository.updateTodo(int.parse(id), title);
        print('[할 일 제목이 수정되었습니다]');
      }
      
    } else if (num == '4') {
      print('완료 상태를 토글할 할 일 ID를 입력하세요: ');
      String? id = stdin.readLineSync();
      if (id != null) {
        await todoRepository.toggleTodo(int.parse(id));
        print('[할 일 완료 상태가 변경되었습니다]');
      }
      
    } else if (num == '5') {
      print('삭제할 할 일 ID를 입력하세요: ');
      String? id = stdin.readLineSync();
      if (id != null) {
        await todoRepository.deleteTodo(int.parse(id));
        print('[할 일이 삭제되었습니다]');
      }
      
    } else if (num == '0') {
      print('[프로그램을 종료합니다. 데이터가 저장되었습니다.]');
      writeLogs('앱 종료됨.');
      
      break;
    }
  }
}
