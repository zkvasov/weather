// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<DailyWeather> getDailyWeather(
      {appId = ApiConstants.appId,
      latitude = ApiConstants.lat,
      longitude = ApiConstants.lon,
      units = ApiConstants.units}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'appid': appId,
      r'lat': latitude,
      r'lon': longitude,
      r'units': units
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/onecall?exclude=current,minutely,hourly',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = DailyWeather.fromJson(_result.data);
    return value;
  }

  @override
  Future<HourlyWeather> getHourlyWeather(
      {appId = ApiConstants.appId,
      latitude = ApiConstants.lat,
      longitude = ApiConstants.lon,
      units = ApiConstants.units}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'appid': appId,
      r'lat': latitude,
      r'lon': longitude,
      r'units': units
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/onecall?exclude=current,minutely,daily',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = HourlyWeather.fromJson(_result.data);
    return value;
  }
}
