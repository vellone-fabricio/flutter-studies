import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/withdraw_operation.dart';

void main() {
  group('Withdraw Operation', () {
    late InMemoryRepository repository;
    late WithdrawOperation withdrawOperation;

    setUp(() {
      repository = InMemoryRepository();
      withdrawOperation = WithdrawOperation(repository);
    });

    test('withdraw should decrease the account balance', () {
      // Arrange
      final initialBalance = 1000.0;
      final account = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      repository.saveAccount(account);

      final accountNumber = account.accountNumber;
      final amount = 500.0;

      // Act
      withdrawOperation.withdraw(accountNumber, amount);

      // Assert
      expect(repository.checkBalance(accountNumber),
          equals(initialBalance - amount));
    });

    test('withdraw should print "Account not found" if account is not found',
        () {
      // Arrange
      final accountNumber = 'non_existent_account';
      final amount = 500.0;

      // Act
      withdrawOperation.withdraw(accountNumber, amount);

      // Assert
      expect(
        stdout.toString().contains('Account not found'),
        isTrue,
      );
    });

    test(
        'withdraw should print "Withdraw successful" if withdrawal is successful',
        () {
      // Arrange
      final initialBalance = 1000.0;
      final account = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      repository.saveAccount(account);

      final accountNumber = account.accountNumber;
      final amount = 500.0;

      // Act
      withdrawOperation.withdraw(accountNumber, amount);

      // Assert
      expect(
        stdout.toString().contains('Withdraw successful'),
        isTrue,
      );
    });
  });
}
