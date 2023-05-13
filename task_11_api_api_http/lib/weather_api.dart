import 'dart:convert';
import 'package:task_11_api_api_http/weather_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_11_api_api_http/weather_data.dart';
class WeatherApiClient {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const apiKey = '397b13175457725efa53f504bfc38e8e';

  final http.Client httpClient;

  WeatherApiClient({required this.httpClient});

  Future<WeatherData> getWeather(String cityName) async {
    final url = '$baseUrl?q=London&appid=$apiKey&units=metric';
    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch weather data');
    }

    final json = jsonDecode(response.body);
    final cityName = json['name'];
    final temperature = json['main']['temp'];
    final description = json['weather'][0]['description'];

    return WeatherData(
      cityName: cityName,
      temperature: temperature,
      description: description,
    );
  }
}
