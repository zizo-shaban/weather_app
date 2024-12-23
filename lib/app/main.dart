import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/UI/Screens/homePage.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/data/web_service/dio_helper.dart';

import '../core/resources/routes_manager.dart';

void main() {
  Diohelper.initDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child:  ScreenUtilInit(
        designSize:  const Size(360,694),
        child:  MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor:const  Color(0xff1D2837),
            appBarTheme:const  AppBarTheme(
            backgroundColor: Color(0xff1D2837)
            )
          ),
          routes: RouteManager.routes,
          initialRoute: RouteName.kSplashScreen,
          debugShowCheckedModeBanner: false,
          home:  const Homepage(), // Your main screen that includes SearchCity
        ),
      ),
    );
  }
}
