import 'package:mcs/app/app.locator.dart';
import 'package:mcs/data/datasources/infra_api_service.dart';
import 'package:mcs/data/repositories/infra_repository_impl.dart';
import 'package:mcs/domain/repositories/infra_repository.dart';
import 'package:mcs/domain/usecaes/get_infra_details_usecase.dart';

void setupDependencies(){
  locator.registerSingleton<InfraApiService>(InfraApiService(locator()));
  locator.registerSingleton<InfraRepository>(InfraRepositoryImpl(locator()));
  locator.registerFactory<GetInfraDetailsUseCase>(() => GetInfraDetailsUseCase(locator()));
}