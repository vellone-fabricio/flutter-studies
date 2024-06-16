import 'dart:io';

import 'package:bank_project/account/repository/in_memory.dart';

void checkBalance() {
  print("Enter the account number: ");
  String? accountNumberInput = stdin.readLineSync();
  if (accountNumberInput == null) {
    print("Invalid input");
    return;
  }

  double resultBalance;
  try {
    resultBalance = in_memory_respository.checkBalance(accountNumberInput);
  } catch (err) {
    print(err);
    return;
  }
  print("The balance of the account $accountNumberInput is: $resultBalance");
}
