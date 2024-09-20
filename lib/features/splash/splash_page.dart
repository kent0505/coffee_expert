import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/app_colors.dart';
import '../../core/config/router.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';
import '../recipes/bloc/recipes_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool loading = false;

  void load() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        loading = true;
      });
    });

    if (mounted) context.read<RecipesBloc>().add(GetRecipesEvent());

    await getData().then((onboard) {
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          if (onboard) {
            context.go(Routes.onboard);
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
    return CustomScaffold(
      splash: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 165,
              width: 165,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 106,
                ),
              ),
            ),
            const SizedBox(height: 74),
            Container(
              height: 9,
              width: 165,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.text1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    height: 5,
                    width: loading ? 161 : 0,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const TextB(
              'Loading...',
              fontSize: 12,
              color: AppColors.text1,
            ),
          ],
        ),
      ),
    );
  }
}
