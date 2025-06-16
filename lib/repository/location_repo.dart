// ignore_for_file: prefer_final_fields
import 'package:olx_app/resources/exports.dart';

class LocationRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> getCountries() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppUrl.country);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getStates(String country) async {
    try {
      final response =
          await _apiServices.getGetApiResponse(AppUrl.state + country);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCity(String state) async {
    try {
      final response =
          await _apiServices.getGetApiResponse(AppUrl.city + state);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
