import 'package:hive/hive.dart';
import 'package:hive_app_example/src/features/data/models/person_adapter.dart';

abstract class PersonLocalDataSource {
 Future<bool> addPerson(PersonAdapter params);

 Future<List<PersonAdapter>> getPeople();

}

class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  @override
  Future<bool> addPerson(PersonAdapter params) async  {
    try{
      Box<PersonAdapter> personBox = Hive.box<PersonAdapter>("people");
      personBox.add(params);
      return true;
    }catch(error){
      throw error;
    }
  }

  @override
  Future<List<PersonAdapter>> getPeople() async {
    try{
      Box<PersonAdapter> personBox = Hive.box<PersonAdapter>("people");
      return personBox.values.toList();
    }catch(error){
      throw error;
    }
  }

}