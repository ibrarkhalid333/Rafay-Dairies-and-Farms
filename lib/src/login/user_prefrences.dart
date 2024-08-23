import 'package:rafay_dairies_and_farms/src/login/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  String? Token;
  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModel.token.toString());
    return true;
  }

  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    Token = token;
    return LoginModel(token: token);
  }

  Future<bool> RemoveUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
