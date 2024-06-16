import 'dart:io';

import 'package:bank_project/account/repository/in_memory.dart';

void transfer() {
  print("Enter the account number to transfer from: ");
  String fromAccountNumber = stdin.readLineSync()!;
  print("Enter the account number to transfer to: ");
  String toAccountNumber = stdin.readLineSync()!;
  print("Enter the amount to transfer: ");
  double amount = double.parse(stdin.readLineSync()!);

  try {
    in_memory_respository.transfer(fromAccountNumber, toAccountNumber, amount);
  } catch (e) {
    print(e);
  }
  print("Transfer successful");
}
