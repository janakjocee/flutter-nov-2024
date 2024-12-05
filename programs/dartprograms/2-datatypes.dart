void main() {
  // Numbers
  int anInteger = 42;
  double aDouble = 3.14;

  // Strings
  String aString = 'Hello, Dart!';

  // Booleans
  bool isTrue = true;

  // Lists
  List<int> aList = [1, 2, 3, 4, 5];

  // Maps
  Map<String, int> aMap = {'one': 1, 'two': 2};

  // Sets
  Set<int> aSet = {1, 2, 3};

  // Runes
  Runes aRune = Runes('Hello');

  // Symbols
  Symbol aSymbol = #mySymbol;

  var test="var data type";

  var test1=10;

  print(anInteger);
  print(aDouble);
  print(aString);
  print(isTrue);
  print(aList);
  print(aMap);
  print(aSet);
  print(aRune);
  print(aSymbol);
  print(test);
  print(test1);

  print("to check the data type of a variable ");
  print(anInteger.runtimeType);
  print("data type of test1 ");
  print(test1.runtimeType);

}
