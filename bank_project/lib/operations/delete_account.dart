import 'dart:io';

import 'package:bank_project/account/repository/in_memory.dart';

void deleteAccount() {
  print("Enter account number to delete: ");
  String? accountNumber = stdin.readLineSync();
  if (accountNumber == null) {
    print("Invalid account number");
    return;
  }

  bool isDeleted = in_memory_respository.deleteAccount(accountNumber);
  if (isDeleted) {
    print("Account deleted successfully");
    return;
  }

  print("Account not found");
  return;
}
