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



  Future<User> getUserByID(int id) async {
    var response = await _api.dio.get("Users/$id");

    return User.fromJson(response.data);
  }
}
