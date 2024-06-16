import 'dart:io';

import 'package:bank_project/menu_operations.dart';
import 'package:bank_project/utils.dart';

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
      clearScreen();
      continue;
    }

    try {
      chooseOperations(selectedOperation);
    } catch (err) {
      print("Exiting the system. Goodbye!\n");
      break;
    }

    clearScreen();
  }
}
