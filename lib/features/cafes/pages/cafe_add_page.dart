import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/cafe.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/cafes_bloc.dart';

class CafeAddPage extends StatefulWidget {
  const CafeAddPage({super.key});

  @override
  State<CafeAddPage> createState() => _CafeAddPageState();
}

class _CafeAddPageState extends State<CafeAddPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
      ]);
    });
  }

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  void onPickImage() async {
    image = await pickImage();
    if (image.path.isNotEmpty) {
      controller4.text = image.path;
      checkActive();
    }
  }

  void onSave() {
    context.read<CafesBloc>().add(
          AddCafesEvent(
            cafe: Cafe(
              id: getCurrentTimestamp(),
              title: controller1.text,
              location: controller2.text,
              description: controller3.text,
              image: controller4.text,
            ),
          ),
        );
    context.pop();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const CustomAppbar(title: 'Add New Cafe'),
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
                        CupertinoButton(
                          onPressed: onPickImage,
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: AppColors.main,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: image.path.isEmpty
                                ? const Center(child: TextM('+', fontSize: 16))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: Image.file(
                                        File(image.path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const TextM(
                      'Name of Cafe',
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
                      'Location',
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
                      'Description',
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
                    const SizedBox(height: 70 + 56 + 14),
                  ],
                ),
              ),
            ],
          ),
          PrimaryButton(
            title: 'Save Changes',
            active: active,
            bottom: true,
            add: true,
            onPressed: onSave,
          ),
        ],
      ),
    );
  }
}
