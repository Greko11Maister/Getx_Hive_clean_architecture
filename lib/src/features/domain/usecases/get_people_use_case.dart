import 'package:dartz/dartz.dart';
import 'package:hive_app_example/src/core/error/failures.dart';
import 'package:hive_app_example/src/core/usecases/usecase.dart';
import 'package:hive_app_example/src/features/domain/entities/person.dart';
import 'package:hive_app_example/src/features/domain/repositories/person_repository.dart';

class GetPeopleUseCase implements UseCase<List<Person>,NoParams>{
  final PersonRepository repository;

  GetPeopleUseCase(this.repository);

  @override
  Future<Either<Failure, List<Person>>> call(NoParams params) async {
    return await repository.getPeople();
  }

}