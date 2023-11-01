import "dart:convert";

import "package:http/http.dart" as http;

import "secret_config.dart";

class WeatherApiClient {
  SecretConfig _API_SECRET = SecretConfig();
  static const baseUrl =
      "https://weather-by-api-ninjas.p.rapidapi.com/v1/weather";

  Future<Map<String, dynamic>> getLocationInfo(String city) async {
    final locationUrl = Uri.parse("$baseUrl?city=$city");
    final locationResponse = await http.get(
      locationUrl,
      headers: {
        "X-RapidAPI-Key": _API_SECRET.key,
        "X-RapidAPI-Host": _API_SECRET.host,
      },
    );

    if (locationResponse.statusCode != 200) {
      throw Exception("Error getting locationId for city: $city");
    }

    final locationJson = jsonDecode(locationResponse.body);
    return locationJson;
  }
}
