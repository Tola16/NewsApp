import 'package:dio/dio.dart';
import 'package:newsapp/models/auth%20.dart';

class AuthService {
  static Dio dio = Dio();
  static Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Login/CheckUser",
        data: {"Email": email, "Password": password},
      );
      return AuthModel.FromJson(response.data);
    } on DioException catch (dioError) {
      final details =
          dioError.response?.data ?? dioError.message ?? 'Request failed';
      throw Exception(details);
    } catch (other) {
      throw Exception("Other error: ${other.toString()}");
    }
  }

  //Two lights
  static Future<AuthModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      Response response = await dio.post(
        "https://elsewedyteam.runasp.net/api/Register/AddUser",
        data: {
          "Name": name,
          "Email": email,
          "Phone": phone,
          "Password": password,
        },
      );
      return AuthModel.FromJson(response.data);
    } on DioException catch (dioError) {
      final details =
          dioError.response?.data ?? dioError.message ?? 'Request failed';
      throw Exception(details);
    } catch (other) {
      throw Exception("Other error: ${other.toString()}");
    }
  }
}
