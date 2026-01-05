import 'package:books_app/Core/utils/api_services.dart';
import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetItServiceLocator() {
  //creating an instance of ApiServices 
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  //creating an instance of HomeRepoImpl 
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiServices>()));
}
