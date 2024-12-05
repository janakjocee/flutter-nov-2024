// A simple function
int add(int a, int b) {
  return a + b;
}

// Function with optional positional parameters
String greet(String name, [String title = '']) {
  return 'Hello, $title $name';
}

// Function with named parameters
String describe({required String name, int age = 0}) {
  return 'Name: $name, Age: $age';
}

// Anonymous function
var multiply = (int a, int b) {
  return a * b;
};

// Arrow function
int subtract(int a, int b) => a - b;

void main() {
  // Calling functions
  print(add(3, 4)); // 7
  print(greet('Alice')); // Hello,  Alice
  print(greet('Alice', 'Ms.')); // Hello, Ms. Alice
  print(describe(name: 'Bob', age: 30)); // Name: Bob, Age: 30
  print(multiply(3, 4)); // 12
  print(subtract(10, 4)); // 6
}