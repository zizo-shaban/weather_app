import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchCity extends StatelessWidget {
  const SearchCity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20,left: 20),
          child: TextField(
            onSubmitted: (val) async {
              if (val.isNotEmpty) {
                 BlocProvider.of<GetWeatherCubit>(context).fetchData(val);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                 const  SnackBar(content: Text("Please enter a city name.")),
                );
              }
            },

            decoration: InputDecoration(

              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
