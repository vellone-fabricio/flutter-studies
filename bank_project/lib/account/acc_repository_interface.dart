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

  getAccount(String accountNumber) {
    throw UnimplementedError();
  }
}
