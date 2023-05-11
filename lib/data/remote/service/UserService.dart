import 'package:dpw_day4/data/remote/model/User.dart';
import 'package:dpw_day4/data/remote/service/API.dart';

class UserService {
  var _api = API();

  Future<User> getUserByID(int id) async {
    var response = await _api.dio.get("Users/$id");

    return User.fromJson(response.data);
  }

  Future<List<User>> getAllUsers() async {
    var listOfUser = <User>[];

    var response = await _api.dio.get("Users");

    List data = response.data;

    data.forEach((userJson) {
      var u = User.fromJson(userJson);
      listOfUser.add(u);
    });
    return listOfUser;
  }



  Future<User> getUserByNameCountry(String name,String country) async {

   // var response = await _api.dio.get("Users?name=$name&country=$country");


    var response = await _api.dio.get("Users", queryParameters: {'name':name, 'country':country});
    return User.fromJson(response.data);
  }

  Future<User?>  addUser(User u) async{

      var response = await _api.dio.post("Users", data: u.toJson());

    if(response.statusCode==201)
      return User.fromJson(response.data);
    return null;
  }


}
