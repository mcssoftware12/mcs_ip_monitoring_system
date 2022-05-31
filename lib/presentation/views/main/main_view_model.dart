import 'package:mcs/app/app.locator.dart';
import 'package:mcs/core/params/infra_request.dart';
import 'package:mcs/domain/entities/infra_details_response_model.dart';
import 'package:mcs/domain/usecaes/get_infra_details_usecase.dart';
import 'package:stacked/stacked.dart';
import 'main_view.form.dart';

class MainViewModel extends FormViewModel{
  final infraUseCase = locator<GetInfraDetailsUseCase>();

  InfraDetailsResponseModel? _infraDetails;

  InfraDetailsResponseModel? get infraDetails => _infraDetails;

  void updateInfra(InfraDetailsResponseModel value){
    _infraDetails = value;
    notifyListeners();
  }

  void fetchInfraDetails() async {
    if(!hasDomain || domainValue == null || domainValue!.isEmpty){
      return;
    }
    final result = await runBusyFuture(
      infraUseCase(params: InfraRequestParams(domainValue!)),
    );
    result.when(
      success: (data) {
        updateInfra(data);
      },
      failure: (error) {},
    );
  }


  @override
  void setFormStatus() {

  }
}