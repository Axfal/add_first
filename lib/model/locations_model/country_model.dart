class CountryModel {
  bool? error;
  String? msg;
  List<Data>? data;

  CountryModel({this.error, this.msg, this.data});

  CountryModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? iso2;
  double? long;
  double? lat;

  Data({this.name, this.iso2, this.long, this.lat});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    iso2 = json['iso2'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['iso2'] = this.iso2;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}
