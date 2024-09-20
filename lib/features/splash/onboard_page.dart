import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/config/app_colors.dart';
import '../../core/config/router.dart';
import '../../core/db/prefs.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_r.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int id = 1;
  String title = 'Welcome to\nCoffee Expert Utility';
  String description =
      'Explore the world’s best coffee and freshly baked pastries at your fingertips. Find hidden gems in your city and savor every sip and bite.';

  void changeData() {
    setState(() {
      if (id == 2) {
        title = 'Stay Updated\nwith Coffee News';
        description =
            'Get the latest news and trends from the coffee world delivered right to your app. Stay in the loop with new café openings, coffee innovations, and industry insights.';
      } else if (id == 3) {
        title = 'Try Delicious\nCoffee Recipes';
        description =
            'Brew barista-quality coffee at home with our step-by-step recipes. From classic espresso to creative lattes, discover new ways to enjoy your favorite drink.';
      } else {
        title = 'Welcome to\nCoffee Expert Utility';
        description =
            'Explore the world’s best coffee and freshly baked pastries at your fingertips. Find hidden gems in your city and savor every sip and bite.';
      }
    });
  }

  void onNext() async {
    if (id == 3) {
      await saveOnboard().then((value) {
        if (mounted) context.go(Routes.home);
      });
    } else {
      id++;
      changeData();
    }
  }

  void changePage(int index) {
    id = index;
    changeData();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      splash: true,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: 350,
                height: 350,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset('assets/onboard$id.svg'),
                    Image.asset(
                      'assets/onboard$id.png',
                      width: 320,
                      height: 320,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              SizedBox(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                      onPressed: () {
                        changePage(1);
                      },
                      padding: const EdgeInsets.all(5),
                      minSize: 10,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: id == 1 ? 10 : 4,
                        width: id == 1 ? 4 : 10,
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        changePage(2);
                      },
                      padding: const EdgeInsets.all(5),
                      minSize: 10,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: id == 2 ? 10 : 4,
                        width: id == 2 ? 4 : 10,
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        changePage(3);
                      },
                      padding: const EdgeInsets.all(5),
                      minSize: 10,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        height: id == 3 ? 10 : 4,
                        width: id == 3 ? 4 : 10,
                        decoration: BoxDecoration(
                          color: AppColors.main,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              TextE(
                title,
                fontSize: 24,
                textAlign: TextAlign.center,
                color: AppColors.text1,
              ),
              const SizedBox(height: 14),
              SizedBox(
                height: 100,
                child: TextM(
                  description,
                  fontSize: 14,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                  color: AppColors.text4,
                ),
              ),
              const Spacer(),
              PrimaryButton(
                title: id == 3 ? 'Get Started' : 'Next',
                onPressed: onNext,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
