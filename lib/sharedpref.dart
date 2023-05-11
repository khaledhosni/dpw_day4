import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          ElevatedButton(onPressed: () async{
           SharedPreferences pref=await SharedPreferences.getInstance();

           pref.setString("accesstoken", "jnfekiufhio3ojiopld");
           pref.setBool("darkmode", false);

          }, child: Text('Save Data')),
          ElevatedButton(onPressed: ()async{

            var pref=await SharedPreferences.getInstance();

            var token=pref.getString("accesstoken");
            var darkmode=pref.getBool("darkmode");

            Fluttertoast.showToast(msg: '$token    $darkmode');

          }, child: Text('Get Data')),
        ],
      ),
    );
  }
}
