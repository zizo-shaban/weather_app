
import 'package:dio/dio.dart';

class Diohelper {
  static Dio dio = Dio();

  static initDio() {
    (
      dio=Dio(  BaseOptions(
          baseUrl: 'https://api.weatherapi.com',
          receiveDataWhenStatusError: true,

        )
      )
    );
  }
  static Future<Response> getData(
      { required String url, required Map<String, dynamic> query,}) async {
    return await dio.get(url, queryParameters: query,);
  }
}