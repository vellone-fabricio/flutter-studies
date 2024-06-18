import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/deposit_operation.dart';

void main() {
  group('Deposit Operation', () {
    late InMemoryRepository repository;
    late DepositOperation depositOperation;

    setUp(() {
      repository = InMemoryRepository();
      depositOperation = DepositOperation(repository);
    });

    test('should deposit amount into account', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);

      final input = '123456'; // Account number
      final depositAmount = 500.0;

      final expectedBalance = account.balance + depositAmount;

      // Act
      final stdin = File('test_input.txt').openRead();
      final stdout = File('test_output.txt').openWrite();
      stdin.write(input);
      stdin.write('\n');
      stdin.write(depositAmount.toString());
      stdin.write('\n');
      depositOperation.deposit(stdin, stdout);

      // Assert
      expect(repository.checkBalance(account.accountNumber),
          equals(expectedBalance));
    });

    test('should print "Account not found" if account does not exist', () {
      // Arrange
      final input = '123456'; // Account number
      final depositAmount = 500.0;

      // Act
      final stdin = File('test_input.txt').openRead();
      final stdout = File('test_output.txt').openWrite();
      stdin.write(input);
      stdin.write('\n');
      stdin.write(depositAmount.toString());
      stdin.write('\n');
      depositOperation.deposit(stdin, stdout);

      // Assert
      expect(stdout.toString(), contains('Account not found'));
    });

    test('should print "Deposit successful" if deposit is successful', () {
      // Arrange
      final account = Account(
        'John Doe',
        'password',
        1000.0,
      );
      repository.saveAccount(account);

      final input = '123456'; // Account number
      final depositAmount = 500.0;

      // Act
      final stdin = File('test_input.txt').openRead();
      final stdout = File('test_output.txt').openWrite();
      stdin.write(input);
      stdin.write('\n');
      stdin.write(depositAmount.toString());
      stdin.write('\n');
      depositOperation.deposit(stdin, stdout);

      // Assert
      expect(stdout.toString(), contains('Deposit successful'));
    });
  });
}
