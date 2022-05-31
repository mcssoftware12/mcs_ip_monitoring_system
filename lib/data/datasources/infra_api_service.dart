import 'package:dio/dio.dart';
import 'package:mcs/core/resources/api_result.dart';
import 'package:mcs/core/utils/constants.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'infra_api_service.g.dart';


@RestApi(baseUrl: kBaseUrl)
abstract class InfraApiService{

  factory InfraApiService(Dio dio, {String? baseUrl}) = _InfraApiService;

  @GET(kInfraUrl)
  Future<HttpResponse<InfraDetailsResponseModel>> fetchInfraDetails(
    @Query("domain") String domain
  );
}