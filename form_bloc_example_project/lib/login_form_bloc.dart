import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

/*
FormBloc<SuccessResponse, FailureResponse>
For both <SuccessResponse, FailureResponse>
We must indicate what is the type of data these fields are in this example we will use String for both fields
SuccessResponse is the type of data data we will get when the form is submitted successfully
FailureResponse is the type of data data we will get when the form fails to submit.
 */
class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  final showSuccessResponse = BooleanFieldBloc();

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
        showSuccessResponse,
      ],
    );
  }

  /*
  This method will be called every time we call submit only if all the fields are valid
  When this method is called  the state of the form will be "FormBlocSubmitting"
   */
  @override
  Future<FutureOr<void>> onSubmitting() async {
    debugPrint(email.value);
    debugPrint(password.value);
    debugPrint(showSuccessResponse.value.toString());

    await Future<void>.delayed(const Duration(seconds: 1));

    //Here we emit either success or failure since we set their values to String we can also add a String to add a message to the success or failure
    if (showSuccessResponse.value) {
      emitSuccess();
    } else {
      emitFailure(failureResponse: 'This is an awesome error!');
    }
  }
}