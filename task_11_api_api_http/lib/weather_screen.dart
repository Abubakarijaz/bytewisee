import 'package:flutter/material.dart';
import 'package:task_11_api_api_http/weather_api.dart';
import 'package:task_11_api_api_http/weather_data.dart';
import 'package:http/http.dart' as http;
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _cityController = TextEditingController();
  WeatherData? _weatherData;

  void _fetchWeatherData() async {
    final apiClient = WeatherApiClient(httpClient: http.Client());
    final cityName = _cityController.text;
    final weatherData = await apiClient.getWeather(cityName);
    setState(() {
      _weatherData = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

