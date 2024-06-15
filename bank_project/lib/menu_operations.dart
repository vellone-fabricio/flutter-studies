Map<int, String> createOperationMap() {
  List<String> operations = [
    "Show all accounts",
    "Create new account",
    "Delete account",
    "Deposit",
    "Withdraw",
    "Transfer",
    "Check Balance",
    "Help",
    "Exit",
  ];

  Map<int, String> operationMap = {};
  for (String op in operations) {
    operationMap[operations.indexOf(op)] = op;
  }

  return operationMap;
}

void printMenu(Map<int, String> operationMap) {
  print("This is the menu of available operations: \n\n");
  for (int key in operationMap.keys) {
    print("$key: ${operationMap[key]}");
  }
}

void chooseOperations(int selectedOperation) {
  switch (selectedOperation) {
    case 0:
      print("Show all accounts");
      break;
    case 1:
      print("Create new account");
      break;
    case 2:
      print("Delete account");
      break;
    case 3:
      print("Deposit");
      break;
    case 4:
      print("Withdraw");
      break;
    case 5:
      print("Transfer");
      break;
    case 6:
      print("Check Balance");
      break;
    case 7:
      print("Help");
      break;
    case 8:
      throw "exit";
  }
}