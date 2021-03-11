import 'package:equatable/equatable.dart';

class Person extends Equatable{
  final String name;
  final int age;

  Person({this.name, this.age});

  @override
  List<Object> get props => [name, age];

}