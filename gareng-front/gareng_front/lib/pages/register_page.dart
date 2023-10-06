import 'package:flutter/material.dart';
import 'package:gareng_front/config.dart';
import 'package:gareng_front/constants/custom_style.dart';
import 'package:gareng_front/models/register_request_model.dart';
import 'package:gareng_front/models/token_controller.dart';
import 'package:gareng_front/services/api_service.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

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
  String gender = 'male';
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
        backgroundColor: Colors.white,
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAPICallProcess,
          opacity: 0.3,
          child: Form(
            key: globalFormKey,
            child: _registerUI(context),
          ),
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
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 60),
            child: Row(
              children: [
                // Icon(
                //   Icons.food_bank_outlined,
                //   size: 75,
                // ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logoFood.png'),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                ),
                Text(
                  "Food App",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: customBlack),
                ),
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
                  fontSize: 45,
                  color: customBlack),
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
              prefixIcon: const Icon(Icons.password),
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
              borderFocusColor: customBlack,
              prefixIcon: const Icon(Icons.person_pin),
              showPrefixIcon: true,
              prefixIconColor: customBlack,
              borderColor: Colors.grey,
              textColor: customBlack,
              hintColor: customBlack.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Gender: ",
                    style: blackText,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Radio<String>(
                      value: 'male',
                      fillColor: const MaterialStatePropertyAll(customBlack),
                      focusColor: customBlack,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text(
                      "Male",
                      style: blackText,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Radio<String>(
                      value: 'female',
                      fillColor: const MaterialStatePropertyAll(customBlack),
                      focusColor: customBlack,
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                    ),
                    const Text(
                      "Female",
                      style: blackText,
                    ),
                  ],
                ),
              ],
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
              borderFocusColor: customBlack,
              prefixIcon: const Icon(Icons.add_task_outlined),
              showPrefixIcon: true,
              prefixIconColor: customBlack,
              borderColor: Colors.grey,
              textColor: customBlack,
              hintColor: customBlack.withOpacity(0.7),
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
              borderFocusColor: customBlack,
              prefixIcon: const Icon(Icons.mail),
              showPrefixIcon: true,
              prefixIconColor: customBlack,
              borderColor: Colors.grey,
              textColor: customBlack,
              hintColor: customBlack.withOpacity(0.7),
              borderRadius: 10,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
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
                        gender: gender,
                        age: age!,
                        email: email!);

                    APIService.register(model).then((response) {
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
                            context, Config.appName, response.message, "OK",
                            () {
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
                    ;
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
            height: 50,
          )
        ],
      ),
    );
  }
}
