import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/data/rest_client.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<RestClient>(RestClient(getIt.get<Dio>()));
}