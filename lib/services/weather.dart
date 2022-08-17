import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

class WeatherJSONData {
  Future<dynamic> getCityData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=cb1b18fe86393fe8c3879932aefcae74&units=metric");
    var decodedData = await networkHelper.getLocation();
    // ---------------GIVES WEATHER DATA FROM API OF CURRENT LOCATION--------------
    return decodedData;
  }

  Future<dynamic> getLocationData() async {
    Location currentLocation = Location();
    await currentLocation.getCurrentLocation();
    // -----------GIVES COORDINATES OF CURRENT LOCATION-------------

    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${currentLocation.latitude}&lon=${currentLocation.longitude}&appid=cb1b18fe86393fe8c3879932aefcae74&units=metric");
    var decodedData = await networkHelper.getLocation();
    // ---------------GIVES WEATHER DATA FROM API OF CURRENT LOCATION--------------

    return decodedData;
  }
}
