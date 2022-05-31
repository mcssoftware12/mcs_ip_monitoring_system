import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mcs/core/params/infra_request.dart';
import 'package:mcs/core/resources/api_result.dart';
import 'package:mcs/core/resources/network_exceptions.dart';

import 'package:mcs/data/datasources/infra_api_service.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:mcs/domain/repositories/infra_repository.dart';
import 'package:stacked/stacked_annotations.dart';

class InfraRepositoryImpl extends InfraRepository {

  final InfraApiService? service;

  InfraRepositoryImpl(@factoryParam this.service);

  @override
  Future<ApiResult<InfraDetailsResponseModel>> fetchInfraDetails(
      InfraRequestParams params) async {
    try {
      final httpResponse = await service!.fetchInfraDetails(params.domain);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return ApiResult<InfraDetailsResponseModel>.success(httpResponse.data);
      }
      return ApiResult<InfraDetailsResponseModel>.failure(
        NetworkExceptions.getDioException(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
            type: DioErrorType.response,
          ),
        ),
      );
    } on DioError catch (e) {
      return ApiResult<InfraDetailsResponseModel>.failure(
          NetworkExceptions.getDioException(e));
    }
  }
}
