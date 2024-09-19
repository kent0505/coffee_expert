import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/router.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/loading_widget.dart';
import '../test/bloc/test_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    context.read<TestBloc>().add(GetTestEvent());

    await getData().then((onboard) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            // context.go(Routes.onboard);
            context.go(Routes.home);
          } else {
            context.go(Routes.home);
          }
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      splash: true,
      body: LoadingWidget(),
    );
  }
}
