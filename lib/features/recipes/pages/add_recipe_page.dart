import 'package:flutter/material.dart';

import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'Add New Recipe'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                const SizedBox(height: 28),
                const TextM(
                  'Add Photo',
                  fontSize: 12,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: AppColors.main,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Center(
                        child: TextM('+', fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const TextM(
                  'Name of the Product',
                  fontSize: 12,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller1,
                  hintText: 'Name',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextM(
                  'Ingredients',
                  fontSize: 12,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller2,
                  hintText: 'Enter',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 24),
                const TextM(
                  'Recipe',
                  fontSize: 12,
                  color: AppColors.main,
                ),
                const SizedBox(height: 10),
                TxtField(
                  controller: controller3,
                  hintText: 'Enter',
                  multiline: true,
                  onChanged: checkActive,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
