import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/hourly_weather.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // TODO: To do
  @GET("/onecall?lat=50.431759&lon=30.517023&units=metric&exclude=current,minutely,hourly&appid=435fd89eafd6faeeb140b2b3cc23c967")
  Future<DailyWeather> getDailyWeather();

  @GET("/onecall?lat=50.431759&lon=30.517023&units=metric&exclude=current,minutely,daily&appid=435fd89eafd6faeeb140b2b3cc23c967")
  Future<HourlyWeather> getHourlyWeather();
}
