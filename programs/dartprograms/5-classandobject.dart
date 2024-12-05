// Define a class
class Person {
  // Instance variables
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Method
  void greet() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  // Create an object (instance of the class)
  Person person1 = Person('Alice', 30);

  // Access instance variables
  print(person1.name); // Alice
  print(person1.age); // 30

  // Call method
  person1.greet(); // Hello, my name is Alice and I am 30 years old.

  // Create another object
  Person person2 = Person('Bob', 25);
  person2.greet(); // Hello, my name is Bob and I am 25 years old.
}