import 'package:dpw_day4/data/local/model/Person.dart';
import 'package:floor/floor.dart';

@dao
abstract class PersonDao{

  @Query("Select * From Person")
  Future<List<Person>> getAllPersons();


  @Query('SELECT * FROM Person WHERE id = :id')
   Future<Person?> findPersonById(int id);

  @insert
  Future<void> addPerson(Person p);

}