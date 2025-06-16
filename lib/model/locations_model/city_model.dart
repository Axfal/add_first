class CityModel {
  bool? error;
  String? msg;
  List<String>? data;

  CityModel({this.error, this.msg, this.data});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      error: json['error'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] != null ? List<String>.from(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'msg': msg,
      'data': data,
    };
  }
}
