import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rafay_dairies_and_farms/core/utils/utils.dart';
import 'package:rafay_dairies_and_farms/src/components/round_button.dart';
import 'package:rafay_dairies_and_farms/src/login/login_provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(),
        child: Builder(builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10.0.sp),
                  child: Consumer<LoginProvider>(
                    builder: (context, Provider, child) => Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 2000,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30.sp,
                                  backgroundImage:
                                      AssetImage('lib/data/assets/logo.png'),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rafay',
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    Text(
                                      'dairies & farms',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90.h,
                          ),
                          Container(
                            width: 250.w,
                            child: TextFormField(
                              scrollPadding:
                                  EdgeInsets.fromLTRB(5.sp, 0, 5.sp, 0),
                              controller: emailController,
                              focusNode: Provider.emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Email',
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Email';
                                } else {
                                  Provider.validateEmail(emailController.text);
                                  if (Provider.isvalidEmail == false) {
                                    return 'Invalid Email';
                                  }
                                }
                                return null;
                              },
                              onFieldSubmitted: (value) {
                                Utils.fieldFocusChange(
                                  context,
                                  Provider.emailFocusNode,
                                  Provider.passwordFocusNode,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            width: 250.w,
                            child: TextFormField(
                              scrollPadding:
                                  EdgeInsets.fromLTRB(5.sp, 0, 5.sp, 0),
                              controller: passwordController,
                              focusNode: Provider.passwordFocusNode,
                              obscureText: !Provider.showPass,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Provider.passwordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    Provider.VisiblePsassword();
                                    Provider.ShowPassword();
                                    false;
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Password';
                                } else if (value != null && value.isNotEmpty) {
                                  Provider.validatePassword(
                                      passwordController.text);
                                  if (Provider.isvalidPasswrd == false) {
                                    return 'Invalid Password';
                                  }
                                }

                                return null;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          RoundButton(
                              title: 'Login',
                              width: 250,
                              loading: Provider.loading,
                              onPress: () {
                                if (_formKey.currentState!.validate()) {
                                  Provider.validateEmail(emailController.text);
                                  Provider.loginApi(context);
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
