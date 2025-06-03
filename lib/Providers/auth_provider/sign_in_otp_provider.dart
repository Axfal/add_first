import 'package:flutter/cupertino.dart';
import 'package:olx_app/Utils/toast_messages.dart';
import 'package:olx_app/repository/auth_repo.dart';
import '../../model/auth_model/sigin_in_otp_model.dart';

class SignInOtpProvider with ChangeNotifier {
  final _authRepo = AuthenticationRepository();

  SignInOTPModel? _signInOTPModel;
  SignInOTPModel? get signInOTPModel => _signInOTPModel;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> signInOtp(String email) async {
    Map<String, dynamic> data = {"email": email};
    _setLoading(true);
    try {
      _signInOTPModel = await _authRepo.signInOTP(data);

      if (_signInOTPModel?.success != null) {
        ToastHelper.showSuccess(_signInOTPModel!.success!);
      } else if (_signInOTPModel?.error != null) {
        ToastHelper.showError(_signInOTPModel!.error!);
      } else {
        ToastHelper.showError("Unknown response from server.");
      }
    } catch (e) {
      ToastHelper.showError("An error occurred: ${e.toString()}");
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
