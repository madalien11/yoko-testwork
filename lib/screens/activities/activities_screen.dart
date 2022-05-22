import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoko_testwork/common/dependencies/injection_container.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/screens/auth/bloc/auth_bloc.dart';
import 'package:yoko_testwork/screens/auth/login_screen.dart';

import 'widgets/activity_card.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                ChevronIcon(
                  size: 50,
                  onTap: () {
                    var box = Hive.box('tokens');
                    box.delete("accessToken");
                    box.delete("refreshToken");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => AuthBloc(authServices: getIt()),
                          child: const LoginScreen(),
                        ),
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: Text(
                    'Активности',
                    textAlign: TextAlign.center,
                    style: kAppBarBlackTS,
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: 10,
                itemBuilder: (context, index) => const ActivityCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
