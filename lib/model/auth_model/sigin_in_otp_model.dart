class SignInOTPModel {
  String? success;
  String? error;

  SignInOTPModel({this.success, this.error});

  SignInOTPModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (success != null) data['success'] = success;
    if (error != null) data['error'] = error;
    return data;
  }
}
