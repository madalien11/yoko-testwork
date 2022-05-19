import 'package:flutter/material.dart';
import 'common/widgets/text_fields/rounded_text_field.dart';
import 'const/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoko Test',
      theme: ThemeData(
        primaryColor: kPrimaryBlueColor,
        fontFamily: 'Lato',
        errorColor: kPrimaryRedColor,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                RoundedTextField(
                  hintText: 'E-mail',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                RoundedTextField(
                  hintText: 'Пароль',
                  controller: _passwordController,
                  isObscure: _isObscure,
                  suffix: GestureDetector(
                    onTap: () {
                      setState(() => _isObscure = !_isObscure);
                    },
                    child: _isObscure
                        ? const Icon(Icons.visibility, color: Colors.white)
                        : const Icon(Icons.visibility_off, color: Colors.white),
                  ),
                ),
                RoundedTextField(
                  hintText: 'Войти',
                  onTap: () {
                    print('Log in');
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
                // TextButton(
                //   onPressed: () {},
                //   child: const Text(
                //     'Войти',
                //     style: TextStyle(
                //       color: kWhite5,
                //       fontSize: 16,
                //     ),
                //   ),
                //   style: ButtonStyle(
                //     backgroundColor: MaterialStateProperty.all(kWhite04),
                //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //         side: const BorderSide(color: kWhite08),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
