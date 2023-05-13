import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// This app will get weather data of entered city through weather api and display it
// website for api is openweathermap.org


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: WeatherScreen(),
  ));
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String city = '';
  String weather = '';
  double temperature=0;

  Future<void> fetchWeather(String cityName) async {
    final apiKey = '397b13175457725efa53f504bfc38e8e';
    final apiUrl ='https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final mainWeather = data['weather'][0]['main'];
      final temp=data['main']['temp'];

      setState(() {


        weather = mainWeather;
        temperature=temp;


      });
    } else {
      setState(() {
        weather = 'Error';
        temperature=0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Weather App')),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                city = value;
              },
              decoration: InputDecoration(
                labelText: 'Enter A City Name to get its Weather',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  fetchWeather(city);
                });
              },
              child: Text('Get Weather'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Weather: $weather',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Temperature: $temperature°C',
              style: TextStyle(fontSize: 18.0),
            ),

          ],
        ),
      ),
    );
  }
}


