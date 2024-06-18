import 'dart:io';

import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/check_balance_operation.dart';
import 'package:bank_project/operations/create_account.dart';
import 'package:bank_project/operations/delete_account.dart';
import 'package:bank_project/operations/deposit_operation.dart';
import 'package:bank_project/operations/help.dart';
import 'package:bank_project/operations/show_all_acounts.dart';
import 'package:bank_project/operations/transfer_operation.dart';
import 'package:bank_project/operations/withdraw_operation.dart';
import 'package:bank_project/menu_operations.dart';

void main() {
  group('Menu Operations', () {
    late Map<int, String> operationMap;

    setUp(() {
      operationMap = createOperationMap();
    });

    test('createOperationMap should return a map with correct operations', () {
      // Arrange
      final expectedMap = {
        0: "Show all accounts",
        1: "Create new account",
        2: "Delete account",
        3: "Deposit",
        4: "Withdraw",
        5: "Transfer",
        6: "Check Balance",
        7: "Help",
        8: "Exit",
      };

      // Act
      final result = createOperationMap();

      // Assert
      expect(result, equals(expectedMap));
    });

    test('printMenu should print the menu of available operations', () {
      // Arrange
      final expectedOutput = "This is the menu of available operations: \n\n"
          "0: Show all accounts\n"
          "1: Create new account\n"
          "2: Delete account\n"
          "3: Deposit\n"
          "4: Withdraw\n"
          "5: Transfer\n"
          "6: Check Balance\n"
          "7: Help\n"
          "8: Exit\n";

      // Act
      final output = printMenu(operationMap);

      // Assert
      expect(output, equals(expectedOutput));
    });

    test(
        'chooseOperations should call the correct operation based on the selected operation',
        () {
      // Arrange
      final selectedOperation = 0;

      // Act
      chooseOperations(selectedOperation);

      // Assert
      // Verify that the correct operation function is called based on the selected operation
      expect(showAllAcountsCalled, isTrue);
      expect(createAccountCalled, isFalse);
      expect(deleteAccountCalled, isFalse);
      expect(depositCalled, isFalse);
      expect(withdrawCalled, isFalse);
      expect(transferCalled, isFalse);
      expect(checkBalanceCalled, isFalse);
      expect(helpOperationCalled, isFalse);
    });

    // Add more tests for other operations...
  });
}
