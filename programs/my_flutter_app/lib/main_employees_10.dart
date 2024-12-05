import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeListPage(),
    );
  }
}

class Employee {
  String code;
  String name;
  String department;
  String designation;
  double salary;

  Employee({
    required this.code,
    required this.name,
    required this.department,
    required this.designation,
    required this.salary,
  });
}

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  final List<Employee> _employees = [];
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();

  void _addEmployee() {
    if (_codeController.text.isNotEmpty &&
        _nameController.text.isNotEmpty &&
        _departmentController.text.isNotEmpty &&
        _designationController.text.isNotEmpty &&
        _salaryController.text.isNotEmpty) {
      setState(() {
        _employees.add(Employee(
          code: _codeController.text,
          name: _nameController.text,
          department: _departmentController.text,
          designation: _designationController.text,
          salary: double.tryParse(_salaryController.text) ?? 0.0,
        ));
        _clearControllers();
      });
    }
  }

  void _editEmployee(int index) {
    setState(() {
      _employees[index] = Employee(
        code: _codeController.text,
        name: _nameController.text,
        department: _departmentController.text,
        designation: _designationController.text,
        salary: double.tryParse(_salaryController.text) ?? 0.0,
      );
      _clearControllers();
    });
  }

  void _deleteEmployee(int index) {
    setState(() {
      _employees.removeAt(index);
    });
  }

  void _clearControllers() {
    _codeController.clear();
    _nameController.clear();
    _departmentController.clear();
    _designationController.clear();
    _salaryController.clear();
  }

  void _showEditDialog(int index) {
    _codeController.text = _employees[index].code;
    _nameController.text = _employees[index].name;
    _departmentController.text = _employees[index].department;
    _designationController.text = _employees[index].designation;
    _salaryController.text = _employees[index].salary.toString();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Employee'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Code'),
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _departmentController,
                decoration: const InputDecoration(labelText: 'Department'),
              ),
              TextField(
                controller: _designationController,
                decoration: const InputDecoration(labelText: 'Designation'),
              ),
              TextField(
                controller: _salaryController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Salary'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _editEmployee(index);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee CRUD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _codeController,
              decoration: const InputDecoration(labelText: 'Code'),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _departmentController,
              decoration: const InputDecoration(labelText: 'Department'),
            ),
            TextField(
              controller: _designationController,
              decoration: const InputDecoration(labelText: 'Designation'),
            ),
            TextField(
              controller: _salaryController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Salary'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addEmployee,
              child: const Text('Add Employee'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Code')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Department')),
                    DataColumn(label: Text('Designation')),
                    DataColumn(label: Text('Salary')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: _employees.map((employee) {
                    int index = _employees.indexOf(employee);
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(employee.code)),
                        DataCell(Text(employee.name)),
                        DataCell(Text(employee.department)),
                        DataCell(Text(employee.designation)),
                        DataCell(Text(employee.salary.toString())),
                        DataCell(Row(
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _showEditDialog(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _deleteEmployee(index);
                              },
                            ),
                          ],
                        )),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}