import 'package:newsapp/models/auth%20.dart';
import 'package:newsapp/services/authservice.dart';

class Authprovider {
  AuthModel? auth;

  Future<bool> userLogin({
    required String email,
    required String password,
  }) async {
    final response = await AuthService.login(email: email, password: password);
    auth = response;
    return response.status;
  }

  Future<bool> userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await AuthService.register(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );
    auth = response;
    return response.status;
  }
}
