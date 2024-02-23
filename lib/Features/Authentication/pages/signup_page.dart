import 'package:brain_pulse/Features/Authentication/cubit/form_validator_cubit.dart';
import 'package:brain_pulse/Features/Authentication/utils/auth_template.dart';
import 'package:brain_pulse/Features/Authentication/utils/input.dart';
import 'package:brain_pulse/Transition/slide_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../Global/main_button.dart';
import '../../../Theme/pallette.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidatorCubit(),
      child: const SignUpUI(),
    );
  }
}

final listFieldsFocus = [
  FocusNode(), //for id
  FocusNode(), //for pass
  FocusNode(), //for confirm pass
];

class SignUpUI extends StatefulWidget {
  const SignUpUI({super.key});

  @override
  State<SignUpUI> createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  late GlobalKey<FormFieldState<String>> _credentialKey;
  late GlobalKey<FormFieldState<String>> _passKey;
  late GlobalKey<FormFieldState<String>> _confirmPassKey;
  late GlobalKey<FormFieldState<String>> _signUpFormKey;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  @override
  void initState() {
    _credentialKey = GlobalKey();
    _passKey = GlobalKey();
    _signUpFormKey = GlobalKey();
    _confirmPassKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AuthTemplate(
      title: "Sign Up",
      form: Column(
        children: [
          BlocBuilder<FormValidatorCubit, FormValidatorState>(
            builder: (context, state) {
              final formCubit = context.read<FormValidatorCubit>();
              return Form(
                key: _signUpFormKey,
                child: SizedBox(
                  width: 93.w,
                  child: Column(
                    children: [
                      IDCredentialInput(
                          credentialKey: _credentialKey,
                          controller: _idController),
                      PasswordInput(
                        label: "Password",
                        passKey: _passKey,
                        controller: _passController,
                        onFieldSubmitted: (p0) {
                          FocusOnNextField(
                              context, listFieldsFocus[1], listFieldsFocus[2]);
                        },
                      ),
                      ConfirmPasswordInput(
                          label: "Password Confirmation",
                          confirmPassKey: _confirmPassKey,
                          controller: _confirmPassController),
                      MainButton(
                          color: AppColors.marronSecondary,
                          text: "Sign Up",
                          iconPath: "assets/images/arrow_forword.png",
                          onPressed: () {
                            if (_signUpFormKey.currentState?.validate() ??
                                false) {}
                          }),
                    ],
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(SlidingPageRoute(child: const SignUp()));
            },
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 14)),
                  TextSpan(
                    text: 'Sign In',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                        color: AppColors.orange,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.orange,
                        decorationThickness: 3),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
