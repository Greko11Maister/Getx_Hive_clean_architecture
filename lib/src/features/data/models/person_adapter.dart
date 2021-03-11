import 'package:hive_app_example/src/features/domain/entities/person.dart';

import 'package:hive/hive.dart';

part 'person_adapter.g.dart';

@HiveType(typeId: 1)
class PersonAdapter extends Person {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  PersonAdapter(this.name, this.age) : super(
    name: name,
    age: age
  );
}