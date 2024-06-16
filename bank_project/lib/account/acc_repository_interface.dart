import 'package:bank_project/account/account.dart';

class AccountRepositoryInterface {
  String saveAccount(Account account) {
    throw UnimplementedError();
  }

  bool deleteAccount(String accountNumber) {
    throw UnimplementedError();
  }

  List<Account> getAllAccounts() {
    throw UnimplementedError();
  }

  Account getAccount(String accountNumber) {
    throw UnimplementedError();
  }

  double checkBalance(String accountNumber) {
    throw UnimplementedError();
  }

  void deposit(String accountNumber, double amount) {
    throw UnimplementedError();
  }

  void withdraw(String accountNumber, double amount) {
    throw UnimplementedError();
  }
}
