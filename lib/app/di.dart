import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/app/app_prefs.dart';
import 'package:store/data/data_source/remote_data_source.dart';
import 'package:store/data/network/app_api.dart';
import 'package:store/data/network/dio_factory.dart';
import 'package:store/data/network/network_info.dart';
import 'package:store/data/repository/repository_implementer.dart';
import 'package:store/domain/repository/repository.dart';
import 'package:store/domain/usecase/login_usecase.dart';
import 'package:store/presentation/login/login_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  //shared preference instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  //app preference instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  //network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(instance()));

  instance.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  //dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  //app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));
//repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImplementer(instance(), instance()));
}

initLoginModel() {

    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));

}
