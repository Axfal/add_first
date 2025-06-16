class StateModel {
  final bool error;
  final String msg;
  final CountryData data;

  StateModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      error: json['error'] ?? false,
      msg: json['msg'] ?? '',
      data: CountryData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'msg': msg,
      'data': data.toJson(),
    };
  }
}

class CountryData {
  final String name;
  final String iso3;
  final String iso2;
  final List<StateInfo> states;

  CountryData({
    required this.name,
    required this.iso3,
    required this.iso2,
    required this.states,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      name: json['name'] ?? '',
      iso3: json['iso3'] ?? '',
      iso2: json['iso2'] ?? '',
      states: (json['states'] as List)
          .map((state) => StateInfo.fromJson(state))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'iso3': iso3,
      'iso2': iso2,
      'states': states.map((s) => s.toJson()).toList(),
    };
  }
}

class StateInfo {
  final String name;
  final String stateCode;

  StateInfo({
    required this.name,
    required this.stateCode,
  });

  factory StateInfo.fromJson(Map<String, dynamic> json) {
    return StateInfo(
      name: json['name'] ?? '',
      stateCode: json['state_code'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'state_code': stateCode,
    };
  }
}
