import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_app_example/src/features/app/presentation/controllers/person_controller.dart';

import '../../../../../../injection_container.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  PersonController _personController;
  @override
  Widget build(BuildContext context) {
    _personController = PersonController(addPersonUseCase: sl(), getPeopleUseCase: sl());
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Column(children: [
        GetBuilder<PersonController>(
            init: _personController,
            builder: (_){
            return Obx((){
              return Expanded(
                child: ListView.builder(
                    itemCount: _.people.length,
                    itemBuilder: (context, i){
                  return ListTile(
                    leading: Text("$i"),
                    title: Text(_.people[i].name),
                    subtitle: Text("Edad: ${_.people[i].age}"),
                  );
                }),
              );
            });
        }),
        ElevatedButton(onPressed: _personController.addPerson, child: Text("Agregar"))
      ],)),
    );
  }
}
