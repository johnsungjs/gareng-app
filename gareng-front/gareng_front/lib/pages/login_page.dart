import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/login_request_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

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
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          key: UniqueKey(),
          child: Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              // borderRadius: BorderRadius.only(
              //   bottomLeft: Radius.circular(100),
              //   bottomRight: Radius.circular(100),
              // ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Gareng App",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: HexColor("#283B71")),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              bottom: 20,
              top: 50,
            ),
            child: Text(
              "Login",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
            // const Icon(Icons.people),
            "username",
            "UserName",
            (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Username can't be empty";
              }
              return null;
            },
            (onSavedVal) {
              username = onSavedVal;
            },
            borderFocusColor: Colors.white,
            prefixIcon: const Icon(Icons.person),
            showPrefixIcon: true,
            prefixIconColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.white,
            hintColor: Colors.white.withOpacity(0.7),
            borderRadius: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              // const Icon(Icons.people),
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
              borderFocusColor: Colors.white,
              prefixIcon: const Icon(Icons.person),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
              obscureText: hidePassword,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                color: Colors.white,
                icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
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
                      FormHelper.showSimpleAlertDialog(context, Config.appName,
                          "Invalid Username or Password", "OK", () {
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
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "OR",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
                children: <TextSpan>[
                  TextSpan(
                    text: "Don't have an account? ",
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed("/register");
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
