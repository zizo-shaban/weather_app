class WeatherModel {
  final String cityName;
  final String date;
  final String image;
  final double maxtemp;
  final double mintemp;
  final String weatherCondtion;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.image,
    required this.maxtemp,
    required this.mintemp,
    required this.weatherCondtion,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: json["forecast"]["forecastday"][0]["date"],
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      maxtemp: (json["forecast"]["forecastday"][0]["day"]["maxtemp_c"]).toDouble(),
      mintemp: (json["forecast"]["forecastday"][0]["day"]["mintemp_c"]).toDouble(),
      weatherCondtion: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
