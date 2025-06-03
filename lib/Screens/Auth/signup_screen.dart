// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_app/Providers/auth_provider/auth_provider.dart';
import 'package:olx_app/resources/color.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String selectedCountryCode = "+1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Create Your Account!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  SizedBox(height: 10),
                  const Text("Sign up to get started",
                      style: TextStyle(fontSize: 16, color: Colors.black54)),
                  SizedBox(height: 30),
                  _buildTextField(
                      usernameController, "Username", Icons.person, false),
                  SizedBox(height: 20),
                  _buildTextField(emailController, "Email", Icons.email, false,
                      keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 20),
                  _buildPhoneNumberField(),
                  SizedBox(height: 20),
                  _buildPasswordField(),
                  SizedBox(height: 20),
                  _buildConfirmPasswordField(),
                  SizedBox(height: 20),
                  _buildTextField(referralController,
                      "Referral Code (Optional)", Icons.card_giftcard, false,
                      isRequired: false),
                  SizedBox(height: 20),
                  _buildSignUpButton(),
                  _buildLoginText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: AppColor.primaryColor),
        prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor),
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey),
          onPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Password cannot be empty";
        }
        return null;
      },
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: confirmPasswordController,
      obscureText: _obscureConfirmPassword,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        labelStyle: TextStyle(color: AppColor.primaryColor),
        prefixIcon: Icon(Icons.lock, color: AppColor.primaryColor),
        suffixIcon: IconButton(
          icon: Icon(
              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey),
          onPressed: () {
            setState(() {
              _obscureConfirmPassword = !_obscureConfirmPassword;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.primaryColor, width: 2),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Confirm Password cannot be empty";
        } else if (value != passwordController.text) {
          return "Passwords do not match";
        }
        return null;
      },
    );
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: "Phone",
        labelStyle: TextStyle(color: AppColor.primaryColor),
        prefixIcon: CountryCodePicker(
          onChanged: (CountryCode countryCode) {
            selectedCountryCode = countryCode.dialCode!;
          },
          initialSelection: 'US',
          favorite: ['+92', 'PK', '+1', 'US'],
          showCountryOnly: false,
          showOnlyCountryWhenClosed: false,
          alignLeft: false,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Phone number cannot be empty";
        }
        return null;
      },
    );
  }

  Widget _buildSignUpButton() {
    final provider = Provider.of<AuthProvider>(context); // listen enabled
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: provider.loading
            ? null
            : () async {
                if (_formKey.currentState!.validate()) {
                  Map<String, dynamic> data = {
                    "user_name": usernameController.text.trim(),
                    "email": emailController.text.trim(),
                    "phone":
                        "$selectedCountryCode ${phoneController.text.trim()}",
                    "country_code": selectedCountryCode,
                    "password": passwordController.text.trim(),
                    "confirm_password": confirmPasswordController.text.trim(),
                    "device_id": "1234-5678",
                    "referral_code": "REF123"
                  };

                  await provider.signUp(context, data);
                }
              },
        child: provider.loading
            ? Center(
                child: CupertinoActivityIndicator(color: Colors.white),
              )
            : Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?",
            style: TextStyle(color: Colors.black54)),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Login",
              style: TextStyle(
                  color: AppColor.primaryColor, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon,
    bool isPassword, {
    TextInputType keyboardType = TextInputType.text,
    bool isRequired = true,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword ? _obscurePassword : false,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColor.primaryColor),
        prefixIcon: Icon(icon, color: AppColor.primaryColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColor.primaryColor, width: 2)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: (value) {
        if (isRequired && (value == null || value.isEmpty)) {
          return "$label cannot be empty";
        }
        return null;
      },
    );
  }
}
