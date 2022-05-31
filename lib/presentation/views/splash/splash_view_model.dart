import 'package:mcs/app/app.locator.dart';
import 'package:mcs/core/params/infra_request.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:mcs/domain/usecaes/get_infra_details_usecase.dart';
import 'package:stacked/stacked.dart';

class SplashViewModel extends BaseViewModel {
  final infraUseCase = locator<GetInfraDetailsUseCase>();

  List<InfraDetails>? _infraDetails;

  List<InfraDetails>? get infraDetails => _infraDetails;

  void updateInfra(List<InfraDetails> value){
    _infraDetails = value;
    notifyListeners();
  }

  void fetchInfraDetails() async {
    final result = await runBusyFuture(
      infraUseCase(params: InfraRequestParams('eccouncil.org')),
    );
    result.when(
      success: (data) {
        updateInfra(data.data!);
      },
      failure: (error) {},
    );
  }
}
