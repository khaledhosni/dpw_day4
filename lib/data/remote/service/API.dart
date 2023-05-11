
import 'package:dio/dio.dart';


class API {
  static final API instance = API._();
  Dio dio= new Dio();

  factory API() {
    return instance;
  }

  API._(){
    dio.options.baseUrl="https://618ebc2e50e24d0017ce141f.mockapi.io/";
    dio.options.connectTimeout= Duration(seconds: 15);
  }
}