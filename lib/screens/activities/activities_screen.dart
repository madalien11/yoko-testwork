import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yoko_testwork/common/dependencies/injection_container.dart';
import 'package:yoko_testwork/common/widgets/buttons/chevron_icon.dart';
import 'package:yoko_testwork/const/text_styles.dart';
import 'package:yoko_testwork/models/activity/activity_model.dart';
import 'package:yoko_testwork/screens/auth/bloc/auth_bloc.dart';
import 'package:yoko_testwork/screens/auth/login_screen.dart';

import 'bloc/activity_bloc.dart';
import 'widgets/activity_card.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({Key? key}) : super(key: key);

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  List<ActivityModel> _activities = [];

  bool _isLoading = false;
  bool _showError = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    context.read<ActivityBloc>().add(GetActivities());
  }

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
              child: BlocListener<ActivityBloc, ActivityState>(
                listener: (context, state) async {
                  if (state is ActivitiesLoading) {
                    setState(() => _isLoading = true);
                  } else {
                    setState(() => _isLoading = false);
                  }

                  if (state is ActivitiesSuccessful) {
                    _activities.addAll(state.activities);
                    if (_activities.isNotEmpty) {
                      setState(() => _showError = false);
                    }
                  } else if (state is ActivitiesUnsuccessful) {
                    setState(() {
                      _showError = true;
                      _errorMessage = state.errorMessage;
                    });
                  }
                },
                child: _isLoading
                    ? const Center(child: CupertinoActivityIndicator())
                    : _showError
                        ? Center(
                            child: Text(
                            _errorMessage,
                            style: kBlackBoldTextTS,
                          ))
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            itemCount: _activities.length,
                            itemBuilder: (context, i) => ActivityCard(
                              activityModel: _activities[i],
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
