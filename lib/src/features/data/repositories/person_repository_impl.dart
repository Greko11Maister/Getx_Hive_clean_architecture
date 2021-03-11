import 'package:dartz/dartz.dart';
import 'package:hive_app_example/src/core/error/failures.dart';
import 'package:hive_app_example/src/features/data/datasource/person_local_data_source.dart';
import 'package:hive_app_example/src/features/data/models/person_adapter.dart';
import 'package:hive_app_example/src/features/domain/entities/person.dart';
import 'package:hive_app_example/src/features/domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
    final PersonLocalDataSource localDataSource;

  PersonRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, bool>> addPerson(Map<String, dynamic> params) async {
    try{
      PersonAdapter personAdapter = PersonAdapter(params["name"], params["age"]);
      await localDataSource.addPerson(personAdapter);
      return Right(true);
    }catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Person>>> getPeople() async {
    try{
     final res =  await localDataSource.getPeople();
      return Right(res);
    }catch(error){
      return Left(ServerFailure(message: error.toString()));
    }
  }

}