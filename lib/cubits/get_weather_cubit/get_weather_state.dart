import '../../data/model/weather_modeling.dart';

abstract class WeatherState{}
class NoWeatherState extends WeatherState{}
class WeatherLoadingState extends WeatherState{}
class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;

  WeatherLoadedState(this.weather);
}
class WeatherFailureState extends WeatherState {
  final String error;

  WeatherFailureState(this.error);
}