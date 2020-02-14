import 'package:get_it/get_it.dart';
import 'package:school_management/Services/navigationServices.dart';

GetIt sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton(() => NavigationServices());
}
