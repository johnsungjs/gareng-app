import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TokenController tokenController = Get.put(TokenController());

  bool isAPICallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? username;
  String? password;
  String? address;
  String? gender;
  int? age;
  String? email;

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
            child: _registerUI(context),
          ),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
        ),
      ),
    );
  }

  Widget _registerUI(BuildContext context) {
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
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          ),
          FormHelper.inputFieldWidget(
            context,
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
              prefixIcon: const Icon(Icons.password),
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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "address",
              "Address",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Address can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                address = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIcon: const Icon(Icons.person_pin),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "gender",
              "Gender",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Gender can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                gender = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIcon: const Icon(Icons.person_pin),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "age",
              "Age",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Age can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                age = int.parse(onSavedVal);
              },
              isNumeric: true,
              borderFocusColor: Colors.white,
              prefixIcon: const Icon(Icons.add_task_outlined),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: FormHelper.inputFieldWidget(
              context,
              "email",
              "Email",
              (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Email can't be empty";
                }
                return null;
              },
              (onSavedVal) {
                email = onSavedVal;
              },
              borderFocusColor: Colors.white,
              prefixIcon: const Icon(Icons.mail),
              showPrefixIcon: true,
              prefixIconColor: Colors.white,
              borderColor: Colors.white,
              textColor: Colors.white,
              hintColor: Colors.white.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
              "Sign Up",
              () {
                if (validateAndSave()) {
                  setState(() {
                    isAPICallProcess = true;
                  });

                  RegisterRequestModel model = RegisterRequestModel(
                      username: username!,
                      password: password!,
                      address: address!,
                      gender: gender!,
                      age: age!,
                      email: email!);

                  tokenController.register(model).then((response) {
                    setState(() {
                      isAPICallProcess = false;
                    });

                    if (response.data != null) {
                      FormHelper.showSimpleAlertDialog(
                          context, Config.appName, "Success Add User", "OK",
                          () {
                        // Navigator.pop(context);
                        Get.toNamed('/login');
                      });
                    } else {
                      FormHelper.showSimpleAlertDialog(
                          context, Config.appName, response.message, "OK", () {
                        Navigator.pop(context);
                      });
                    }
                  });
                }
              },
              btnColor: HexColor("#283B71"),
              borderColor: Colors.white,
              txtColor: Colors.white,
              borderRadius: 10,
            ),
          ),
        ],
      ),
    );
  }
}
