import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_start/Managers/user.dart';
import 'package:flutter_start/Utils/form.dart';
import '.././Managers/http_requests.dart';
import 'dart:convert';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignUp());
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormBuilderState>();

  String userName = "XYZ";
  User? user;
  List<CustomTextFormFieldData> formMapper = [
    CustomTextFormFieldData(
        label: "Full Name Test",
        validators: [FormBuilderValidators.required()],
        defaulValue: "Shikhar"),
    CustomTextFormFieldData(
        label: "Mobile Number",
        validators: [FormBuilderValidators.required()],
        defaulValue: "8052846555"),
    CustomTextFormFieldData(
        label: "Password",
        validators: [FormBuilderValidators.required()],
        defaulValue: "pwd"),
  ];
  void onSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.instantValue.entries.forEach((element) {
        if (element.key == "Full Name Test") {
          User user = User(name: element.value);
          signUpAPI(user).then((result) {
            Map<String, dynamic> jsonMap = json.decode(result);
            globalUserState.createOrUpdateUser(jsonMap["user"]["name"]);
            final sessionManager = SessionManager();
            sessionManager.set("token", jsonMap["token"]);
            sessionManager.set("phone", "8052846555");
            Navigator.pushNamed(context, '/vendor-business');
          });
          return;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Stack(fit: StackFit.expand, children: [
        Opacity(
            opacity: 0.6,
            child: Image.asset(
              "lib/images/sadi_2.jpeg", // Replace with your image path
              fit: BoxFit.cover,
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 50)),
            ...formMapper.map(
              (customFormData) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: FormBuilderTextField(
                    name: customFormData.label,
                    initialValue: customFormData.defaulValue,
                    decoration: InputDecoration(
                        labelText: customFormData.label,
                        border: const OutlineInputBorder()),
                    validator: FormBuilderValidators.compose(
                        customFormData.validators),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
            ElevatedButton(
              onPressed: onSignUp,
              child: const Text('Sign Up!'),
            )
          ],
        )
      ]),
    );
  }
}
