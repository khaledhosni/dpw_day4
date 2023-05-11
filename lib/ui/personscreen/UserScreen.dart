import 'dart:convert';
import 'dart:io';
import 'dart:math';
//https://618ebc2e50e24d0017ce141f.mockapi.io/
import 'package:dio/dio.dart';
import 'package:dpw_day4/data/local/AppDatabase.dart';
import 'package:dpw_day4/data/local/model/Person.dart';
import 'package:dpw_day4/data/remote/model/User.dart';
import 'package:dpw_day4/data/remote/service/UserService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:json_theme/json_theme.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/appainter_theme_dpw.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme));

}

class MyApp extends StatelessWidget {

  final theme;

  MyApp(this.theme);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: theme,
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

  List<User>? listUsers;

  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: ()async{

                setState(() {
                  isLoading=true;
                });

                var userService=UserService();

                var listOfusers=await userService.getAllUsers();

                setState(() {
                  listUsers=listOfusers;
                  isLoading=false;
                });




              }, child: Text("Get All Users")),

              ElevatedButton(onPressed: ()async{

                var userService=UserService();

                var u= await userService.getUserByID(1);
                //
                // final dio=Dio();
                //
                // dio.options.baseUrl="https://618ebc2e50e24d0017ce141f.mockapi.io/";
                // dio.options.connectTimeout= Duration(seconds: 15);
                //
                //
                // var respose =await dio.get("Users/1");
                // User u=User.fromJson(respose.data);

                print(u.name);
                    //print(u.name);


                  }, child: Text("Get Users")),
              ElevatedButton(onPressed: ()async{

                var userService=UserService();

                var u= await userService.addUser(User(name: "Khaled Hosni",country: "Egypt"));
                u==null? Fluttertoast.showToast(msg: "Error in adding new user")
                    : Fluttertoast.showToast(msg: " user has been added with ${u.id}");

              }, child: Text("Add User")),
              ElevatedButton(onPressed: ()async{

                var userService=UserService();


               var imagefile = await pickImage();

               if(imagefile==null){
                 Fluttertoast.showToast(msg: "You didn't select any file");
                 return;
               }



               var bytes=await imagefile.readAsBytes();

               final data=Base64Encoder().convert(bytes);
                print(data);
                  }, child: Text("Upload Image ")),
            ],
          ),

          isLoading? Center(
            child: CircularProgressIndicator(),
          )
              : Expanded(child: ListView.builder(
            shrinkWrap: true,
            itemCount: listUsers?.length,
            itemBuilder: (context, index) {
              var user=listUsers![index];

              return Card(
                child: ListTile(
                  leading: Image.network(user.avatar.toString(),width: 80,height: 80,),
                  title: Text(user.name.toString()),
                ),
              );

          },))
        ],
      ),

    );
  }

  Future<File?> pickImage()async{


     final picker= ImagePicker();
     XFile? xfile=await picker.pickImage(source: ImageSource.camera);

     if(xfile!=null)
       return File(xfile.path);


     return null;
  }
}
