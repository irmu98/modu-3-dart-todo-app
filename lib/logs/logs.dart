
import 'dart:io';

Future<void> writeLogs(String message) async {
  File file = File('log.txt');
  file.writeAsString(message, mode: FileMode.append);

  print("[${DateTime.now()}] $message");
}
