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

  Future<Map<String, dynamic>> getStates() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppUrl.state);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getCity() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppUrl.city);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
