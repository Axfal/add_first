// ignore_for_file: prefer_final_fields
import 'package:olx_app/resources/exports.dart';

class CategoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> getCategories() async {
    try {
      final response = await _apiServices.getGetApiResponse(AppUrl.getCategory);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
