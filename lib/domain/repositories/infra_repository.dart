import 'package:mcs/core/params/infra_request.dart';
import 'package:mcs/core/resources/api_result.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:retrofit/dio.dart';
import 'package:stacked/stacked_annotations.dart';

abstract class InfraRepository {
  Future<ApiResult<InfraDetailsResponseModel>> fetchInfraDetails(
      InfraRequestParams params);
}
