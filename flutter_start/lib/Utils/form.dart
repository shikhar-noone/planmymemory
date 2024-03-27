// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTextFormFieldData {
  String label;
  List<FormFieldValidator<dynamic>> validators;
  final dynamic defaulValue;
  CustomTextFormFieldData(
      {required this.label, required this.validators, this.defaulValue});
}
