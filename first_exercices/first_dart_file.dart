void main(List<String> args) {
  print('Hello Dart!');
  // Final and const => For constants
  String name = "Fabricio";
  print("Hello $name!");

  var age = 27;
  print("Age: $age");
  // can't change the type of the variable

  // Dynamic possible to change the type of the variable
  dynamic dynamicVariable = 27;
  print(dynamicVariable);
  dynamicVariable = "27";
  print(dynamicVariable);
}
