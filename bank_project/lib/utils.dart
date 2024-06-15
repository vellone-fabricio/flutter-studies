import 'dart:io';

void clearScreen() {
  sleep(Duration(seconds: 1));
  print(Process.runSync("clear", [], runInShell: true).stdout);
}
