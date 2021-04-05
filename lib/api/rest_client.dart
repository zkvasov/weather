import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/api/api_constants.dart';
import 'package:weather_app/models/daily_weather.dart';
import 'package:weather_app/models/hourly_weather.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://api.openweathermap.org/data/2.5/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/onecall?exclude=current,minutely,hourly")
  Future<DailyWeather> getDailyWeather({
    @Query("appid") appId = ApiConstants.appId,
    @Query("lat") latitude = ApiConstants.lat,
    @Query("lon") longitude = ApiConstants.lon,
    @Query("units") units = ApiConstants.units,
  });

  @GET("/onecall?exclude=current,minutely,daily")
  Future<HourlyWeather> getHourlyWeather({
    @Query("appid") appId = ApiConstants.appId,
    @Query("lat") latitude = ApiConstants.lat,
    @Query("lon") longitude = ApiConstants.lon,
    @Query("units") units = ApiConstants.units,
  });
}
