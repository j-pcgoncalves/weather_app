class Weather {
  Weather({
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.minTemp,
    required this.maxTemp,
  });

  final int temp;
  final int feelsLike;
  final int humidity;
  final int minTemp;
  final int maxTemp;

  factory Weather.fromJson(Map<String, Object?> json) => Weather(
        temp: json["temp"] as int,
        feelsLike: json["feels_like"] as int,
        humidity: json["humidity"] as int,
        minTemp: json["min_temp"] as int,
        maxTemp: json["max_temp"] as int,
      );

  @override
  String toString() => """
Current Temp: ${temp.toString()}°C
Daily Min: ${minTemp.toString()}°C
Daily Max: ${maxTemp.toString()}°C
Humidity: ${humidity.toString()}°C
Feels Like: ${feelsLike.toString()}°C
  """;
}
