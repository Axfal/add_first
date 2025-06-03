// ignore_for_file: prefer_final_fields

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/auth_model/SignUpModel.dart';
import '../model/auth_model/login_model.dart';
import '../model/auth_model/sigin_in_otp_model.dart';
import '../model/auth_model/verify_otp_model.dart';
import '../resources/app_urls.dart';

class AuthenticationRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<LoginModel> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.signIn, data);
      return LoginModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
  Future<SignUpModel> signUpApi(Map<String, dynamic> data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.signUp, data);
      return SignUpModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
  Future<SignInOTPModel> signInOTP(Map<String, dynamic> data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.signInOTP, data);
      return SignInOTPModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
  Future<VerifyOTPModel> verifyOTP(Map<String, dynamic> data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.verifyOTP, data);
      return VerifyOTPModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
