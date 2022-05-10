class Weather {
  String name;
  String description;
  double temperature;
  double temperatureFeeling;
  int humidity;

  Weather(this.name, this.temperature, this.temperatureFeeling, this.humidity,
      this.description);

  factory Weather.fromJson(Map<String, dynamic> jsonResponse) => Weather(
      jsonResponse["name"],
      jsonResponse["main"]["temp"],
      jsonResponse["main"]["feels_like"],
      jsonResponse["main"]["humidity"],
      jsonResponse["weather"][0]["description"]);
}
