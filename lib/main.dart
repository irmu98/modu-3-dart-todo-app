import 'dart:io';

void main() {
  while (true) {
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
    String? num = stdin.readLineSync();

    if (num == '1') {

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
