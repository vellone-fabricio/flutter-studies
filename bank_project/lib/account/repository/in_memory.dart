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
  Account getAccount(String accountNumber) {
    Account? account = accounts[accountNumber];
    if (account == null) {
      throw "Account not found";
    }

    return account;
  }

  @override
  List<Account> getAllAccounts() {
    return accounts.values.toList();
  }

  @override
  double checkBalance(String accountNumber) {
    Account account = getAccount(accountNumber);
    return account.balance;
  }

  @override
  void deposit(String accountNumber, double amount) {
    Account account = getAccount(accountNumber);
    account.balance += amount;
  }

  @override
  void withdraw(String accountNumber, double amount) {
    Account account = getAccount(accountNumber);
    account.balance -= amount;
  }
}

var in_memory_respository = InMemoryRepository();
