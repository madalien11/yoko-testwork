import 'package:flutter/material.dart';
import 'package:yoko_testwork/common/enums/enums.dart';
import 'package:yoko_testwork/common/validation/validators.dart';
import 'package:yoko_testwork/common/widgets/buttons/social_media_button.dart';
import 'package:yoko_testwork/common/widgets/text_fields/rounded_text_field.dart';
import 'package:yoko_testwork/const/colors.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:yoko_testwork/screens/activities/activities_screen.dart';

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
            child: Form(
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
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
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
                          ? const Icon(Icons.visibility, color: Colors.white)
                          : const Icon(Icons.visibility_off,
                              color: Colors.white),
                    ),
                  ),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ActivitiesScreen(),
                        ),
                      );
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
                          style: TextStyle(
                            color: kWhite100,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Забыли пароль?');
                        },
                        child: const Text(
                          'Забыли пароль?',
                          style: TextStyle(
                            color: kWhite35,
                            fontSize: 14,
                          ),
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
                          style: TextStyle(
                            fontSize: 14,
                            color: kWhite100,
                          ),
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
    );
  }
}
