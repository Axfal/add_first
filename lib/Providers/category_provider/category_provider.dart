// ignore_for_file: avoid_print

import 'package:olx_app/resources/exports.dart';

class CategoryProvider with ChangeNotifier {
  final _categoryRepo = CategoryRepo();
  CategoryModel? _getCategory;
  CategoryModel? get getCategory => _getCategory;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCategories() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _categoryRepo.getCategories();
      if (response["success"] == true && response["categories"] != null) {
        _getCategory = CategoryModel.fromJson(response);
      } else {
        ToastHelper.showError("Error while fetching the Categories");
      }
    } catch (e) {
      print("error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
