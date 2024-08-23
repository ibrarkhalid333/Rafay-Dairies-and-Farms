import 'dart:async';
import 'dart:io';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rafay_dairies_and_farms/core/utils/utils.dart';
import 'package:rafay_dairies_and_farms/data/app_exceptions.dart';
import 'package:rafay_dairies_and_farms/src/Home/home.dart';
import 'package:rafay_dairies_and_farms/src/login/login_repository.dart';
import 'package:rafay_dairies_and_farms/src/login/user_prefrences.dart';
import 'login_model.dart';

class LoginProvider extends ChangeNotifier {
  bool isvalidEmail = false;
  bool isvalidPasswrd = false;
  bool loading = false;
  String email = '';
  String password = '';
  String userError = '';
  final _api = LoginRepository();
  final userPreferences = UserPrefrences();
  final exceptions = AppExeptions();
  bool passwordVisible = false;
  bool showPass = false;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool validateEmail(String email) {
    isvalidEmail = EmailValidator.validate(email);
    setEmail(email);
    return isvalidEmail;
  }

  bool validatePassword(String password) {
    if (password.length >= 8) {
      isvalidPasswrd = true;
      setPassword(password);
    } else {
      isvalidPasswrd = false;
    }
    return isvalidPasswrd;
  }

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String pass) {
    password = pass;
  }

  VisiblePsassword() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  ShowPassword() {
    showPass = !showPass;
    notifyListeners();
  }

  void setUserError(String err) {
    userError = err;
  }

  Future<void> loginApi(BuildContext context) async {
    loading = true;
    notifyListeners();

    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    try {
      final response = await _api.LoginApi(data);
      final jsonresponse = LoginModel.fromJson(response);
      if (jsonresponse.success == true) {
        await userPreferences.saveUser(jsonresponse);
        Utils.ShowSnackBar(context, 'Login', 'Login Successfully');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ),
        );
      } else {
        if (jsonresponse.success == false) {
          Utils.ErrrorSnackBar(
              context, 'Login Error', 'Incorrect Email or Password');
        }
      }
    } catch (error) {
      String errorMessage;
      if (error.runtimeType == HttpException) {
        errorMessage = 'Network error occurred. Please try again.';
      } else if (error.runtimeType == SocketException) {
        errorMessage = 'No Internet Connection';
      } else if (error.runtimeType == ServerExceptions) {
        errorMessage = 'Server Not Found ';
      } else if (error.runtimeType == TimeoutException) {
        errorMessage = 'Request Timeout ';
      } else if (error.runtimeType == ClientException) {
        errorMessage =
            'Failed to connect, Please check your Internet Connection ';
      } else {
        errorMessage = 'Unexpected Error ${error.toString()}';
      }

      setUserError(errorMessage);
      userError = errorMessage;
      Utils.ErrrorSnackBar(context, 'Login Error', userError);
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
