import '../resources/exports.dart';

class AddsRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<List<Map<String, dynamic>>> getBanners() async {
    final response = await _apiServices.getGetApiResponse(AppUrl.getBanners);

    if (response is List) {
      return response.map<Map<String, dynamic>>((item) {
        return item as Map<String, dynamic>;
      }).toList();
    } else {
      throw Exception('Unexpected response format: Expected a list');
    }
  }
}
