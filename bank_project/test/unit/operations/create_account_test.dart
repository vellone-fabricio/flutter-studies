import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/create_account.dart';

void main() {
  group('createAccount', () {
    late InMemoryRepository repository;

    setUp(() {
      repository = InMemoryRepository();
    });

    test('should create a new account', () {
      // Arrange
      final input = StringBuffer();
      input.writeln('John Doe'); // Account name
      input.writeln('password'); // Password
      input.writeln('1000.0'); // Initial balance
      final expectedAccount = Account('John Doe', 'password', 1000.0);

      // Act
      createAccount(input: input, repository: repository);

      // Assert
      final createdAccount = repository.getAccount(1);
      expect(createdAccount, equals(expectedAccount));
    });

    test('should prompt for input again if invalid input is provided', () {
      // Arrange
      final input = StringBuffer();
      input.writeln('John Doe'); // Account name
      input.writeln('password'); // Password
      input.writeln('invalid'); // Invalid initial balance
      input.writeln('1000.0'); // Valid initial balance
      final expectedAccount = Account('John Doe', 'password', 1000.0);

      // Act
      createAccount(input: input, repository: repository);

      // Assert
      final createdAccount = repository.getAccount(1);
      expect(createdAccount, equals(expectedAccount));
    });
  });
}
