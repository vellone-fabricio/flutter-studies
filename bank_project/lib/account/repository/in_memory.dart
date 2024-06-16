import 'package:bank_project/account/acc_repository_interface.dart';
import 'package:bank_project/account/account.dart';
import 'package:bank_project/globals.dart';

class InMemoryRepository implements AccountRepositoryInterface {
  Map<String, Account> accounts = ALL_ACCOUNTS;

  @override
  String saveAccount(Account account) {
    String accId = account.accountNumber;
    accounts[accId] = account;
    return accId;
  }

  @override
  bool deleteAccount(String accountNumber) {
    if (accounts.containsKey(accountNumber)) {
      accounts.remove(accountNumber);
      return true;
    }

    return false;
  }

  @override
  getAccount(String accountNumber) {
    // TODO: implement getAccount
    throw UnimplementedError();
  }

  @override
  List<Account> getAllAccounts() {
    return accounts.values.toList();
  }
}

var in_memory_respository = InMemoryRepository();
