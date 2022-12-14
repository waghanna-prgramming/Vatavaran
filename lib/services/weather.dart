import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';

class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
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
