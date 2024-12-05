// Define the Employee class
class Employee {
  String name;
  int age;
  String jobTitle;

  Employee(this.name, this.age, this.jobTitle);

  @override
  String toString() {
    return 'Employee{name: $name, age: $age, jobTitle: $jobTitle}';
  }

   // Static method to print a welcome message
  static void printWelcomeMessage() {
    print('Welcome to the Employee Management System');
  }

}

// Create a list to store Employee objects
List<Employee> employees = [];

// Function to create a new employee
void createEmployee(String name, int age, String jobTitle) {
  Employee employee = Employee(name, age, jobTitle);
  employees.add(employee);
  print('Employee added: $employee');
}

// Function to read all employees
void readEmployees() {
  print('List of employees:');
  for (var employee in employees) {
    print(employee);
  }
}

// Function to update an employee
void updateEmployee(int index, String name, int age, String jobTitle) {
  if (index >= 0 && index < employees.length) {
    employees[index].name = name;
    employees[index].age = age;
    employees[index].jobTitle = jobTitle;
    print('Employee updated: ${employees[index]}');
  } else {
    print('Employee not found at index $index');
  }
}

// Function to delete an employee
void deleteEmployee(int index) {
  if (index >= 0 && index < employees.length) {
    print('Employee removed: ${employees.removeAt(index)}');
  } else {
    print('Employee not found at index $index');
  }
}

void main() {
  // Create employees
  createEmployee('Alice', 30, 'Software Developer');
  createEmployee('Bob', 25, 'Designer');

  // Read employees
  readEmployees();

  // Update an employee
  updateEmployee(1, 'Bob', 26, 'Senior Designer');

  // Read employees again to see the update
  readEmployees();

  // Delete an employee
  deleteEmployee(0);

  // Read employees again to see the deletion
  readEmployees();
  // Call the static method
  Employee.printWelcomeMessage();
}