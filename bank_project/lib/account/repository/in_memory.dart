import '../acc_repository_interface.dart';
import '../account.dart';

class InMemoryRepository implements AccountRepositoryInterface {
  Map<String, Account> accounts = {};

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
    // TODO: implement getAllAccounts
    throw UnimplementedError();
  }
}

var in_memory_respository = InMemoryRepository();
