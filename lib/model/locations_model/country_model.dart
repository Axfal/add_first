class CountryModel {
  bool? error;
  String? msg;
  List<Data>? data;

  CountryModel({this.error, this.msg, this.data});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      error: json['error'] as bool?,
      msg: json['msg'] as String?,
      data: json['data'] != null
          ? (json['data'] as List).map((e) => Data.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'msg': msg,
      if (data != null) 'data': data!.map((e) => e.toJson()).toList(),
    };
  }
}

class Data {
  String? name;
  String? iso2;
  double? long;
  double? lat;

  Data({this.name, this.iso2, this.long, this.lat});

  factory Data.fromJson(Map<String, dynamic> json) {
    double? parseDouble(dynamic value) {
      if (value == null) return null;
      if (value is int) return value.toDouble();
      if (value is double) return value;
      if (value is String) return double.tryParse(value);
      return null;
    }

    return Data(
      name: json['name'] as String?,
      iso2: json['iso2'] as String?,
      long: parseDouble(json['long']),
      lat: parseDouble(json['lat']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iso2': iso2,
      'long': long,
      'lat': lat,
    };
  }
}
