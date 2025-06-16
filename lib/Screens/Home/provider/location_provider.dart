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

  String _selectedCountry = '';
  String get selectedCountry => _selectedCountry;

  String _selectedState = '';
  String get selectedState => _selectedState;

  String _selectedCity = '';
  String get selectedCity => _selectedCity;

  void setCountry(String country) {
    _selectedCountry = country;
    notifyListeners();
  }

  void setState(String state) {
    _selectedState = state;
    notifyListeners();
  }

  void setCity(String city) {
    _selectedCity = city;
    notifyListeners();
  }

  Future<void> getLocation(String status,
      {String? country, String? state}) async {
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
          if (country != null && country != '') {
            final response = await _service.getStates(country);

            if (response['error'] == false && response['msg'] != null) {
              _stateModel = StateModel.fromJson(response);
            }
          }
          break;

        case 'city':
          if (state != null && state != '') {
            final response = await _service.getCity(state);

            if (response['error'] == false && response['msg'] != null) {
              _cityModel = CityModel.fromJson(response);
            }
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
