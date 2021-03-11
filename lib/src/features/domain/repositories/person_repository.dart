import 'package:dartz/dartz.dart';
import 'package:hive_app_example/src/core/error/failures.dart';
import 'package:hive_app_example/src/features/domain/entities/person.dart';

abstract class PersonRepository {
 Future<Either<Failure, bool>> addPerson(Map<String, dynamic> params);
 Future<Either<Failure, List<Person>>> getPeople();
}