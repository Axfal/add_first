// ignore_for_file: prefer_final_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:olx_app/Utils/toast_messages.dart';
import 'package:olx_app/model/auth_model/SignUpModel.dart';
import 'package:olx_app/view_model/route/routes_name.dart';
import '../../Utils/local_database.dart';
import '../../model/auth_model/login_model.dart';
import '../../repository/auth_repo.dart';
import 'dart:convert';

class AuthProvider with ChangeNotifier {
  AuthenticationRepository _authRepo = AuthenticationRepository();

  LoginModel? _loginModel;
  SignUpModel? _signUpModel;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> login(context, String email, String password) async {
    try {
      _loading = true;
      notifyListeners();

      Map<String, dynamic> data = {"email": email, "password": password};
      _loginModel = await _authRepo.loginApi(data);

      if (_loginModel!.success == true) {
        ToastHelper.showSuccess(_loginModel!.message!);

        final userJson = jsonEncode(_loginModel!.user!.toJson());
        await MySharedPrefs().setUserData(userJson);

        Navigator.pushNamed(context, RoutesName.dashboard);
      } else {
        ToastHelper.showError(_loginModel!.error!);
      }
    } catch (e) {
      print("Login error: $e");
      _showErrorSnackbar(context, "Something went wrong. Try again!");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(context, Map<String, dynamic> data) async {
    _loading = true;
    notifyListeners();

    try {
      _signUpModel = await _authRepo.signUpApi(data);

      if (_signUpModel != null && _signUpModel!.success != null) {
        ToastHelper.showSuccess(_signUpModel!.success!);
      } else {
        ToastHelper.showError(_signUpModel!.error!);
      }
    } catch (e) {
      print("Signup error: $e");
      _showErrorSnackbar(context, "Something went wrong. Try again!");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }
}
