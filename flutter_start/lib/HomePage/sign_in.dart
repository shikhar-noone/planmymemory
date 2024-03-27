import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:flutter_start/Managers/http_requests.dart';
import 'package:flutter_start/Managers/user.dart';
import 'package:flutter_start/Utils/form.dart';
import 'package:flutter_start/css/text.dart';
import 'dart:convert';

import 'package:form_builder_validators/form_builder_validators.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SignIn());
  }
}

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormBuilderState>();
  String? isRequiredCheck(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  List<CustomTextFormFieldData> formMapper = [
    CustomTextFormFieldData(
      label: "Mobile Number",
      validators: [FormBuilderValidators.required()],
    ),
    CustomTextFormFieldData(
      label: "Password",
      validators: [FormBuilderValidators.required()],
    ),
  ];

  void onSignIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.instantValue.entries.forEach((element) {
        if (element.key == "Mobile Number") {
          signInAPI(element.value).then((res) {
            Map<String, dynamic> jsonMap = json.decode(res);
            final sessionManager = SessionManager();
            sessionManager.set("token", jsonMap["token"]);
            sessionManager.set("phone", "8052846555");
            globalUserState.createOrUpdateUser(jsonMap["user"]["name"]);
            Navigator.pushNamed(context, '/homepage');
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 90)),
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
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(
              onPressed: onSignIn,
              child: const Text(
                'Sign In!',
                style: MyTextStyle.bodyStyle,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Not a member"),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/signup");
                    },
                    child: const Text('Sign Up!'),
                  ),
                ])
          ],
        )
      ]),
    );
  }
}
