import 'dart:io';

import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';

void showAllAcounts() {
  print("***Showing all accounts***\n");
  List<Account> allAccounts = in_memory_respository.getAllAccounts();

  for (Account account in allAccounts) {
    print("--------------------");
    print("Account number: ${account.accountNumber}");
    print("Account name: ${account.name}");
    print("Account balance: ${account.balance}");
  }
  print("\n\nTap enter to continue...");
  stdin.readLineSync();
}
