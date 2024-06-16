import 'package:bank_project/operations/check_balance_operation.dart';
import 'package:bank_project/operations/create_account.dart';
import 'package:bank_project/operations/delete_account.dart';
import 'package:bank_project/operations/deposit_operation.dart';
import 'package:bank_project/operations/help.dart';
import 'package:bank_project/operations/show_all_acounts.dart';
import 'package:bank_project/operations/withdraw_operation.dart';

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
      showAllAcounts();
      break;
    case 1:
      createAccount();
      break;
    case 2:
      deleteAccount();
      break;
    case 3:
      deposit();
      break;
    case 4:
      withdraw();
      break;
    case 5:
      print("Transfer");
      break;
    case 6:
      checkBalance();
      break;
    case 7:
      helpOperation();
      break;
    default:
      throw "exit";
  }
}
