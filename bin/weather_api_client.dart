import "dart:convert";

import "package:http/http.dart" as http;

import "secret_config.dart";
import "weather.dart";

class WeatherApiException implements Exception {
  WeatherApiException(this.message);

  final String message;
}

class WeatherApiClient {
  SecretConfig _API_SECRET = SecretConfig();
  static const baseUrl =
      "https://weather-by-api-ninjas.p.rapidapi.com/v1/weather";

  Future<Weather> fetchWeather(String city) async {
    final locationUrl = Uri.parse("$baseUrl?city=$city");
    final locationResponse = await http.get(
      locationUrl,
      headers: {
        "X-RapidAPI-Key": _API_SECRET.key,
        "X-RapidAPI-Host": _API_SECRET.host,
      },
    );

    if (locationResponse.statusCode != 200) {
      throw WeatherApiException("Error getting weather for city: $city");
    }

    final locationJson = jsonDecode(locationResponse.body);
    return Weather.fromJson(locationJson);
  }
}
