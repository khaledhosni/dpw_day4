import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  var k= GlobalObjectKey("value");
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      home: Scaffold(
          body: SliderDrawer(
            key:k ,
            appBar: SliderAppBar(
                appBarColor: Colors.white,
                title: Text("title",
                    style: const TextStyle( fontSize: 22, fontWeight: FontWeight.w700))),
            slider: Container(color: Colors.red),
            child: Container(color: Colors.amber),
          )
      ),
    );
  }

 

}
