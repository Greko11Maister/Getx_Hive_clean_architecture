import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_example/src/features/data/datasource/person_local_data_source.dart';
import 'package:hive_app_example/src/features/data/models/person_adapter.dart';
import 'package:hive_app_example/src/features/data/repositories/person_repository_impl.dart';
import 'package:hive_app_example/src/features/domain/repositories/person_repository.dart';
import 'package:hive_app_example/src/features/domain/usecases/add_person_use_case.dart';
import 'package:hive_app_example/src/features/domain/usecases/get_people_use_case.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async  {

  /*
  * Use Cases
  * */

  sl.registerLazySingleton(() => AddPersonUseCase(sl()));
  sl.registerLazySingleton(() => GetPeopleUseCase(sl()));

  /*
  * Repositories
  * */
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(sl()));

  /*
  * Local DataSources
  * */
  sl.registerLazySingleton<PersonLocalDataSource>(() => PersonLocalDataSourceImpl());

  await Hive.initFlutter();
  // adapters
  Hive.registerAdapter(PersonAdapterAdapter());

  // Open Box
  await Hive.openBox<PersonAdapter>("people");
}