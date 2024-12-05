// Define a superclass
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

// Define a subclass that extends the superclass
class Employee extends Person {
  // Additional instance variable
  String jobTitle;

  // Constructor
  Employee(String name, int age, this.jobTitle) : super(name, age);

  // Method
  void work() {
    print('$name is working as a $jobTitle.');
  }
}

void main() {
  // Create an object of the subclass
  Employee employee1 = Employee('Bob', 25, 'Software Developer');

  // Access inherited instance variables and methods
  employee1.greet(); // Hello, my name is Bob and I am 25 years old.
  employee1.work(); // Bob is working as a Software Developer.
}