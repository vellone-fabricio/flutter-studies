// void main() {
//   IceCream vanilla = IceCream();
//   vanilla.flavor = "Vanilla";
//   vanilla.isFruit = true;
//   print(vanilla.flavor);
// }

// class IceCream {
//   String flavor = "";
//   bool isFruit = false;
// }

void main() {
  IceCream vanilla = IceCream("Mint", false);
  print(vanilla.flavor);

  IceCream chocolate = IceCream.withFlavor("Chocolate");
  print(chocolate.flavor);
  print(chocolate.isFruit);

  IceCream strawberry = IceCream.fruitWithFlavor("Strawberry");
  print(strawberry.flavor);
  print(strawberry.isFruit);

  Cone cone = Cone("Vanilla", false, true);
  print(cone.isGlutenFree);
}

class IceCream {
  String flavor = "";
  bool isFruit = false;

  // unnamed constructor
  IceCream(this.flavor, this.isFruit);

  IceCream.withFlavor(this.flavor);

  IceCream.fruitWithFlavor(this.flavor) {
    isFruit = true;
  }
}

class Cone extends IceCream {
  bool isGlutenFree = false;

  Cone(String flavor, bool isFruit, this.isGlutenFree) : super(flavor, isFruit);
}
