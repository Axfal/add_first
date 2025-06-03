import '../resources/exports.dart';

class AttributesRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<Map<String, dynamic>> getAttributes(int categoryId) async {
    final response = await _apiServices
        .getGetApiResponse("${AppUrl.getAttribute}$categoryId");
    return response;
  }

  Future<Map<String, dynamic>> submitForm(dynamic data) async {
    final response = await _apiServices.getPostMultipartRequestApiResponse(
        AppUrl.submitForm, data);
    return response;
  }
}
