import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_11_api_api_http/weather_data.dart';
class WeatherDisplay extends StatelessWidget {
  final WeatherData weatherData;

  const WeatherDisplay({required this.weatherData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weatherData.cityName,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          '${weatherData.temperature.toStringAsFixed(1)}°C',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        SizedBox(height: 16),
        Text(
          weatherData.description,
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
