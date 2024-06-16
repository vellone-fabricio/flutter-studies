import 'dart:io';

import 'package:bank_project/account/repository/in_memory.dart';

void withdraw() {
  print("Enter account number: ");
  String accountNumber = stdin.readLineSync()!;
  print("Enter amount to withdraw: ");
  double amount = double.parse(stdin.readLineSync()!);

  try {
    in_memory_respository.withdraw(accountNumber, amount);
  } catch (e) {
    print("Account not found");
    return;
  }

  print("Withdraw successful");
}
