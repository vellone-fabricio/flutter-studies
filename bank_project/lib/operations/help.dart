import 'dart:io';

import '../utils.dart';

void helpOperation() {
  clearScreen();
  String helpText = """
      This is a simple bank system. You can perform the following operations:
      1. Show all accounts
        Shows all the accounts in the system.
      2. Create new account
        Creates a new account in the system. You need to provide a name and an initial balance.
      3. Delete account
        Deletes an account from the system.
      4. Deposit
        Deposits money into an account.
      5. Withdraw
        Withdraws money from an account.
      6. Transfer
        Transfer money between two accounts.
      7. Check Balance
        Check the balance of an account.
      """;
  print(helpText);
  print("Tap enter to continue...");
  stdin.readLineSync();
}
