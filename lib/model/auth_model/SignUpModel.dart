class SignUpModel {
  final String? success;
  final String? error;
  final String? userId;

  SignUpModel({
    this.success,
    this.error,
    this.userId,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      success: json['success'],
      error: json['error'],
      userId: json['user_id'],
    );
  }

  bool get isSuccess => success != null && error == null;
}
