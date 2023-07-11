import 'package:climate_app/location.dart';
import 'package:climate_app/services/networking.dart';

const apikey = 'cf5e5c1282553ea36bc9884bb335a30b';
const urlinitial = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getcityweather(String cityname) async {
    networkhelper help =
        networkhelper('$urlinitial?q=$cityname&appid=$apikey&units=metric');
    var weatherdata = await help.getdata();
    return weatherdata;
  }

  Future<dynamic> getlocationweather() async {
    location locate = location();
    await locate.getcurrentlocation();
    // var apikey = 'cf5e5c1282553ea36bc9884bb335a30b';
    networkhelper help = networkhelper(
        '$urlinitial?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apikey&units=metric');
    var weatherdata = await help.getdata();
    return weatherdata;
  }

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
