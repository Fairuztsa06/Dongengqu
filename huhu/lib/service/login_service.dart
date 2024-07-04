import '../helpers/user_info.dart';

class LoginService {
  Future<bool> login(String username, String password) async {
    try {
      bool isLogin = false;
      if (username == 'admin' && password == 'admin') {
        await UserInfo().setToken("admin");
        await UserInfo().setUserID("1");
        await UserInfo().setUsername("admin");
        isLogin = true;
      }
      return isLogin;
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }
}
