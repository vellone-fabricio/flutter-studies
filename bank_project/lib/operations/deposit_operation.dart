import 'dart:io';

import 'package:bank_project/account/repository/in_memory.dart';

void deposit() {
  print("Enter account number: ");
  String accountNumber = stdin.readLineSync()!;
  print("Enter amount to deposit: ");
  double amount = double.parse(stdin.readLineSync()!);

  try {
    in_memory_respository.deposit(accountNumber, amount);
  } catch (e) {
    print("Account not found");
    return;
  }

  print("Deposit successful");
}
