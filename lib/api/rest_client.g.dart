// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.openweathermap.org/data/2.5/';
  }

  final Dio _dio;

  String? baseUrl;

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
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DailyWeather>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/onecall?exclude=current,minutely,hourly',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DailyWeather.fromJson(_result.data!);
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
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HourlyWeather>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/onecall?exclude=current,minutely,daily',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = HourlyWeather.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
