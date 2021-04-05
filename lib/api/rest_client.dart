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
    @Query("appid") String appId = ApiConstants.appId,
    @Query("lat") double latitude = ApiConstants.lat,
    @Query("lon") double longitude = ApiConstants.lon,
    @Query("units") String units = ApiConstants.units,
  });

  @GET("/onecall?exclude=current,minutely,daily")
  Future<HourlyWeather> getHourlyWeather({
    @Query("appid") String appId = ApiConstants.appId,
    @Query("lat") double latitude = ApiConstants.lat,
    @Query("lon") double longitude = ApiConstants.lon,
    @Query("units") String units = ApiConstants.units,
  });
}
