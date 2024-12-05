// Define an interface (using a class)
abstract class Printable {
  void printDetails();
}

// Another interface
abstract class Identifiable {
  String getId();
}

// Define a class that implements the interfaces
class Employee implements Printable, Identifiable {
  String name;
  int age;
  String jobTitle;
  String id;

  Employee(this.name, this.age, this.jobTitle, this.id);

  @override
  void printDetails() {
    print('Employee{name: $name, age: $age, jobTitle: $jobTitle, id: $id}');
  }

  @override
  String getId() {
    return id;
  }
}

void main() {
  // Create an employee object
  Employee employee = Employee('Alice', 30, 'Software Developer', 'E123');

  // Call methods from the interfaces
  employee.printDetails(); // Employee{name: Alice, age: 30, jobTitle: Software Developer, id: E123}
  print('Employee ID: ${employee.getId()}'); // Employee ID: E123
}