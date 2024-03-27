import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_start/Managers/http_requests.dart';
import 'package:flutter_start/Managers/imagepicker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_start/Managers/user.dart';
import 'package:flutter_start/Utils/form.dart';
import 'dart:convert';

class VendorBusinessPage extends StatelessWidget {
  const VendorBusinessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: VendorBusiness());
  }
}

class VendorBusiness extends StatefulWidget {
  const VendorBusiness({super.key});

  @override
  State<VendorBusiness> createState() => _VendorBusinessState();
}

class _VendorBusinessState extends State<VendorBusiness> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _imagesKey = GlobalKey<ImagePickerExampleState>();
  List<CustomTextFormFieldData> formMapper = [
    CustomTextFormFieldData(
        label: "Business Category",
        validators: [FormBuilderValidators.required()],
        defaulValue: "Wedding"),
  ];
  List<File> images = [];
  void addVendorBusinessDetails() {
    // print(_imagesKey.currentState!.images);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.instantValue.entries.forEach((element) {
        if (element.key == "Business Category") {
          User user = User(name: element.value);
          signUpAPI(user).then((result) {
            Map<String, dynamic> jsonMap = json.decode(result);
            globalUserState.createOrUpdateUser(jsonMap["user"]["name"]);
            Navigator.pushNamed(context, '/vendor-address');
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
            ImagePickerExample(key: _imagesKey),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
            ElevatedButton(
              onPressed: addVendorBusinessDetails,
              child: const Text('Submit details'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            )
          ],
        )),
      ]),
    );
  }
}
