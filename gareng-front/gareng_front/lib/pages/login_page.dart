import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TokenController tokenController = Get.put(TokenController());

  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Padding(
          //   padding: EdgeInsets.only(left: 8, top: 60),
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.food_bank_outlined,
          //         size: 75,
          //       ),
          //       Text(
          //         "Food App",
          //         style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 45,
          //             color: customBlack),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logoFood.png'),
              radius: 100,
              backgroundColor: Colors.white,
            ),
          ),
          const Center(
            child: Text(
              'Food App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 0,
              top: 50,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: customBlack),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 20,
              top: 0,
            ),
            child: Text(
              "Sign in to continue",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: customBlack),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            "username",
            "Username",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username can't be empty";
              }
              return null;
            },
            (onSavedVal) {
              username = onSavedVal;
            },
            borderFocusColor: customBlack,
            prefixIcon: const Icon(Icons.person),
            showPrefixIcon: true,
            prefixIconColor: customBlack,
            borderColor: Colors.grey,
            textColor: customBlack,
            hintColor: customBlack.withOpacity(0.7),
            borderRadius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "password",
              "Password",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Password can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                password = onSavedVal;
              },
              borderFocusColor: customBlack,
              prefixIcon: const Icon(Icons.lock),
              showPrefixIcon: true,
              prefixIconColor: customBlack,
              borderColor: Colors.grey,
              textColor: customBlack,
              hintColor: customBlack.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: customBlack,
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: FormHelper.submitButton(
                "Login",
                () {
                  if (validateAndSave()) {
                    setState(() {
                      isAPICallProcess = true;
                    });
                    LoginRequestModel model = LoginRequestModel(
                        username: username!, password: password!);

                    APIService.login(model).then((response) {
                      setState(() {
                        isAPICallProcess = false;
                      });

                      if (response) {
                        Get.offNamed('/home');
                      } else {
                        FormHelper.showSimpleAlertDialog(
                            context,
                            Config.appName,
                            "Invalid Username or Password",
                            "OK", () {
                          Navigator.pop(context);
                        });
                      }
                    }).catchError((err) {
                      setState(() {
                        isAPICallProcess = false;
                      });
                      FormHelper.showSimpleAlertDialog(context, Config.appName,
                          "The Service has been turned off", "OK", () {
                        Navigator.pop(context);
                      });
                    });
                  }
                },
                btnColor: customBlack,
                borderColor: customBlack,
                txtColor: Colors.white,
                borderRadius: 10,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: customBlack),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                children: <TextSpan>[
                  const TextSpan(
                    text: "Don't have an account? ",
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                        color: customBlack,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed("/register");
                        // if (Get.previousRoute.isNotEmpty) {
                        //   Get.back();
                        // } else {
                        //   Get.toNamed("/register");
                        // }
                      },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
