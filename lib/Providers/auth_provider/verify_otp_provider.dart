import 'dart:convert';

import 'package:olx_app/resources/exports.dart';

class VerifyOtpProvider with ChangeNotifier {
  final _authRepo = AuthenticationRepository();

  VerifyOTPModel? _verifyOTPModel;
  VerifyOTPModel? get verifyOTPModel => _verifyOTPModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> verifyOTP(context, String email, String otp) async {
    Map<String, dynamic> data = {"email": email, "otp": otp};
    _setLoading(true);
    try {
      _verifyOTPModel = await _authRepo.verifyOTP(data);
      if (_verifyOTPModel != null &&
          _verifyOTPModel!.success == true &&
          _verifyOTPModel!.message != null) {
        ToastHelper.showSuccess(_verifyOTPModel!.message!);

        final userJson = jsonEncode(_verifyOTPModel!.user!.toJson());
        await MySharedPrefs().setUserData(userJson);

        Navigator.pushReplacementNamed(context, RoutesName.dashboard);
      } else {
        ToastHelper.showError(_verifyOTPModel!.error!);
      }
    } catch (e) {
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
