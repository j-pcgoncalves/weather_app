import 'dart:io';

import 'weather_api_client.dart';

void main(List<String> arguments) async {
  if (arguments.length != 1) {
    print("Syntax: dart bin/main.dart <city>");
    return;
  }

  final city = arguments.first;
  final api = WeatherApiClient();

  try {
    final locationWeather = await api.fetchWeather(city);
    print(locationWeather);
  } on WeatherApiException catch (e) {
    print(e.message);
  } on SocketException catch (_) {
    print("Could not fetch data. Check your connection.");
  } catch (e) {
    print(e);
  }
}
