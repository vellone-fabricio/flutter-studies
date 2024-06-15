import 'dart:io';

void main() {
  print("Welcome to the Bank System!\n\n");
  while (true) {
    var operationMap = createOperationMap();
    printMenu(operationMap);

    print("\nPlease enter the operation number:");
    String userInput = stdin.readLineSync() ?? "-1";

    int selectedOperation = int.tryParse(userInput) ?? -1;
    String? selectedAction = operationMap[selectedOperation];
    if (selectedAction == null) {
      print("\n\nInvalid operation. Please try again.\n\n");
      sleep(Duration(seconds: 1));
      print(Process.runSync("clear", [], runInShell: true).stdout);
      continue;
    }
  }
}

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
