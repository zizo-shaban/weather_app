import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/UI/Screens/No_weather.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import '../../cubits/get_weather_cubit/get_weather_state.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeather();
        } else if (state is WeatherLoadingState) {
          return const Center(child: CircularProgressIndicator(color:  Colors.white,));
        } else if (state is WeatherLoadedState) {
          final weather = state.weather; // Access the weather from state

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Image(image: AssetImage("asstes/images/placeholder.png"),width: 100,height: 70,),
                  Text(
                    ' ${weather.cityName}',
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.network('https:${weather.image}'),
                  Column(
                    children: [
                      Text(
                        '${weather.maxtemp}°',
                        style: const TextStyle(
                            fontSize: 80, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                     const  SizedBox(width: 50,),
                      Text(
                        weather.weatherCondtion,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Updated at: ${weather.date}',
                style: const TextStyle(fontSize: 20,color: Colors.white),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Maxtemp: ${weather.maxtemp}°C',style: const TextStyle(color: Colors.white),),
                      Text('Mintemp: ${weather.mintemp}°C',style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
             const  Image(image: AssetImage("asstes/images/temperature.png"))

            ],
          );
        }
        return const SizedBox.shrink();
      },
    ));
  }
}
