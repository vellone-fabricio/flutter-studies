import 'dart:io';
import 'package:test/test.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/account/repository/in_memory.dart';
import 'package:bank_project/operations/show_all_accounts.dart';

void main() {
  group('showAllAcounts', () {
    late InMemoryRepository repository;

    setUp(() {
      repository = InMemoryRepository();
    });

    test('should print all accounts', () {
      // Arrange
      final account1 = Account(
        'John Doe',
        'password',
        1000.0,
      );
      final account2 = Account(
        'Jane Smith',
        'password',
        2000.0,
      );
      repository.saveAccount(account1);
      repository.saveAccount(account2);

      final expectedOutput = '''
***Showing all accounts***

--------------------
Account number: ${account1.accountNumber}
Account name: ${account1.name}
Account balance: ${account1.balance}
--------------------
Account number: ${account2.accountNumber}
Account name: ${account2.name}
Account balance: ${account2.balance}


Tap enter to continue...
''';

      // Redirect stdout to capture the printed output
      final output = StringBuffer();
      stdout.write = (obj) => output.write(obj);

      // Act
      showAllAcounts();

      // Assert
      expect(output.toString(), equals(expectedOutput));
    });
  });
}
