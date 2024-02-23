import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'form_validator_state.dart';

class FormValidatorCubit extends Cubit<FormValidatorState> {
  FormValidatorCubit() : super(const FormValidatorUpdate());

  void initForm({
    String ID = '',
    String password = '',
  }) {
    emit(state.copyWith(
      ID: ID,
      password: password,
    ));
  }

  void updateID(String? ID) {
    emit(state.copyWith(ID: ID));
  }

  void updatePassword(String? password) {
    emit(state.copyWith(password: password));
  }

  void toggleObscureText() {
    emit(state.copyWith(obscureText: !state.obscureText));
  }

  void toggleIsErrorID(bool value) {
    emit(state.copyWith(isErrorID: value));
  }

  void toggleIsErrorPassword(bool value) {
    emit(state.copyWith(isErrorPassword: value));
  }

  void toggleIsSelectedID(bool value) {
    emit(state.copyWith(isSelectedID: value));
  }

  void toggleIsSelectedPassword(bool value) {
    emit(state.copyWith(isSelectedPassword: value));
  }

  void reset() {
    emit(const FormValidatorUpdate());
  }
  
}
