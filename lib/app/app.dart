import 'package:dio/dio.dart';
import 'package:mcs/presentation/views/main/main_view.dart';
import 'package:mcs/presentation/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView),
  MaterialRoute(page: MainView, initial: true),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: Dio)
])
class App {}
