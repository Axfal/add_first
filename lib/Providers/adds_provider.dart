// ignore_for_file: avoid_print

import 'package:olx_app/resources/exports.dart';

class AddsProvider with ChangeNotifier {
  final _bannerRepo = AddsRepo();

  List<AddsModel> _addsList = [];
  List<AddsModel> get addsList => _addsList;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getBanners() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await _bannerRepo.getBanners();
      _addsList = response.map((e) => AddsModel.fromJson(e)).toList();
    } catch (e) {
      print('Error fetching banners: $e');
      _addsList = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
