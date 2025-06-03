// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_app/resources/color.dart';
import 'package:olx_app/resources/exports.dart';
import 'package:olx_app/view_model/route/routes_name.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../Providers/auth_provider/verify_otp_provider.dart';

class ForgotPasswordPinCodeScreen extends StatefulWidget {
  final String email;

  const ForgotPasswordPinCodeScreen({super.key, required this.email});

  @override
  State<ForgotPasswordPinCodeScreen> createState() =>
      _ForgotPasswordPinCodeScreenState();
}

class _ForgotPasswordPinCodeScreenState
    extends State<ForgotPasswordPinCodeScreen> {
  final pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.security_rounded,
                    size: 100, color: AppColor.primaryColor),
                SizedBox(height: 30),
                Text(
                  "Enter Pin Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "A 6-digit verification code has been sent to your email. Enter the code below to reset your password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 30),

                // Pin Code Fields
                PinCodeTextField(
                  controller: pinCodeController,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.grey[100],
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.grey[200],
                    activeColor: AppColor.primaryColor,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColor.primaryColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (value) {
                    print("Completed Pin: $value");
                  },
                  onChanged: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () async {
                    final provider =
                        Provider.of<VerifyOtpProvider>(context, listen: false);

                    await provider.verifyOTP(
                        context, widget.email, pinCodeController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Consumer<VerifyOtpProvider>(
                    builder: (context, provider, child) {
                      return provider.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CupertinoActivityIndicator(
                                  color: Colors.white),
                            )
                          : Text(
                              "Verify Code",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                    },
                  ),
                ),

                SizedBox(height: 20),

                // Resend Code Text Button
                TextButton(
                  onPressed: () {
                    // Logic for resending the code
                  },
                  child: Text(
                    "Resend Code",
                    style:
                        TextStyle(color: AppColor.primaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
