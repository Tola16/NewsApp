class AuthModel {
  final String msg;
  final bool status;

  AuthModel({required this.msg, required this.status});
  factory AuthModel.FromJson(Map<String, dynamic> json) {
    return AuthModel(msg: json["message"], status: json["status"]);
  }
}
