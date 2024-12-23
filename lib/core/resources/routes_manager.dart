
import 'package:flutter/material.dart';
import 'package:weather_app/UI/Screens/No_weather.dart';
import 'package:weather_app/UI/Screens/SearchCity.dart';
import 'package:weather_app/UI/Screens/SplachScreen.dart';

class RouteManager{
  static Map<String,WidgetBuilder>routes={
    RouteName.kSplashScreen:(context)=>const SplashScreen(),
    RouteName.kNoWeather:(context)=>const NoWeather(),
    RouteName.kSearchCity:(context)=>const SearchCity(),

  };
}
class RouteName{
  static const String kSplashScreen='/kSplashScreen';
  static const String kSearchCity='/kSearchCity';
  static const String kNoWeather='/kNoWeather';

}