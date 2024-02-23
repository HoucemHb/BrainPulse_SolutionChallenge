import 'package:brain_pulse/Features/Authentication/cubit/form_validator_cubit.dart';
import 'package:brain_pulse/Features/Authentication/utils/brain_header.dart';
import 'package:brain_pulse/Global/main_button.dart';
import 'package:brain_pulse/Theme/pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormValidatorCubit(),
      child: const _LoginPageUI(),
    );
  }
}

class _LoginPageUI extends StatefulWidget {
  const _LoginPageUI({
    super.key,
  });

  @override
  State<_LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<_LoginPageUI> {
  late GlobalKey<FormFieldState<String>> _credentialKey;
  late GlobalKey<FormFieldState<String>> _passKey;
  late GlobalKey<FormFieldState<String>> _loginFormKey;
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _credentialKey = GlobalKey();
    _passKey = GlobalKey();
    _loginFormKey = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.marron,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Header
            const BrainHeader(),
            const Gap(40),

            //title
            Text(
              "Sign In",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Gap(40),
            //Form
            BlocBuilder<FormValidatorCubit, FormValidatorState>(
              builder: (context, state) {
                final formCubit = context.read<FormValidatorCubit>();

                return Form(
                  key: _loginFormKey,
                  child: SizedBox(
                    width: 93.w,
                    child: Column(
                      children: [
                        IDCredentialInput(
                            credentialKey: _credentialKey,
                            formCubit: formCubit,
                            controller: _idController),
                        const Gap(15),
                        PasswordInput(
                            passKey: _passKey,
                            formCubit: formCubit,
                            controller: _passController),
                        const Gap(20),
                      ],
                    ),
                  ),
                );
              },
            ),
            MainButton(
                color: AppColors.marronSecondary,
                text: "Sign in",
                iconPath: "assets/images/arrow_forword.png",
                onPressed: () {
                  _loginFormKey.currentState?.validate();
                }),
            const Spacer(),
            GestureDetector(
              onTap: () {
                //TODOO:
              },
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Don’t have an account? ',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontSize: 14)),
                    TextSpan(
                      text: 'Sign Up',
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
            const Gap(10),

            GestureDetector(
              onTap: () {
                //TODO:
              },
              child: Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    decorationColor: AppColors.orange,
                    decorationThickness: 3,
                    fontSize: 14,
                    color: AppColors.orange,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IDCredentialInput extends StatelessWidget {
  const IDCredentialInput(
      {super.key,
      required GlobalKey<FormFieldState<String>> credentialKey,
      required this.formCubit,
      required this.controller})
      : _credentialKey = credentialKey;

  final GlobalKey<FormFieldState<String>> _credentialKey;
  final FormValidatorCubit formCubit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: controller,
      inputKey: _credentialKey,
      isSelcted: formCubit.state.isSelectedID,
      isError: formCubit.state.isErrorID,
      labelText: 'ID Credential',
      hintText: 'Bosch\$\$Intern123DFA',
      error: Text.rich(
        TextSpan(children: [
          TextSpan(
              text: "Invalid ID! Please Try Again or Contact ",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColors.orange, fontSize: 11)),
          TextSpan(
              text: "Support For Assistance",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 11))
        ]),
      ),
      onFocusChange: (value) {
        formCubit.toggleIsSelectedID(value);
        if (!value) if (_credentialKey.currentState!.validate()) {
          print("Text is valid");
        } else {
          print('text mahouwech');
          // formCubit.toggleIsErrorID(true);
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          formCubit.toggleIsErrorID(true);
        } else {
          formCubit.toggleIsErrorID(false);
        }
        return null;
      },
      prefixIcon: "assets/images/email.png",
      suffixIcon: Image.asset("assets/images/down.png"),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput(
      {super.key,
      required GlobalKey<FormFieldState<String>> passKey,
      required this.formCubit,
      required this.controller})
      : _passKey = passKey;

  final GlobalKey<FormFieldState<String>> _passKey;
  final FormValidatorCubit formCubit;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Input(
      controller: controller,
      obscureText: formCubit.state.obscureText,
      inputKey: _passKey,
      isSelcted: formCubit.state.isSelectedPassword,
      isError: formCubit.state.isErrorPassword,
      labelText: "Password",
      hintText: "Enter your password..",
      error: Text(
        "Please enter a valid password",
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: AppColors.orange, fontSize: 11),
      ),
      onFocusChange: (value) {
        formCubit.toggleIsSelectedPassword(value);
        if (!value) {
          if (_passKey.currentState!.validate()) {
            print("Text is valid");
          } else {
            print('text mahouwech');
            // formCubit.toggleIsErrorID(true);
          }
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          formCubit.toggleIsErrorPassword(true);
        } else {
          formCubit.toggleIsErrorPassword(false);
        }
        return null;
      },
      prefixIcon: "assets/images/lock_icon.png",
      suffixIcon: GestureDetector(
        onTap: () {
          formCubit.toggleObscureText();
        },
        child: Image.asset("assets/images/eye.png",
            color: formCubit.state.obscureText ? null : Colors.white),
      ),
    );
  }
}

class Input extends StatelessWidget {
  final String prefixIcon;
  final Widget suffixIcon;
  final String labelText;
  final String hintText;
  final Widget error;
  final bool isError;
  final bool isSelcted;
  final bool obscureText;
  final Function(bool) onFocusChange;
  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState> inputKey;
  final TextEditingController controller;
  const Input({
    super.key,
    required this.labelText,
    required this.error,
    required this.isError,
    required this.isSelcted,
    required this.onFocusChange,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.inputKey,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    print(labelText);
    print(isError);
    print(isSelcted);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 14),
        ),
        const Gap(5),
        DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1234),
              boxShadow: isError
                  ? [
                      BoxShadow(
                          color: AppColors.orange.withOpacity(0.3),
                          offset: Offset.zero,
                          blurRadius: 0,
                          spreadRadius: 4)
                    ]
                  : isSelcted
                      ? [
                          BoxShadow(
                              color: AppColors.green.withOpacity(0.3),
                              offset: Offset.zero,
                              blurRadius: 0,
                              spreadRadius: 4)
                        ]
                      : null),
          child: Focus(
            onFocusChange: onFocusChange,
            child: Column(
              children: [
                TextFormField(
                    onChanged: (value) {
                      print(controller.text);
                    },
                    controller: controller,
                    textInputAction: TextInputAction.next,
                    obscureText: obscureText,
                    obscuringCharacter: '*',
                    clipBehavior: Clip.antiAlias,
                    key: inputKey,
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: AppColors.lightGrey, fontSize: 16),
                      contentPadding: const EdgeInsets.all(20),
                      prefixIcon: Image.asset(prefixIcon),
                      suffixIcon: suffixIcon,
                      filled: true,
                      fillColor: AppColors.marronSecondary2,
                      border: InputBorder.none,
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(1234)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(1234)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  isError ? AppColors.orange : AppColors.green),
                          borderRadius: BorderRadius.circular(1234)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.orange),
                          borderRadius: BorderRadius.circular(1234)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.orange),
                          borderRadius: BorderRadius.circular(1234)),
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 16),
                    validator: validator),
              ],
            ),
          ),
        ),
        const Gap(13),
        isError
            ? Container(
                width: 100.w,
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xff432500),
                  borderRadius: BorderRadius.circular(1234),
                  border: Border.all(color: AppColors.orange),
                ),
                child: error)
            : Container(),
      ],
    );
  }
}
