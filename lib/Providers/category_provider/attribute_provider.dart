// ignore_for_file: avoid_print

import 'package:olx_app/model/category_model/attributes_model.dart';
import 'package:olx_app/resources/exports.dart';

class AttributeProvider with ChangeNotifier {
  final _attributesRepo = AttributesRepository();

  AttributesModel? _attributesModel;
  AttributesModel? get attributesModel => _attributesModel;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getAttributes(int categoryId) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await _attributesRepo.getAttributes(categoryId);
      _attributesModel = AttributesModel.fromJson(response);

      if (_attributesModel?.error != null) {
        ToastHelper.showError(_attributesModel!.error!);
      } else if (_attributesModel?.success == true) {
        print("Data loaded successfully");
      } else {
        ToastHelper.showError("Failed to fetch attributes for this category.");
      }
    } catch (e) {
      print("Exception in getAttributes: $e");
      ToastHelper.showError("An unexpected error occurred.");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> submitForm(dynamic data) async {
    _loading = true;
    notifyListeners();
    try {
      final response = await _attributesRepo.submitForm(data);
      if (response['success'] && response['message'] != null) {
        ToastHelper.showSuccess(response['message']);
      } else {
        ToastHelper.showError(response['message']);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
