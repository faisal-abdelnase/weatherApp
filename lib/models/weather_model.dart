import 'package:flutter/material.dart';

class WeatherModel {
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weahterStateName;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weahterStateName});

  factory WeatherModel.fromJeson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: DateTime.parse(data['location']['localtime']),
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weahterStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    return 'temp = $temp minTemp = $minTemp date = $date';
  }

  String getImage() {
    if (weahterStateName == 'Moderate rain') {
      return 'assets/images/thunderstorm.png';
    } else if (weahterStateName == 'Sleet' ||
        weahterStateName == 'Snow' ||
        weahterStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weahterStateName == 'Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weahterStateName == 'Light Rain' ||
        weahterStateName == 'Heavy Rain' ||
        weahterStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weahterStateName == 'Clear' ||
        weahterStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (weahterStateName == 'Moderate rain') {
      return Colors.grey;
    } else if (weahterStateName == 'Sleet' ||
        weahterStateName == 'Snow' ||
        weahterStateName == 'Hail') {
      return Colors.blue;
    } else if (weahterStateName == 'Partly cloudy') {
      return Colors.blueGrey;
    } else if (weahterStateName == 'Light Rain' ||
        weahterStateName == 'Heavy Rain' ||
        weahterStateName == 'Showers') {
      return Colors.blue;
    } else if (weahterStateName == 'Clear' ||
        weahterStateName == 'Light Cloud' ||
        weahterStateName == 'Sunny') {
      return Colors.orange;
    } else {
      return Colors.orange;
    }
  }
}
