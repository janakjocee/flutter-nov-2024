void main() {
  int a = 10;
  int b = 5;

  // Arithmetic Operators
  print(a + b); // 15
  print(a - b); // 5
  print(a * b); // 50
  print(a / b); // 2.0
  print(a ~/ b); // 2
  print(a % b); // 0

  // Equality and Relational Operators
  print(a == b); // false
  print(a != b); // true
  print(a > b); // true
  print(a < b); // false
  print(a >= b); // true
  print(a <= b); // false

  // Type Test Operators
  print(a is int); // true
  print(a is! String); // true

  // Logical Operators
  bool x = true;
  bool y = false;
  print(x && y); // false
  print(x || y); // true
  print(!x); // false

  // Conditional Operators
  print(a > b ? 'a is greater' : 'b is greater'); // a is greater
  //int? c;
  int? c;
  print(c ?? a); // 10
}