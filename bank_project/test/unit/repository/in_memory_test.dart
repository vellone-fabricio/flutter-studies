import 'dart:io';

import 'package:bank_project/account/account.dart';
import 'package:test/test.dart';
import 'package:bank_project/account/repository/in_memory.dart';

void main() {
  group('InMemoryRepository', () {
    late InMemoryRepository repository;

    setUp(() {
      repository = InMemoryRepository();
    });

    tearDown(() {
      repository.accounts.clear();
    });

    test('saveAccount should save the account', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );

      // Act
      final accountId = repository.saveAccount(account);

      // Assert
      expect(repository.getAccount(accountId), equals(account));
    });

    test('deleteAccount should delete the account', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);

      // Act
      final result = repository.deleteAccount(account.accountNumber);

      // Assert
      expect(result, isTrue);
      expect(repository.getAllAccounts(), isEmpty);
    });

    test('getAccount should return the account', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);

      // Act
      final result = repository.getAccount(account.accountNumber);

      // Assert
      expect(result, equals(account));
    });

    test('getAllAccounts should return all accounts', () {
      // Arrange
      final account1 = Account(
        'John Doe',
        'password',
        1000.0,
      );
      sleep(Duration(
          seconds: 1)); // To make sure the account numbers are different
      final account2 = Account(
        'John Doe1',
        'password',
        1000.0,
      );
      repository.saveAccount(account1);
      repository.saveAccount(account2);

      // Act
      final result = repository.getAllAccounts();

      // Assert
      expect(result, containsAll([account1, account2]));
    });

    test('checkBalance should return the account balance', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);

      // Act
      final result = repository.checkBalance(account.accountNumber);

      // Assert
      expect(result, equals(account.balance));
    });

    test('deposit should increase the account balance', () {
      final initialBalance = 1000.0;
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      repository.saveAccount(account);
      final amount = 500.0;

      // Act
      repository.deposit(account.accountNumber, amount);

      // Assert
      expect(repository.checkBalance(account.accountNumber),
          equals(initialBalance + amount));
    });

    test('withdraw should decrease the account balance', () {
      final initialBalance = 1000.0;
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      repository.saveAccount(account);
      final amount = 500.0;

      // Act
      repository.withdraw(account.accountNumber, amount);

      // Assert
      expect(repository.checkBalance(account.accountNumber),
          equals(initialBalance - amount));
    });

    test('transfer should transfer amount from one account to another', () {
      final initialBalance = 1000.0;
      // Arrange
      final fromAccount = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      sleep(Duration(
          seconds: 1)); // To make sure the account numbers are different
      final toAccount = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      repository.saveAccount(fromAccount);
      repository.saveAccount(toAccount);
      final amount = 500.0;

      // Act
      repository.transfer(
          fromAccount.accountNumber, toAccount.accountNumber, amount);

      // Assert
      expect(repository.checkBalance(fromAccount.accountNumber),
          equals(initialBalance - amount));
      expect(repository.checkBalance(toAccount.accountNumber),
          equals(initialBalance + amount));
    });
  });
}
