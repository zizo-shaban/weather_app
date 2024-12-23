
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/data/model/weather_modeling.dart';
import '../../data/web_service/dio_helper.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

 void fetchData(String cityName) async {
    emit(WeatherLoadingState());
    try {
      var response = await Diohelper.getData(
        url: '/v1/forecast.json',
        query: {
          'key' : "ac04efe7a113406eaf5184650242010",
          'q': cityName,
          'days': '7',

        },
      );
      weatherModel = WeatherModel.fromJson(response.data);
      emit(WeatherLoadedState(weatherModel!));
    } on DioException catch (e) {
      emit(WeatherFailureState(e.message ?? 'An error occurred'));
    }
  }
}

