import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_testwork/common/enums/enums.dart';
import 'package:yoko_testwork/common/validation/validators.dart';
import 'package:yoko_testwork/common/widgets/buttons/social_media_button.dart';
import 'package:yoko_testwork/common/widgets/text/error_message.dart';
import 'package:yoko_testwork/common/widgets/text_fields/rounded_text_field.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/screens/activities/activities_screen.dart';

import 'bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool _isPressed = false;
  bool _isLoading = false;
  bool _showError = false;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryBlueColor,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              kPrimaryBlueColor,
              kSecondaryBlueColor,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) async {
                if (state is LoginLoading) {
                  setState(() => _isLoading = true);
                } else {
                  setState(() => _isLoading = false);
                }

                if (state is LoginSuccessful) {
                  _emailController.clear();
                  _passwordController.clear();
                  setState(() => _showError = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ActivitiesScreen(),
                    ),
                  );
                } else if (state is LoginUnsuccessful) {
                  setState(() {
                    _showError = true;
                    _errorMessage = state.errorMessage;
                  });
                }
              },
              child: _isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : Form(
                      key: formkey,
                      onChanged: () {
                        if (formkey.currentState!.validate()) setState(() {});
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text(
                            'Добро пожаловать,\nАвторизуйтесь',
                            style: kHeader1TS,
                          ),
                          const SizedBox(height: 69),
                          RoundedTextField(
                            hintText: 'E-mail',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: MultiValidator([
                              requiredValidator,
                              emailValidator,
                            ]),
                          ),
                          RoundedTextField(
                            hintText: 'Пароль',
                            controller: _passwordController,
                            isObscure: _isObscure,
                            validator: MultiValidator([requiredValidator]),
                            suffix: GestureDetector(
                              onTap: () {
                                setState(() => _isObscure = !_isObscure);
                              },
                              child: _isObscure
                                  ? const Icon(Icons.visibility,
                                      color: Colors.white)
                                  : const Icon(Icons.visibility_off,
                                      color: Colors.white),
                            ),
                          ),
                          _showError
                              ? ErrorMessage(errorMessage: _errorMessage)
                              : const SizedBox(),
                          SizedBox(height: _showError ? 0 : 16),
                          RoundedTextField(
                            hintText: 'Войти',
                            fillColor: _emailController.text != "" &&
                                    _passwordController.text != ""
                                ? kWhite100
                                : kWhite4,
                            isGradient: _emailController.text != "" &&
                                    _passwordController.text != ""
                                ? true
                                : false,
                            onTap: _isPressed
                                ? null
                                : () {
                                    setState(() => _isPressed = true);

                                    if (formkey.currentState!.validate()) {
                                      FocusScope.of(context).unfocus();
                                      context.read<AuthBloc>().add(
                                            Login(
                                              email: _emailController.text,
                                              password:
                                                  _passwordController.text,
                                            ),
                                          );
                                    }

                                    setState(() => _isPressed = false);
                                  },
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print('registration');
                                },
                                child: const Text(
                                  'Регистрация',
                                  style: kWhiteTextTS,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('Забыли пароль?');
                                },
                                child: const Text(
                                  'Забыли пароль?',
                                  style: kGrayTextTS,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Center(
                                child: Text(
                                  'Или войдите через:',
                                  style: kWhiteTextTS,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocialMediaButton(
                                    socialMedia: SocialMediaEnum.google,
                                    onTap: () {
                                      print('Google');
                                    },
                                  ),
                                  SocialMediaButton(
                                    socialMedia: SocialMediaEnum.facebook,
                                    onTap: () {
                                      print('Facebook');
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
