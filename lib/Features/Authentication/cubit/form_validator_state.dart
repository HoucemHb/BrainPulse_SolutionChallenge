part of 'form_validator_cubit.dart';

@immutable
abstract class FormValidatorState {
  final String ID;
  final String password;
  final bool obscureText;
  final bool isErrorID;
  final bool isErrorPassword;
  final bool isSelectedID;
  final bool isSelectedPassword;

  const FormValidatorState({
    this.isErrorID = false,
    this.isErrorPassword = false,
    this.ID = '',
    this.password = '',
    this.obscureText = true,
    this.isSelectedID = false,
    this.isSelectedPassword = false,
  });

  FormValidatorState copyWith(
      {String? ID,
      String? password,
      bool? obscureText,
      bool? isErrorID,
      bool? isErrorPassword,
      bool? isSelectedID,
      bool? isSelectedPassword});
}

class FormValidatorUpdate extends FormValidatorState {
  const FormValidatorUpdate({
    String ID = '',
    String password = '',
    bool obscureText = true,
    bool isErrorId = false,
    bool isErrorPassword = false,
    bool isSelectedID = false,
    bool isSelctedPassword = false,
  }) : super(
            ID: ID,
            password: password,
            obscureText: obscureText,
            isErrorID: isErrorId,
            isErrorPassword: isErrorPassword,
            isSelectedID: isSelectedID,
            isSelectedPassword: isSelctedPassword);

  @override
  FormValidatorUpdate copyWith(
      {String? ID,
      String? password,
      bool? obscureText,
      bool? isErrorID,
      bool? isErrorPassword,
      bool? isSelectedID,
      bool? isSelectedPassword}) {
    return FormValidatorUpdate(
        ID: ID ?? this.ID,
        password: password ?? this.password,
        obscureText: obscureText ?? this.obscureText,
        isErrorId: isErrorID ?? this.isErrorID,
        isErrorPassword: isErrorPassword ?? this.isErrorPassword,
        isSelectedID: isSelectedID ?? this.isSelectedID,
        isSelctedPassword: isSelectedPassword ?? this.isSelectedPassword);
  }
}
