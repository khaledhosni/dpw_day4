import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

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

  var dateController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon:Icon(Icons.date_range) ,
          border: OutlineInputBorder(),
          labelText: 'your date of birth',
        ),
        controller: dateController,

          readOnly: true,
        onTap: ()async{

        var datetime = await showRoundedDatePicker(context: context);

        print(datetime);

        dateController.text='${datetime?.year}/${datetime?.month}/${datetime?.day} ';
        },
      ),
    )
      ;
  }
}

