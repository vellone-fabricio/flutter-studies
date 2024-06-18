import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/delete_account.dart';

void main() {
  group('deleteAccount', () {
    late InMemoryRepository repository;

    setUp(() {
      repository = InMemoryRepository();
    });

    test('should delete the account', () {
      // Arrange
      final accountNumber = '123456789';
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);
      final input = Stream<String>.fromIterable([accountNumber]);
      final expectedOutput = 'Account deleted successfully';

      // Act
      final testFuture = deleteAccount(input, repository);
      final testCompleter = Completer<void>();
      testFuture.then((_) => testCompleter.complete());

      // Assert
      expect(testCompleter.future, completes);
      expect(testFuture, emitsInOrder([expectedOutput]));
      expect(repository.getAllAccounts(), isEmpty);
    });

    test('should handle invalid account number', () {
      // Arrange
      final accountNumber = null;
      final input = Stream<String>.fromIterable([accountNumber]);
      final expectedOutput = 'Invalid account number';

      // Act
      final testFuture = deleteAccount(input, repository);
      final testCompleter = Completer<void>();
      testFuture.then((_) => testCompleter.complete());

      // Assert
      expect(testCompleter.future, completes);
      expect(testFuture, emitsInOrder([expectedOutput]));
      expect(repository.getAllAccounts(), isEmpty);
    });

    test('should handle account not found', () {
      // Arrange
      final accountNumber = '123456789';
      final input = Stream<String>.fromIterable([accountNumber]);
      final expectedOutput = 'Account not found';

      // Act
      final testFuture = deleteAccount(input, repository);
      final testCompleter = Completer<void>();
      testFuture.then((_) => testCompleter.complete());

      // Assert
      expect(testCompleter.future, completes);
      expect(testFuture, emitsInOrder([expectedOutput]));
      expect(repository.getAllAccounts(), isEmpty);
    });
  });
}
