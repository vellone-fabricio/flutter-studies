void main() {
  printFlavors();
}

void printFlavors() {
  List<String> flavors = ['Vanilla', 'Chocolate', 'Strawberry'];
  print("Normal for loop:");
  for (int i = 0; i < flavors.length; i++) {
    print(flavors[i]);
  }
  flavors.add('Mint');
  // flavors.remove("Vanilla");
  flavors.removeAt(0);

  print("\nIn for loop:");
  for (String flavor in flavors) {
    print(flavor);
  }

  bool containsFlavor(String flavor) => flavors.contains(flavor);
  print(containsFlavor("Banana"));

  String message =
      containsFlavor("Mint") ? "YES! There is mint" : "NO! There is no mint";
  print(message);
}
