import 'package:mcs/core/params/infra_request.dart';
import 'package:mcs/core/resources/api_result.dart';
import 'package:mcs/core/usecase/usecase.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:mcs/domain/repositories/infra_repository.dart';
import 'package:stacked/stacked_annotations.dart';

class GetInfraDetailsUseCase
    extends UseCase<ApiResult<InfraDetailsResponseModel>, InfraRequestParams> {
  final InfraRepository? repository;

  GetInfraDetailsUseCase(@factoryParam this.repository);

  @override
  Future<ApiResult<InfraDetailsResponseModel>> call(
      {InfraRequestParams? params}) {
    return repository!.fetchInfraDetails(params!);
  }
}
