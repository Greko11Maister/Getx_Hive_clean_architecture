import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_app_example/src/core/usecases/usecase.dart';
import 'package:hive_app_example/src/features/domain/entities/person.dart';
import 'package:hive_app_example/src/features/domain/usecases/add_person_use_case.dart';
import 'package:hive_app_example/src/features/domain/usecases/get_people_use_case.dart';
import 'package:meta/meta.dart';
class PersonController extends GetxController{
  final AddPersonUseCase _addPersonUseCase;
  final GetPeopleUseCase _getPeopleUseCase;
  RxList<Person> people = <Person>[].obs;
  PersonController({
    @required AddPersonUseCase addPersonUseCase,
    @required GetPeopleUseCase getPeopleUseCase,
}): assert(addPersonUseCase != null), assert(getPeopleUseCase != null)
 , _addPersonUseCase =  addPersonUseCase,
  _getPeopleUseCase = getPeopleUseCase;


  Future<void> addPerson() async{
    Map<String, dynamic> person = {"name": "Gregory", "age": 26};
    final res = await _addPersonUseCase.call(person);
    res.fold((l) {
      log("Ha ocurrido un error :$l");
      Get.snackbar("Error", l.toString(), backgroundColor: Colors.red);
    }, (r)  {
      log("Registro exitoso :$r");
      loadPeople();
      Get.snackbar("Exitoso", r.toString(), backgroundColor: Colors.green);
    });
  }

  Future<void> loadPeople() async{
    final res = await _getPeopleUseCase.call(NoParams());
    res.fold((l) {
      log("Ha ocurrido un error :$l");
      Get.snackbar("Error", l.toString(), backgroundColor: Colors.red);
    }, (r)  {
      this.people.clear();
     this.people.addAll(r);
    });
  }

  @override
  void onReady() {
    loadPeople();
    super.onReady();
  }
}