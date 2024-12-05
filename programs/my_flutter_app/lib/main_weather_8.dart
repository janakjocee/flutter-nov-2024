import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _cityController = TextEditingController();
  String _weatherInfo = '';
  bool _isLoading = false;

  Future<void> _fetchWeather(String city) async {
    setState(() {
      _isLoading = true;
    });

    final apiKey = '384db1ce93218e20fd384d3016372238';
    final url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _weatherInfo = 'Temperature: ${data['main']['temp']}°C\n'
            'Weather: ${data['weather'][0]['description']}\n'
            'Humidity: ${data['main']['humidity']}%\n'
            'Wind Speed: ${data['wind']['speed']} m/s';
        _isLoading = false;
      });
    } else {
      setState(() {
        _weatherInfo = 'Failed to load weather data';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter city name',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _fetchWeather(_cityController.text);
              },
              child: const Text('Get Weather'),
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : Text(
                    _weatherInfo,
                    style: const TextStyle(fontSize: 20),
                  ),
          ],
        ),
      ),
    );
  }
}