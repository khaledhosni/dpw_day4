
import 'package:floor/floor.dart';

@Entity()
class Person{
  @PrimaryKey()
  final int id;
  final String name;

  Person(this.id, this.name);
}