import 'dart:math';
//https://618ebc2e50e24d0017ce141f.mockapi.io/
import 'package:dpw_day4/data/local/AppDatabase.dart';
import 'package:dpw_day4/data/local/model/Person.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Home(),
          ),
        ),
      ),
    );
  }
}


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{

                final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

                var personDao=database.personDao;
                var id=Random().nextInt(100000);
                var person=Person(id, "Person $id");
                personDao.addPerson(person);

              }, child: Text("Add Person")),

              ElevatedButton(onPressed: ()async{

                final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

                var personDao=database.personDao;

                List<Person> l=await personDao.getAllPersons();

                l.forEach((element) {
                  print('Person is [${element.id} ${element.name}]');
                    });
              }, child: Text("Get Person")),
            ],
          )
        ],
      ),

    );
  }
}
