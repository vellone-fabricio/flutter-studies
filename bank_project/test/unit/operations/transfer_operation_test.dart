import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/transfer_operation.dart';

void main() {
  group('Transfer Operation', () {
    late InMemoryRepository repository;
    late TransferOperation transferOperation;

    setUp(() {
      repository = InMemoryRepository();
      transferOperation = TransferOperation(repository);
    });

    test('transfer should transfer amount from one account to another', () {
      // Arrange
      final initialBalance = 1000.0;
      final fromAccount = Account(
        'John Doe',
        'password',
        initialBalance,
      );
      final toAccount = Account(
        'Jane Smith',
        'password',
        initialBalance,
      );
      repository.saveAccount(fromAccount);
      repository.saveAccount(toAccount);

      final fromAccountNumber = fromAccount.accountNumber;
      final toAccountNumber = toAccount.accountNumber;
      final amount = 500.0;

      // Act
      transferOperation.transfer(fromAccountNumber, toAccountNumber, amount);

      // Assert
      expect(repository.checkBalance(fromAccountNumber),
          equals(initialBalance - amount));
      expect(repository.checkBalance(toAccountNumber),
          equals(initialBalance + amount));
    });
  });
}
