import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;

  void _changeColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Background Color'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => _changeColor(Colors.red),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Red'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeColor(Colors.green),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text('Green'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _changeColor(Colors.blue),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text('Blue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}