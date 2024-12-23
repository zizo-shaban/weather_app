import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/resources/routes_manager.dart';
import 'package:weather_app/core/resources/strings_manager.dart';
import '../../core/resources/sizes_manager.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: const Text("Hi, WelcomeBack!",style: TextStyle(fontSize: 25,color: Color(0xff9F7CFF)),),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context,RouteName.kSearchCity );
                },
                icon: const Icon(Icons.search,size: 40,color: Colors.white,))
          ],
        ),
        body:  Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h , horizontal: 10.w),
          child: const Center(
            child:  Text(StringManager.centerMassageOnWeather,
              style: TextStyle(fontSize:FontSizeManager.size_30 ,fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ));
  }
}
