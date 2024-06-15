import 'dart:io';

import '../utils.dart';

void createAccount() {
  clearScreen();
  print("Creating a new account");
  print("Please enter the account name: ");
  String? name = stdin.readLineSync();
}
