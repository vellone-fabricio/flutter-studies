class Account {
  String name;
  String password;
  double balance;
  String accountNumber = DateTime.now().millisecondsSinceEpoch.toString();

  Account(this.name, this.password, this.balance);
}
