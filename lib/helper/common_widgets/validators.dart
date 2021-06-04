import 'dart:math';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

  bool validateAndSaveForm(GlobalKey<FormState> key) {
    final myFormKey = key.currentState;
    if (myFormKey!.validate()) {
      myFormKey.save();
      return true;
    }
    return false;
  }

  final keyValidator = MultiValidator([
    RequiredValidator(errorText: 'key is required'),
    CheckCorrectKeyValidator("Enter vaild key")
  ]);


final plainTextValidator = MultiValidator([
  RequiredValidator(errorText: 'plain text is required'),
]);


class CheckCorrectKeyValidator extends FieldValidator<String>{
  CheckCorrectKeyValidator(String errorText) : super(errorText);

  @override
  bool isValid(String value) {
    int keyLength=value.length;
    double temp=sqrt(keyLength);
    int temp2=sqrt(keyLength).toInt();
    if(temp==temp2)
      return true;
    return false;
  }
}