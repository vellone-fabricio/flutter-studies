void main() {
  IceCream iceCream = IceCream();
  iceCream.flavor = "Chocolate";
  // String myFlavor = iceCream.flavor!; // ?? "default value";
  String? myFlavor = iceCream.flavor;
  myFlavor ??= "Vanilla";
  print(myFlavor.length);
}

class IceCream {
  String? flavor;
  late bool isFruit;
}
