// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'infra_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _InfraApiService implements InfraApiService {
  _InfraApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.approject.me';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<InfraDetailsResponseModel>> fetchInfraDetails(
      domain) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'domain': domain};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<InfraDetailsResponseModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/api/infra-details',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InfraDetailsResponseModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
