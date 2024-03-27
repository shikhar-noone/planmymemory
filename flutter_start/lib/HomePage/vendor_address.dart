import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_start/Managers/http_requests.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_start/Managers/user.dart';
import 'package:flutter_start/Utils/form.dart';
import 'dart:convert';

class VendorAddressPage extends StatelessWidget {
  const VendorAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: VendorAddress());
  }
}

class VendorAddress extends StatefulWidget {
  const VendorAddress({super.key});

  @override
  State<VendorAddress> createState() => _VendorAddressState();
}

class _VendorAddressState extends State<VendorAddress> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<CustomTextFormFieldData> formMapper = [
    CustomTextFormFieldData(
        label: "Address line 1",
        validators: [FormBuilderValidators.required()],
        defaulValue: "B-104"),
    CustomTextFormFieldData(
        label: "Address line 2",
        validators: [FormBuilderValidators.required()],
        defaulValue: "Euphoria corporates"),
    CustomTextFormFieldData(
        label: "City",
        validators: [FormBuilderValidators.required()],
        defaulValue: "Bengaluru"),
    CustomTextFormFieldData(
        label: "State",
        validators: [FormBuilderValidators.required()],
        defaulValue: "Uttar pradesh"),
    CustomTextFormFieldData(
        label: "Pin Code",
        validators: [FormBuilderValidators.required()],
        defaulValue: "272002"),
    CustomTextFormFieldData(
        label: "Country",
        validators: [FormBuilderValidators.required()],
        defaulValue: "India"),
  ];
  void addVendorAddress() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.instantValue.entries.forEach((element) {
        if (element.key == "Full Name Test") {
          User user = User(name: element.value);
          signUpAPI(user).then((result) {
            Map<String, dynamic> jsonMap = json.decode(result);
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
        SingleChildScrollView(
            child: Column(
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
              onPressed: addVendorAddress,
              child: const Text('➕ Add address'),
            )
          ],
        ))
      ]),
    );
  }
}
