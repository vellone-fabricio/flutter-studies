import 'dart:io';

import '../account/account.dart';
import '../account/repository/in_memory.dart';
import '../utils.dart';

String createAccount() {
  clearScreen();
  print("Creating a new account");
  print("Please enter the account name: ");
  String? name = stdin.readLineSync();

  print("Please enter the password: ");
  String? password = stdin.readLineSync();

  print("Please enter the initial balance: ");
  double? balance = double.tryParse(stdin.readLineSync()!);

  if (name == null || password == null || balance == null) {
    print("Invalid input. Please try again.");
    createAccount();
  }

  Account account = Account(name!, password!, balance!);
  String accId = in_memory_respository.saveAccount(account);
  return accId;
}
