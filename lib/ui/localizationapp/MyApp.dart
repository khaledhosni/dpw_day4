import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en') , Locale("ar")],
        path: "langs",
        fallbackLocale: Locale("en"),

    ),
  );


}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _local=Locale('en');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'My App',
      home: Scaffold(

        appBar: AppBar(
          title: Text("title".tr()),
        ),

        body: Column(
          children: [
            Text("welcome_message".tr()),
            ElevatedButton(onPressed: ()async{

              context.setLocale(Locale('en'));

              setState(() {
             //   _local=Locale("en");
              });


            }, child: Text("English")),
            ElevatedButton(onPressed: ()async{


            // await EasyLocalization.of(context)?.setLocale(Locale("ar"));

             context.setLocale(Locale('ar'));

             setState(() {
              // _local=Locale("ar");
             });

            }, child: Text("عربي")),

          ],

        ),

        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Text("child")),

              ListTile(
                title: GestureDetector(

                    child: Text("Change Language"),

                  onTap: (){

                      if(context.locale.languageCode=='en')
                       context.setLocale(Locale('ar'));
                      else
                        context.setLocale(Locale('en'));

                  },


                ),
              )

            ],

          ),

        ),
      ),

    )

      ;
  }
}
