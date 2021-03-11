import 'package:dartz/dartz.dart';
import 'package:hive_app_example/src/core/error/failures.dart';
import 'package:hive_app_example/src/core/usecases/usecase.dart';
import 'package:hive_app_example/src/features/domain/repositories/person_repository.dart';

class AddPersonUseCase implements UseCase<bool, Map<String, dynamic>>{
  final PersonRepository repository;

  AddPersonUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Map<String, dynamic> params) async {
    return  await repository.addPerson(params);
  }

}