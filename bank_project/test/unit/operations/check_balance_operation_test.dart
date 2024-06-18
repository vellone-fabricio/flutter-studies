import 'package:test/test.dart';
import 'package:bank_project/account/repository/in_memory.dart';

void main() {
  group('CheckBalanceOperation', () {
    late CheckBalanceOperation checkBalanceOperation;

    setUp(() {
      checkBalanceOperation = CheckBalanceOperation();
    });

    test('checkBalance should print the account balance', () {
      // Arrange
      final accountNumber = '123456789';
      final expectedBalance = 1000.0;
      in_memory_respository.saveAccount(Account(
        'John Doe',
        'password',
        expectedBalance,
      ));
      final input = Stream<String>.fromIterable([accountNumber]);
      final output = StringBuffer();

      // Act
      checkBalanceOperation.checkBalance(input, output);

      // Assert
      expect(
          output.toString().trim(),
          equals(
              'The balance of the account $accountNumber is: $expectedBalance'));
    });

    test('checkBalance should handle invalid input', () {
      // Arrange
      final input = Stream<String>.fromIterable([null]);
      final output = StringBuffer();

      // Act
      checkBalanceOperation.checkBalance(input, output);

      // Assert
      expect(output.toString().trim(), equals('Invalid input'));
    });

    test('checkBalance should handle account not found', () {
      // Arrange
      final accountNumber = '123456789';
      final input = Stream<String>.fromIterable([accountNumber]);
      final output = StringBuffer();

      // Act
      checkBalanceOperation.checkBalance(input, output);

      // Assert
      expect(output.toString().trim(), equals('Account not found'));
    });
  });
}
