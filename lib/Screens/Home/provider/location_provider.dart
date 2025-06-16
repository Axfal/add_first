// ignore_for_file: avoid_print

import 'package:olx_app/resources/exports.dart';

class LocationProvider with ChangeNotifier {
  final _service = LocationRepo();

  CountryModel? _countryModel;
  CountryModel? get countryModel => _countryModel;

  StateModel? _stateModel;
  StateModel? get stateModel => _stateModel;

  CityModel? _cityModel;
  CityModel? get cityModel => _cityModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getLocation(String status) async {
    _isLoading = true;
    notifyListeners();

    try {
      switch (status) {
        case 'country':
          final response = await _service.getCountries();
          if (response['error'] == false && response['msg'] != null) {
            print('Country API response: ${response['msg']}');
            _countryModel = CountryModel.fromJson(response);
          }
          break;

        case 'state':
          final response = await _service.getStates();
          if (response['error'] == false && response['msg'] != null) {
            _stateModel = StateModel.fromJson(response);
          }
          break;

        case 'city':
          final response = await _service.getCity();
          if (response['error'] == false && response['msg'] != null) {
            _cityModel = CityModel.fromJson(response);
          }
          break;

        default:
          print("Invalid location status: $status");
      }
    } catch (e) {
      print('Error in getLocation: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
