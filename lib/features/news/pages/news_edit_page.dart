import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/news_bloc.dart';

class NewsEditPage extends StatefulWidget {
  const NewsEditPage({super.key, required this.news});

  final News news;

  @override
  State<NewsEditPage> createState() => _NewsEditPageState();
}

class _NewsEditPageState extends State<NewsEditPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = true;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  void onPickImage() async {
    image = await pickImage();
    if (image.path.isNotEmpty) {
      controller3.text = image.path;
      checkActive();
    }
  }

  void onEdit() {
    context.read<NewsBloc>().add(
          EditNewsEvent(
            news: News(
              id: widget.news.id,
              title: controller1.text,
              content: controller2.text,
              image: controller3.text,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: 'Delete News?',
          onYes: () {
            context.read<NewsBloc>().add(DeleteNewsEvent(id: widget.news.id));
            context.pop();
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.news.title;
    controller2.text = widget.news.content;
    controller3.text = widget.news.image;
    image = XFile(widget.news.image);
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
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppbar(
                title: 'Edit News',
                settings: false,
                delete: true,
                onDelete: onDelete,
              ),
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
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return CachedNetworkImage(
                                            imageUrl: controller3.text,
                                            fit: BoxFit.cover,
                                            errorWidget: (context, url, error) {
                                              return Image.asset(
                                                'assets/varieties1.png',
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const TextM(
                      'News Title',
                      fontSize: 12,
                      color: AppColors.main,
                    ),
                    const SizedBox(height: 10),
                    TxtField(
                      controller: controller1,
                      hintText: 'Title',
                      onChanged: checkActive,
                    ),
                    const SizedBox(height: 24),
                    const TextM(
                      'Content',
                      fontSize: 12,
                      color: AppColors.main,
                    ),
                    const SizedBox(height: 10),
                    TxtField(
                      controller: controller2,
                      hintText: 'Enter',
                      multiline: true,
                      onChanged: checkActive,
                    ),
                    SizedBox(height: 70 + 56 + 24 + getBottom(context)),
                  ],
                ),
              ),
            ],
          ),
          PrimaryButton(
            title: 'Save Changes',
            active: active,
            bottom: true,
            edit: true,
            onPressed: onEdit,
          ),
        ],
      ),
    );
  }
}
